//
//  YLViewController.h
//  YLProgressBar
//
//  Created by Yannick Loriot on 05/02/12.
//  Copyright (c) 2012 Yannick Loriot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class YLProgressBar;

@interface YLProgressBarViewController : ControlBaseViewController
{
@protected
    NSTimer*    progressTimer;
}
@property (nonatomic, strong) IBOutlet YLProgressBar* progressView;
@property (nonatomic, strong) IBOutlet UILabel*       progressValueLabel;

#pragma mark Constructors - Initializers

#pragma mark Public Methods

@end
