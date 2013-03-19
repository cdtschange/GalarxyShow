//
//  TouchPieMenuViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/5/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class PieMenu;

@interface TouchPieMenuViewController : ControlBaseViewController{
	PieMenu *pieMenu;
	UILabel *label;
}

@property (nonatomic, strong) PieMenu *pieMenu;
@property (nonatomic, strong) IBOutlet UILabel *label;

- (IBAction) fingerSizeAction:(id)sender;
- (IBAction) leftHandedAction:(id)sender;

@end
