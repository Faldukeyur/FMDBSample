//
//  UpdateVC.h
//  MMDesignDemo
//
//  Created by keyur on 20/04/17.
//  Copyright © 2017 Keyur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MaterialTextField/MaterialTextField.h>
#import "MDButton.h"

@interface UpdateVC : UIViewController<UITextFieldDelegate,MDButtonDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrUpdateDetail;
    IBOutlet UITableView *tblview;
}
@property (nonatomic,strong) IBOutlet MFTextField *txtsname;
@property (nonatomic,strong) IBOutlet MFTextField *txtEmail;
@property (nonatomic,strong) IBOutlet MFTextField *txtPhone;
@property (nonatomic,strong) IBOutlet MDButton *btnSave;

-(IBAction)onSaveClick:(id)sender;
@end
