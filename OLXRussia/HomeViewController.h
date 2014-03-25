//
//  HomeViewController.h
//  OLXRussia
//
//  Created by Rejo Joseph on 19/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIButton *revealButton;
@property (strong, nonatomic) IBOutlet UIImageView *shuffleImageView;
@property (strong, nonatomic) IBOutlet UICollectionView *menuGridView;

- (IBAction)settingsClick:(id)sender;

-(void)receivedMainMenuResponse:(NSMutableData *)data;

@end


