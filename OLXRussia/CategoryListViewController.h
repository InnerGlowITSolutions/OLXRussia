//
//  CategoryListViewController.h
//  OLXRussia
//
//  Created by Rejo Joseph on 19/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryListViewController : UIViewController
{
    
}

@property (strong, nonatomic) IBOutlet UITableView *CatetegoryListTable;
@property (strong, nonatomic) NSString *categoryID;
- (IBAction)backClick:(id)sender;

-(void)categoryListResponse:(NSMutableData *)data;


@end
