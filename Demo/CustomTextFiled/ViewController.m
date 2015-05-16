//
//  ViewController.m
//  CustomTextFiled
//
//  Created by Aniruddha Kadam on 5/9/15.
//  Copyright (c) 2015 Anispy. All rights reserved.
//

#import "ViewController.h"
#import "AKLegendTextField.h"

@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic,weak) IBOutlet AKLegendTextField * firstNameTextField;
@property (nonatomic,weak) IBOutlet AKLegendTextField * passwordTextField;


-(IBAction)borderRedbuttonAction:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.firstNameTextField.titleText = @"Email Address";
    
    self.passwordTextField.titleText = @"Password";
    self.passwordTextField.isPasswordTxtField = true;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - Button Actions
-(IBAction)borderRedbuttonAction:(id)sender
{
    UIButton * btn = sender;
    
    switch (btn.tag) {
        case 0:
            self.firstNameTextField.borderColor = [UIColor redColor];
            self.passwordTextField.borderColor = [UIColor redColor];

            break;
            
        case 1:
            self.firstNameTextField.borderColor = [UIColor greenColor];
            self.passwordTextField.borderColor = [UIColor greenColor];

            break;
        
        case 2:
            self.firstNameTextField.borderColor = [UIColor blackColor];
            self.passwordTextField.borderColor = [UIColor blackColor];

            break;
            
        default:
            break;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
