//
//  DDProgressViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class DDProgressView;

@interface DDProgressViewController : ControlBaseViewController
{
    float   testProgress ;
    int     progressDir ;
    
    DDProgressView *progressView ;
    DDProgressView *progressView2 ;
}
@end
