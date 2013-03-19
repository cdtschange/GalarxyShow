//
//  DDPageControlViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/10/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class DDPageControl;

@interface DDPageControlViewController : ControlBaseViewController<UIScrollViewDelegate>
{
	IBOutlet UIScrollView *scrollView ;
	
	DDPageControl *pageControl ;
}

@property (nonatomic,strong) IBOutlet UIScrollView *scrollView ;


@end
