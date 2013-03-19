//
//  MTDirectionsSampleViewController.h
//  MTDirectionsKitDemo
//
//  Created by Matthias Tretter
//  Copyright (c) 2012 Matthias Tretter (@myell0w). All rights reserved.
//

#import <MTDirectionsKit/MTDirectionsKit.h>
#import "ControlBaseViewController.h"
@interface MTDirectionsSampleViewController : ControlBaseViewController <MTDDirectionsDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
- (IBAction)goBack:(id)sender;

@end
