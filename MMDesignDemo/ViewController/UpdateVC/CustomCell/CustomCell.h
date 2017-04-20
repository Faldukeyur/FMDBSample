//
//  CustomCell.h
//  MMDesignDemo
//
//  Created by keyur on 20/04/17.
//  Copyright © 2017 Keyur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property(nonatomic,strong)IBOutlet UILabel *lblName;
@property(nonatomic,strong)IBOutlet UILabel *lblEmail;
@property(nonatomic,strong)IBOutlet UILabel *lblPhone;

@end
