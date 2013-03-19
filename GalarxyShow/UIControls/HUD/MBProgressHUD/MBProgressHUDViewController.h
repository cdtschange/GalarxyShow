//
//  MBProgressHUDViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/10/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/MBProgressHUD.h>
#import "ControlBaseViewController.h"

@interface MBProgressHUDViewController : ControlBaseViewController<MBProgressHUDDelegate> {
	MBProgressHUD *HUD;
	
	long long expectedLength;
	long long currentLength;
}

- (IBAction)showSimple:(id)sender;
- (IBAction)showWithLabel:(id)sender;
- (IBAction)showWithDetailsLabel:(id)sender;
- (IBAction)showWithLabelDeterminate:(id)sender;
- (IBAction)showWithCustomView:(id)sender;
- (IBAction)showWithLabelMixed:(id)sender;
- (IBAction)showUsingBlocks:(id)sender;
- (IBAction)showOnWindow:(id)sender;
- (IBAction)showURL:(id)sender;
- (IBAction)showWithGradient:(id)sender;

- (void)myTask;
- (void)myProgressTask;
- (void)myMixedTask;

@end
