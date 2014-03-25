//
//  SubCategoryCell.m
//  OLXRussia
//
//  Created by Rejo Joseph on 21/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import "SubCategoryCell.h"

@implementation SubCategoryCell
@synthesize categoryNameLabel,categorydetailTextLbl;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
