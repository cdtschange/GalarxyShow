//
//  DAAutoScrollDetailTextViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/10/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DAAutoTextView;

@interface DAAutoScrollDetailTextViewController : UIViewController<UITextViewDelegate>

@property (nonatomic, weak) IBOutlet DAAutoTextView *textView;

@end
