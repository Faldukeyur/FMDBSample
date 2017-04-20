//
//  ViewController.h
//  MMDesignDemo
//
//  Created by keyur on 17/04/17.
//  Copyright © 2017 Keyur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MaterialTextField/MaterialTextField.h>
#import "MDButton.h"
#import "MDToast.h"

@interface ViewController : UIViewController<UITextFieldDelegate,MDButtonDelegate>

@property (nonatomic,strong) IBOutlet MFTextField *txtsname;
@property (nonatomic,strong) IBOutlet MFTextField *txtEmail;
@property (nonatomic,strong) IBOutlet MFTextField *txtPhone;

@property (nonatomic,strong) IBOutlet MDButton *btnSave;
@property (nonatomic,strong) IBOutlet MDButton *btnUpdate;


-(IBAction)onButtonClick:(id)sender;
-(IBAction)onUpdateClick:(id)sender;

@end

