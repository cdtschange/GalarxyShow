//
//  HegakaDragAndDropRecycleBinViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/9/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "HegakaDragAndDropRecycleBinViewController.h"
#import <GalarxyUIKitLib/HegakaAttachmentItem.h>

@interface HegakaDragAndDropRecycleBinViewController ()

@end

@implementation HegakaDragAndDropRecycleBinViewController
@synthesize gallery;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.gallery.mainView = self.view;
    
    
    HegakaAttachmentItem *item = [[HegakaAttachmentItem alloc] initWithData:1 data:nil];
    [self.gallery addAttachment:item];
    [self.gallery addAttachment:item];
    [self.gallery addAttachment:item];
    [self.gallery addAttachment:item];
    [self.gallery addAttachment:item];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
