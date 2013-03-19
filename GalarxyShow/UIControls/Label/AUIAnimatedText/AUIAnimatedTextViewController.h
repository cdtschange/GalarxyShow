//
//  AUIAnimatedTextViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/20/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class AUIAnimatableLabel;

@interface AUIAnimatedTextViewController : ControlBaseViewController{
    NSArray *colorToAnimate;
    NSArray *textToAnimate;
    NSArray *fontsToAnimate;
    NSArray *sizesToAnimate;
    
}
@property (nonatomic, weak) IBOutlet AUIAnimatableLabel *animatableLabel;

@end
