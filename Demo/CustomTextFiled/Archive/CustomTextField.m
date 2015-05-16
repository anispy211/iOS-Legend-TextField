//
//  CustomTextField.m
//  CustomTextFiled
//
//  Created by Aniruddha Kadam on 5/9/15.
//  Copyright (c) 2015 Anispy. All rights reserved.
//

#import "CustomTextField.h"

@interface CustomTextField ()
{
        @private UILabel * titleLabel;
    UIButton * btn;
        @private UIView * bgView ;
}

@end

@implementation CustomTextField



-(void)setTitleText:(NSString *)titleText
{
    
    UIFont *font = [UIFont systemFontOfSize:10.0f];
    NSDictionary *userAttributes = @{NSFontAttributeName: font};
    const CGSize textSize = [titleText sizeWithAttributes: userAttributes];
    
    titleLabel.font = font;

    
    titleLabel.text = titleText;
    titleLabel.backgroundColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.frame = CGRectMake(14, -CGRectGetHeight(self.frame)/4, textSize.width+10, self.frame.size.height/2);

    [self bringSubviewToFront:titleLabel];


}

-(CGRect)rightViewRectForBounds:(CGRect)bounds {
   
        //default position
        CGRect rightViewRect = CGRectMake(-20, 10, 50, self.frame.size.height-30);
        rightViewRect.size.height = bounds.size.height - 22;
        rightViewRect.origin.y = 12;
        rightViewRect.origin.x = bounds.size.width - rightViewRect.size.width - 5;
        return rightViewRect;
  
}

-(void)setIsPasswordTxtField:(BOOL)isPasswordTxtField
{
    if (isPasswordTxtField == true) {
    
//        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width-75, 10, 70, self.frame.size.height-15)];
        
         btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //btn.frame = CGRectMake(0, 0, 16, 16);

        [btn setFrame:CGRectMake(-20, 10, 15, self.frame.size.height-30)];
        [btn addTarget:self action:@selector(secureEnable:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"Show" forState:UIControlStateNormal];
        [btn setTitle:@"Hide" forState:UIControlStateSelected];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:11]];
        [btn.titleLabel setTextColor:[UIColor blackColor]];
        [btn setBackgroundColor:[UIColor colorWithRed:232.0f/255.0f green:234.0f/255.0f blue:235.0f/255.0f alpha:1.0f]];
        [btn setTintColor:[UIColor blackColor]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];

        self.rightView = btn;
        CGRect rect = self.rightView.frame;
        rect.origin.x = -20;
        self.rightView.frame = rect;
        self.rightViewMode = UITextFieldViewModeAlways;
   
        
        
//        CGRect rect = self.frame;
//        rect.size.width =  rect.size.width -75;
//        self.frame = rect;
        
        return;
    }
    
    
}



- (void)secureEnable:(UIButton *)btn2
{
    
    if (btn2.isSelected) {
        
        self.secureTextEntry = false;

    }
    else{
        
        self.secureTextEntry = true;

    }
    
    [btn2 setSelected:!btn2.isSelected];
    [self becomeFirstResponder];
    
}

-(void)setBorderColor:(UIColor *)borderColor
{
    [bgView.layer setBorderColor:borderColor.CGColor];
    
    titleLabel.textColor = borderColor;

}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        
        
        bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        [bgView setBackgroundColor:[UIColor whiteColor]];
        [bgView setUserInteractionEnabled:NO];
        [self addSubview:bgView];
        // [self sendSubviewToBack:bgView];

        
        
        [bgView.layer setBorderWidth:1];
        [bgView.layer setBorderColor:[UIColor blackColor].CGColor];
        
        [bgView.layer setCornerRadius:8];
        
        [self.layer setCornerRadius:8];
        [self.layer setBorderColor:[UIColor clearColor].CGColor];
        [self.layer setBorderWidth:1];

        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLabel.text = @"";
        titleLabel.textColor = [UIColor blackColor];
        
        [self addSubview:titleLabel];
       // [self sendSubviewToBack:titleLabel];
       // self.delegate = self;
        self.clipsToBounds = false;
        
        titleLabel.frame = CGRectMake(15, CGRectGetHeight(self.frame)/2.0, 17, self.frame.size.height/2);
        
       // self.layer.masksToBounds = YES;

        titleLabel.clipsToBounds = YES;
        [self bringSubviewToFront:self];

        
        UIView * v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];


        self.leftView = v;
        
        self.leftViewMode = UITextFieldViewModeAlways;
        
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLabel.text = @"";
        titleLabel.font = [UIFont systemFontOfSize:12.0f];
        titleLabel.textColor = [UIColor blackColor];
        
        [self addSubview:titleLabel];
        //[self sendSubviewToBack:titleLabel];
        // self.delegate = self;
        self.clipsToBounds = false;
        
        titleLabel.frame = CGRectMake(0, CGRectGetHeight(self.frame)/2.0, self.frame.size.width/2, self.frame.size.height/2);
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLabel.text = @"";
        titleLabel.font = [UIFont systemFontOfSize:12.0f];
        titleLabel.textColor = [UIColor blackColor];
        
        [self addSubview:titleLabel];
       // [self sendSubviewToBack:titleLabel];
        // self.delegate = self;
        self.clipsToBounds = false;
        
        titleLabel.frame = CGRectMake(0, CGRectGetHeight(self.frame)/2.0, self.frame.size.width/2, self.frame.size.height/2);

        
    }
    return self;
}

@end
