//
//  ImageReflectionViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/11/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@interface ImageReflectionViewController : ControlBaseViewController
{
	UIImage * myImage;
	IBOutlet UIImageView * monkeyView;
	IBOutlet UIImageView * topRef;
	IBOutlet UIImageView * refView;
}
@end
