//
//  SliderPageControlViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/10/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"
#import <GalarxyUIKitLib/SliderPageControl.h>

@interface SliderPageControlViewController : ControlBaseViewController<SliderPageControlDelegate, UIScrollViewDelegate>{
	UIScrollView *scrollView;
	NSMutableArray *demoContent;
	SliderPageControl *sliderPageControl;
	BOOL pageControlUsed;
}

@property (nonatomic, strong) SliderPageControl *sliderPageControl;
@property (nonatomic, strong) NSMutableArray *demoContent;
@property (nonatomic, strong) UIScrollView *scrollView;

- (void)slideToCurrentPage:(bool)animated;
- (void)changeToPage:(int)page animated:(BOOL)animated;


@end
