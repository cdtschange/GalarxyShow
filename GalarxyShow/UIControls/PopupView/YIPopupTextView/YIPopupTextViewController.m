//
//  YIPopupTextViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/4/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "YIPopupTextViewController.h"

@interface YIPopupTextViewController ()

@end

@implementation YIPopupTextViewController
@synthesize textView;
@synthesize editButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)dealloc{
    
    [self setTextView:nil];
    [self setEditButton:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

#pragma mark IBActions

- (IBAction)handleEditButton:(id)sender
{
    // NOTE: maxCount = 0 to hide count
    YIPopupTextView* popupTextView = [[YIPopupTextView alloc] initWithPlaceHolder:@"input here" maxCount:300];
    popupTextView.delegate = self;
    //popupTextView.closeButton.hidden = YES;
    popupTextView.text = self.textView.text;
    [popupTextView showInView:self.view];
}


#pragma mark -

#pragma mark YIPopupTextViewDelegate

- (void)popupTextView:(YIPopupTextView *)textView willDismissWithText:(NSString *)text
{
    NSLog(@"will dismiss");
    self.textView.text = text;
}

- (void)popupTextView:(YIPopupTextView *)textView didDismissWithText:(NSString *)text
{
    NSLog(@"did dismiss");
}
@end
