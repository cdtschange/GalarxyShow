//
//  JHTickerViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class JHTickerView;

@interface JHTickerViewController : ControlBaseViewController{
    
	// The ticker
	JHTickerView *ticker;
}

-(IBAction)pauseButtonSelected:(id)sender;
-(IBAction)resumeButtonSelected:(id)sender;

@end
