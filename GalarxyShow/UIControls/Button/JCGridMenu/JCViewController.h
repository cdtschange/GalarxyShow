//
//  JCViewController.h
//  JCGridMenu
//
//  Created by Joseph Carney on 20/07/2012.
//  Copyright (c) 2012 North of the Web. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/UILabel+JCUI.h>
#import <GalarxyUIKitLib/JCDemo1.h>
#import <GalarxyUIKitLib/JCDemo2.h>
#import <GalarxyUIKitLib/JCDemo3.h>
#import <GalarxyUIKitLib/JCDemo4.h>
#import <GalarxyUIKitLib/JCDemo5.h>
#import <GalarxyUIKitLib/JCDemo6.h>
#import "ControlBaseViewController.h"

@interface JCViewController : ControlBaseViewController <UIScrollViewDelegate>
{
    JCDemo1 *demo1;
    JCDemo2 *demo2;
    JCDemo3 *demo3;
    JCDemo4 *demo4;
    JCDemo5 *demo5;
    JCDemo6 *demo6;
}

@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) UIPageControl *pageControl;
@property NSInteger pageSelected;

@property (nonatomic, strong) JCDemo1 *demo1;
@property (nonatomic, strong) JCDemo2 *demo2;
@property (nonatomic, strong) JCDemo3 *demo3;
@property (nonatomic, strong) JCDemo4 *demo4;
@property (nonatomic, strong) JCDemo5 *demo5;
@property (nonatomic, strong) JCDemo6 *demo6;
@property NSInteger demoLoaded;

@end
