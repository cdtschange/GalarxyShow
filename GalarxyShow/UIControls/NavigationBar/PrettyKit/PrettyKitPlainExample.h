//
//  PlainExample.h
//  PrettyExample
//
//  Created by Víctor on 22/03/12.
//  Copyright (c) 2012 Victor Pena Placer. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PrettyNavigationBar;

@interface PrettyKitPlainExample : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *ctableView;
@property (weak, nonatomic) IBOutlet PrettyNavigationBar *navBar;
- (IBAction)goDone:(id)sender;

@end
