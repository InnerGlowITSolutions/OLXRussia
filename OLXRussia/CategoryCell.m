//
//  CategoryCell.m
//  OLXRussia
//
//  Created by Rejo Joseph on 19/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//

#import "CategoryCell.h"

@implementation CategoryCell

@synthesize categoryNameLabel;

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
