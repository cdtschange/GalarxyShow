//
//  PinchScaleImageViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@interface PinchScaleImageViewController : ControlBaseViewController {
    
	
	IBOutlet UIImageView * imageView;
	
	CGFloat lastDistance;
	
	CGFloat imgStartWidth;
	CGFloat imgStartHeight;
	
	
}


@end
