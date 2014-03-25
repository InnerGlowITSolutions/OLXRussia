//
//  CategoryDetailViewController.m
//  OLXRussia
//
//  Created by Rejo Joseph on 19/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import "CategoryDetailViewController.h"

@interface CategoryDetailViewController ()
{
    NSArray * slideShowImageArray;
}
@end

@implementation CategoryDetailViewController
@synthesize catId;
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
    _scrollView.autoresizingMask=UIViewAutoresizingNone;
    slideShowImageArray = [NSArray arrayWithObjects:@"testimg",@"1.jpg",@"2.jpg",@"3.jpg",@"testimg", nil];
    pageControl.numberOfPages=5;
    pageControl.autoresizingMask=UIViewAutoresizingNone;
    
    _scrollView.tag = 1;
    _scrollView.autoresizingMask=UIViewAutoresizingNone;
    [self setupScrollView:_scrollView];
    [_mainScrollView setContentSize:CGSizeMake(320, 1000)];


    [super viewDidLoad];
}

- (void)setupScrollView:(UIScrollView*)scrMain
{
    for (int i=0; i<[slideShowImageArray count]; i++)
    {
        CGRect frame;
        frame.origin.x = _scrollView.frame.size.width * i;
        frame.size = _scrollView.frame.size;
        _scrollView.pagingEnabled = YES;
        
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake((i)*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height)];

        // NSString *urlPath=[getimgPathArr objectAtIndex:i];
       // imgV.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlPath]]];

        imgV.image = [UIImage imageNamed:[slideShowImageArray objectAtIndex:i]];
        [_scrollView addSubview:imgV];
    }
 
    
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width*[slideShowImageArray count], _scrollView.frame.size.height)];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)nextClick:(id)sender
{
    _scrollView = (UIScrollView*) [self.view viewWithTag:1];

    pageControl = (UIPageControl*) [self.view viewWithTag:12];

    CGFloat contentOffset = _scrollView.contentOffset.x;

    int nextPage = (int)(contentOffset/_scrollView.frame.size.width) + 1 ;

    if( nextPage!=5 )  {
        [_scrollView scrollRectToVisible:CGRectMake(nextPage*_scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:YES];
        pageControl.currentPage=nextPage;
        // else start sliding form 1 :)
//    } else {
//        [_scrollView scrollRectToVisible:CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:YES];
//        pageControl.currentPage=0;
    }

}

- (IBAction)previousClick:(id)sender
{
    UIScrollView *scrMain = (UIScrollView*) [self.view viewWithTag:1];

    UIPageControl *pgCtr = (UIPageControl*) [self.view viewWithTag:12];

    CGFloat contentOffset = scrMain.contentOffset.x;

    int nextPage = (int)(contentOffset/scrMain.frame.size.width) - 1 ;

    if( nextPage!=10 )  {
        [scrMain scrollRectToVisible:CGRectMake(nextPage*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
        pgCtr.currentPage=nextPage;
        // else start sliding form 1 :)
//    } else {
//        [scrMain scrollRectToVisible:CGRectMake(0, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
//        pgCtr.currentPage=0;
    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 30;
}

-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView=[[UIView alloc] init];
    headerView.frame=CGRectMake(50, 10, 180, 30);
    headerView.backgroundColor=[UIColor grayColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 210, 25)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont fontWithName:@"AppleGothic" size:20];
//    if (section==0)
//    {
//        titleLabel.text = @"Contact Info";
//    }
//    else
//    {
        titleLabel.text = @"Comments";

//    }
    [headerView addSubview:titleLabel];
    return headerView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    
//    if (section==0) return 5;
//    else
        return 5;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *MyIdentifier = nil;
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    
    cell.textLabel.text = @"hi hello";
    return cell;
    
}

@end
