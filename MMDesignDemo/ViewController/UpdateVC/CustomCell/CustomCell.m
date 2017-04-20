//
//  CustomCell.m
//  MMDesignDemo
//
//  Created by keyur on 20/04/17.
//  Copyright © 2017 Keyur. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize lblName,lblEmail,lblPhone;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
