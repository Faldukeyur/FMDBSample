//
//  ViewController.m
//  MMDesignDemo
//
//  Created by keyur on 17/04/17.
//  Copyright © 2017 Keyur. All rights reserved.
//

#import "ViewController.h"
#import "MDToast.h"
#import "StructureDemo.h"
#import "UpdateVC.h"

NSString *const MFDemoErrorDomain = @"MFDemoErrorDomain";
NSInteger const MFDemoErrorCode = 100;

@interface ViewController ()
{
    int count;
    MDToast *toast;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTextField2];
    [self setupTextField3];
    [self setupTextField4];

    
    toast = [[MDToast alloc] initWithText:@"" duration:kMDToastDurationShort];
    toast.backgroundColor = [UIColor colorWithRed:0 green:.2f blue:.5f alpha:.8f];
    toast.textFont = [UIFont systemFontOfSize:14];
    [toast setGravity:MDGravityCenterVertical | MDGravityCenterHorizontal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Setup

- (void)setupTextField1
{
    self.txtsname.animatesPlaceholder = NO;
    self.txtsname.tintColor = [UIColor mf_greenColor];
    self.txtsname.textColor = [UIColor mf_veryDarkGrayColor];
}

- (void)setupTextField2
{
    self.txtsname.tintColor = [UIColor mf_greenColor];
    self.txtsname.textColor = [UIColor mf_veryDarkGrayColor];
    self.txtsname.defaultPlaceholderColor = [UIColor mf_darkGrayColor];
    self.txtsname.placeholderAnimatesOnFocus = YES;
    
    UIFontDescriptor * fontDescriptor = [self.txtsname.font.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
    UIFont *font = [UIFont fontWithDescriptor:fontDescriptor size:self.txtsname.font.pointSize];
    
    self.txtsname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Name" attributes:@{NSFontAttributeName:font}];
}

- (void)setupTextField3
{
        self.txtEmail.tintColor = [UIColor mf_greenColor];
        self.txtEmail.textColor = [UIColor mf_veryDarkGrayColor];
        self.txtEmail.defaultPlaceholderColor = [UIColor mf_darkGrayColor];
        self.txtEmail.placeholderAnimatesOnFocus = YES;
    
        UIFontDescriptor * vfontDescriptor = [self.txtEmail.font.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
        UIFont *vfont = [UIFont fontWithDescriptor:vfontDescriptor size:self.txtEmail.font.pointSize];
        self.txtEmail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSFontAttributeName:vfont}];
}

- (void)setupTextField4
{
    self.txtPhone.tintColor = [UIColor mf_greenColor];
    self.txtPhone.textColor = [UIColor mf_veryDarkGrayColor];
    self.txtPhone.defaultPlaceholderColor = [UIColor mf_darkGrayColor];
    self.txtPhone.placeholderAnimatesOnFocus = YES;
    
    UIFontDescriptor * vfontDescriptor = [self.txtPhone.font.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
    UIFont *vfont = [UIFont fontWithDescriptor:vfontDescriptor size:self.txtPhone.font.pointSize];
    self.txtPhone.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Phone" attributes:@{NSFontAttributeName:vfont}];
}

- (IBAction)textFieldDidChange:(UITextField *)textField
{
    if (textField == _txtsname) {
        
        [self validateName];
    }
    else if (textField == _txtEmail) {
        
        [self checkValidEmail];
    }
    else if (textField == _txtPhone){
        
        [self validateTextField1];
    }
}

#pragma mark - Text field validation

- (void)validateName{
    
    NSError *error = nil;
    if (![self validName]) {
        
        error = [self errorWithLocalizedDescription:@"Please enter name."];
    }
    [self.txtsname setError:error animated:YES];

}

- (void)validateTextField1
{
    NSError *error = nil;
    if (![self validPhone]) {
        
        error = [self errorWithLocalizedDescription:@"Maximum of 10 characters allowed."];
    }
    [self.txtPhone setError:error animated:YES];
}

- (void)checkValidEmail
{
    NSError *error = nil;
    if (![self validEmail]) {
        
        error = [self errorWithLocalizedDescription:@"Please enter valid email."];
    }
    [self.txtEmail setError:error animated:YES];
}
- (BOOL)validName
{
    return self.txtsname.text.length > 0;
}

- (BOOL)validPhone
{
    return self.txtPhone.text.length <= 10;
}

- (BOOL)validEmail
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self.txtEmail.text];

}

- (NSError *)errorWithLocalizedDescription:(NSString *)localizedDescription
{
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: localizedDescription};
    return [NSError errorWithDomain:MFDemoErrorDomain code:MFDemoErrorCode userInfo:userInfo];
}

-(IBAction)onButtonClick:(id)sender{
    
    if (_txtsname.text.length == 0) {
        
        [self validateName];
    }
    else if (_txtEmail.text.length == 0){
        
        [self checkValidEmail];
    }
    else if (_txtPhone.text.length == 0){
        
        [self validateTextField1];
    }
    else{
        
        NSLog(@"%@",[DatabaseManager getInstance]);
        [[DatabaseManager getInstance]insertData:_txtsname.text Email:_txtEmail.text Phone:_txtPhone.text];
    }
}

-(IBAction)onUpdateClick:(id)sender{
    
    UpdateVC *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"UpdateVC"];
    [self.navigationController pushViewController:newView animated:YES];
}
@end
