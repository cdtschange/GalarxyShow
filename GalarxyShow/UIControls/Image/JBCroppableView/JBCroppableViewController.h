//
//  JBCroppableViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 1/9/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@interface JBCroppableViewController : ControlBaseViewController

@property (weak, nonatomic) IBOutlet UIButton *cropButton;
@property (weak, nonatomic) IBOutlet UIButton *undoButton;
@property (weak, nonatomic) IBOutlet UIImageView *image;

- (IBAction)cropTapped:(id)sender;
- (IBAction)undoTapped:(id)sender;

@end
