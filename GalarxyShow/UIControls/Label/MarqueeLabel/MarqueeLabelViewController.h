//
//  MarqueeLabelViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class MarqueeLabel;

@interface MarqueeLabelViewController : ControlBaseViewController{
    
    MarqueeLabel *demoLabel;
    
}

@property (nonatomic, retain) MarqueeLabel *demoLabel;

-(void) changeTheLabel;

@end
