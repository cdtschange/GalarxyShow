//
//  ReachabilityDemoViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/31/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "ReachabilityDemoViewController.h"
#import <GalarxyFoundationLib/iReachability.h>

@interface ReachabilityDemoViewController ()

-(void)reachabilityChanged:(NSNotification*)note;
@end

@implementation ReachabilityDemoViewController
@synthesize blockLabel, notificationLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:ikReachabilityChangedNotification
                                               object:nil];
    
    iReachability * reach = [iReachability reachabilityWithHostname:@"www.baidu.com"];

    reach.reachableBlock = ^(iReachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            blockLabel.text = @"Block Says Reachable";
        });
    };
    
    reach.unreachableBlock = ^(iReachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            blockLabel.text = @"Block Says Unreachable";
        });
    };
    
    [reach startNotifier];
    [self updateInterfaceWithReachability: reach];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)reachabilityChanged:(NSNotification*)note
{
    iReachability * reach = [note object];
    [self updateInterfaceWithReachability: reach];
}

//处理连接改变后的情况
- (void) updateInterfaceWithReachability: (iReachability*) curReach
{
    //对连接改变做出响应的处理动作。
//    NetworkStatus status = [curReach currentReachabilityStatus];
    
    if([curReach isReachable])
    {
        notificationLabel.text = @"Notification Says Reachable";
    }
    else
    {
        notificationLabel.text = @"Notification Says Unreachable";
    }
}

@end
