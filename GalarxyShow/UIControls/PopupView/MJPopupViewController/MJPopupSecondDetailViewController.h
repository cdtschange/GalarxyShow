//
//  MJSecondDetailViewController.h
//  MJPopupViewControllerDemo
//
//  Created by Martin Juhasz on 24.06.12.
//  Copyright (c) 2012 martinjuhasz.de. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MJPopupSecondPopupDelegate;


@interface MJPopupSecondDetailViewController : UIViewController

@property (assign, nonatomic) id <MJPopupSecondPopupDelegate>delegate;

@end



@protocol MJPopupSecondPopupDelegate<NSObject>
@optional
- (void)cancelButtonClicked:(MJPopupSecondDetailViewController*)secondDetailViewController;
@end