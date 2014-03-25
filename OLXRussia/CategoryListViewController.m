//
//  CategoryListViewController.m
//  OLXRussia
//
//  Created by Rejo Joseph on 19/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import "CategoryListViewController.h"
#import "SubcatListViewController.h"
#import "Constants.h"
#import "RestCall.h"
#import "Utils.h"
#import "URLConnection.h"
#import "CategoryCell.h"
@interface CategoryListViewController ()
{
    NSArray *categoryListArray;
    
    NSString *selectedCatID;
}
@end

@implementation CategoryListViewController
@synthesize categoryID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [Utils showProgress];
    
    NSString *url = [NSString stringWithFormat:@"%@categories.php?logoid=%@",LocalBaseURL,categoryID];
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
//    NSURLResponse *response = nil;
//    NSError *error = nil;
//    //getting the data
//    NSData *newData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//    //json parse
//    NSError *myError = nil;
//    
//    categoryListArray = [NSJSONSerialization JSONObjectWithData:newData options:NSJSONReadingMutableLeaves  error:&myError];
    
    
    
    NSMutableURLRequest *theRequest=[RestCall getCategoryList:url];
    NSString *request=[NSString stringWithFormat:@"%@", theRequest];
    if ([request isEqualToString:@"0"]) {
    }else {
        URLConnection *connection=[[URLConnection alloc] initWithMethodNameRequest:theRequest delegate:self identifier:@"CategoryList"];
        NSLog(@"conn %@",connection);
    }

    
    [super viewDidLoad];

}

-(void)categoryListResponse:(NSMutableData *)data;
{
    [Utils hideAlert];
    NSError *myError = nil;
    categoryListArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves  error:&myError];
    [_CatetegoryListTable reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [categoryListArray count];
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

        return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *MyIdentifier = @"CategoryCell";
    
    CategoryCell *cell = (CategoryCell *)[_CatetegoryListTable dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil) {
        cell = [[CategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    
    cell.categoryNameLabel.text = [[categoryListArray objectAtIndex:indexPath.row] objectForKey:@"category_name"];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedCatID = [[categoryListArray objectAtIndex:indexPath.row] objectForKey:@"category_id"];

    [self performSegueWithIdentifier:@"movetoSubCategory" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"movetoSubCategory"])
    {
        // Get reference to the destination view controller
        SubcatListViewController *subCategory = [segue destinationViewController];
        [subCategory setCategoryID:selectedCatID];
    }
    
    
}
- (IBAction)backClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
