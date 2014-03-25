//
//  SubcatListViewController.h
//  OLXRussia
//
//  Created by Rejo Joseph on 21/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubcatListViewController : UIViewController


@property (strong, nonatomic) IBOutlet UITableView *SubCatetegoryListTable;

@property (strong, nonatomic) NSString *categoryID;
- (IBAction)backClick:(id)sender;
-(void)subcategoryListResponse:(NSMutableData *)data;

@end
