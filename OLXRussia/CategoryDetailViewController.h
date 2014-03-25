//
//  CategoryDetailViewController.h
//  OLXRussia
//
//  Created by Rejo Joseph on 19/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryDetailViewController : UIViewController
{
    
    IBOutlet UIPageControl *pageControl;
}
- (IBAction)backClick:(id)sender;
- (IBAction)nextClick:(id)sender;
- (IBAction)previousClick:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (strong, nonatomic) IBOutlet UITableView *detailInfoTable;
@property (strong, nonatomic) NSString *catId;
@end
