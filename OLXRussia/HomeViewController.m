//
//  HomeViewController.m
//  OLXRussia
//
//  Created by Rejo Joseph on 19/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import "HomeViewController.h"
#import "SWRevealViewController.h"
#import "CategoryListViewController.h"
#import "URLConnection.h"
#import "Constants.h"
#import "RestCall.h"
#import "Utils.h"
@interface HomeViewController ()
{
    NSArray *MenuArray;
    NSArray *ResponseArray;
    
    NSString *selectedID;
}
@end

@implementation HomeViewController

- (void)viewDidLoad
{
    
    //[Utils showProgress];
    [_revealButton addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
//    
//    MenuArray = [NSArray arrayWithObjects:@"Item1",@"Item2",@"Item3",@"Item4",@"Item5",@"Item6",@"Item7",@"Item8",@"Item9",@"Item10",@"Item11",@"Item12", nil];
    
    _shuffleImageView.animationImages=[NSArray arrayWithObjects:
                       [UIImage imageNamed:@"testimg.png"],
                       [UIImage imageNamed:@"2.jpg"],
                       [UIImage imageNamed:@"3.jpg"],
                       [UIImage imageNamed:@"4.jpg"],
                       [UIImage imageNamed:@"7.jpg"],
                       [UIImage imageNamed:@"testimg.png"], nil];
    
     _shuffleImageView.animationDuration=10.0;
     _shuffleImageView.animationRepeatCount=0;
     [_shuffleImageView startAnimating];
    
    //[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];
    
//    NSMutableURLRequest *theRequest=[RestCall getMainMenuList:LocalBaseURL];
//    NSString *request=[NSString stringWithFormat:@"%@", theRequest];
//    if ([request isEqualToString:@"0"]) {
//    }else {
//        URLConnection *connection=[[URLConnection alloc] initWithMethodNameRequest:theRequest delegate:self identifier:@"MainMenuList"];
//        NSLog(@"conn %@",connection);
//    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.123.120/projects/newapp/"]];
    NSURLResponse *response = nil;
    NSError *error = nil;
    //getting the data
    NSData *newData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //json parse
    NSError *myError = nil;
    if (error) {
        
    }
    else
    {
        ResponseArray = [NSJSONSerialization JSONObjectWithData:newData options:NSJSONReadingMutableLeaves  error:&myError];

    }

    //Accessing JSON content
    
    [super viewDidLoad];
}

-(void)receivedMainMenuResponse:(NSMutableData *)data
{
    [Utils hideAlert];

    NSError *myError = nil;
    ResponseArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves  error:&myError];
    [_menuGridView reloadData];
}


- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return [ResponseArray count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = (UICollectionViewCell*)[cv dequeueReusableCellWithReuseIdentifier:@"GridCell" forIndexPath:indexPath];
    
    UIImageView *imagethumb = (UIImageView *) [cell viewWithTag:menuImageView];
    UILabel *titleLabel = (UILabel *) [cell viewWithTag:menuNameLbl];
    imagethumb.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[ResponseArray objectAtIndex:indexPath.row] objectForKey:@"logo_images"]]]];
    
    titleLabel.text = [[ResponseArray objectAtIndex:indexPath.row] objectForKey:@"logo_name"];
    
    return cell;
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    selectedID = [[ResponseArray objectAtIndex:indexPath.row] objectForKey:@"logo_id"];
    [self performSegueWithIdentifier:@"movetoCategory" sender:self];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"movetoCategory"])
    {
        // Get reference to the destination view controller
        CategoryListViewController *categoryWindow = [segue destinationViewController];
        [categoryWindow setCategoryID:selectedID];
    }


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)settingsClick:(id)sender {
    

}
@end
