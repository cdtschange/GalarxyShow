//
//  TITokenFieldViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/TITokenField.h>
#import "ControlBaseViewController.h"

@interface TITokenFieldViewController : ControlBaseViewController<TITokenFieldDelegate, UITextViewDelegate> {
    
	TITokenFieldView * tokenFieldView;
	UITextView * messageView;
	
	CGFloat keyboardHeight;
}


@end
