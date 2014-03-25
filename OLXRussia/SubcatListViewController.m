//
//  SubcatListViewController.m
//  OLXRussia
//
//  Created by Rejo Joseph on 21/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import "SubcatListViewController.h"
#import "CategoryDetailViewController.h"
#import "SubCategoryCell.h"
#import "URLConnection.h"
#import "Constants.h"
#import "RestCall.h"
#import "Utils.h"
@interface SubcatListViewController ()
{
    NSArray *subCategoryListArray;
    NSString *selectedsubCatID;
}
@end

@implementation SubcatListViewController
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
    
    NSString *url = [NSString stringWithFormat:@"%@sub_categories.php?catid=%@",LocalBaseURL,categoryID];
    
    NSMutableURLRequest *theRequest=[RestCall getCategoryList:url];
    NSString *request=[NSString stringWithFormat:@"%@", theRequest];
    if ([request isEqualToString:@"0"]) {
    }else {
        URLConnection *connection=[[URLConnection alloc] initWithMethodNameRequest:theRequest delegate:self identifier:@"SubCategoryList"];
        NSLog(@"conn %@",connection);
    }
    
    [super viewDidLoad];
    
}

-(void)subcategoryListResponse:(NSMutableData *)data;
{
    [Utils hideAlert];
    NSError *myError = nil;
    subCategoryListArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves  error:&myError];
    [_SubCatetegoryListTable reloadData];
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
    
    return [subCategoryListArray count];
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *MyIdentifier = @"SubCategoryCell";
    
    SubCategoryCell *cell = (SubCategoryCell *)[_SubCatetegoryListTable dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil) {
        cell = [[SubCategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    
    cell.categoryNameLabel.text = [[subCategoryListArray objectAtIndex:indexPath.row] objectForKey:@"subcategory_name"];
    cell.categorydetailTextLbl.text = @"category detai text summary";
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedsubCatID = [[subCategoryListArray objectAtIndex:indexPath.row] objectForKey:@"subcategory_id"];

    [self performSegueWithIdentifier:@"MovetoCategoryDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"MovetoCategoryDetail"])
    {
        // Get reference to the destination view controller
        CategoryDetailViewController *CategoryInfo = [segue destinationViewController];
        [CategoryInfo setCatId:selectedsubCatID];
    }
    
    
}

- (IBAction)backClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
