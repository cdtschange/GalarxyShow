//
//  DejalActivityDetailViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/11/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DejalActivityDetailViewController : UIViewController


@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UIButton *showAgainButton;

@property (nonatomic) BOOL useBezelStyle;
@property (nonatomic) BOOL useKeyboardStyle;
@property (nonatomic) BOOL showKeyboard;
@property (nonatomic) BOOL coverNavBar;
@property (nonatomic) BOOL useNetworkActivity;
@property (nonatomic, strong) NSString *labelText1;
@property (nonatomic, strong) NSString *labelText2;
@property (nonatomic) NSUInteger labelWidth;

- (IBAction)displayActivityView;
- (void)changeActivityView;
- (void)removeActivityView;

@end
