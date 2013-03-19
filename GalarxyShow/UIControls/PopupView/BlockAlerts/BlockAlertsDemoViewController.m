//
//  BlockAlertsDemoViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/3/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "BlockAlertsDemoViewController.h"
#import <GalarxyUIKitLib/BlockActionSheet.h>
#import <GalarxyUIKitLib/BlockAlertView.h>
#import <GalarxyUIKitLib/BlockTextPromptAlertView.h>

@interface BlockAlertsDemoViewController ()

@end

@implementation BlockAlertsDemoViewController

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
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender
{
    BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Alert Title" message:@"This is a very long message, designed just to show you how smart this class is"];
    
    [alert setCancelButtonWithTitle:@"Cancel" block:nil];
    [alert setDestructiveButtonWithTitle:@"Kill!" block:nil];
    [alert addButtonWithTitle:@"Show Action Sheet on top" block:^{
        [self showActionSheet:nil];
    }];
    [alert addButtonWithTitle:@"Show another alert" block:^{
        [self showAlert:nil];
    }];
    [alert show];
}

- (IBAction)showActionSheet:(id)sender
{
    BlockActionSheet *sheet = [BlockActionSheet sheetWithTitle:@"This is a sheet title that will span more than one line"];
    [sheet setCancelButtonWithTitle:@"Cancel Button" block:nil];
    [sheet setDestructiveButtonWithTitle:@"Destructive Button" block:nil];
    [sheet addButtonWithTitle:@"Show Action Sheet on top" block:^{
        [self showActionSheet:nil];
    }];
    [sheet addButtonWithTitle:@"Show another alert" block:^{
        [self showAlert:nil];
    }];
    [sheet showInView:self.view];
}

- (IBAction)showAlertPlusActionSheet:(id)sender
{
    [self showAlert:nil];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self showActionSheet:nil];
    });
}

- (IBAction)showActionSheetPlusAlert:(id)sender
{
    [self showActionSheet:nil];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self showAlert:nil];
    });
}

- (IBAction)goNuts:(id)sender
{
    for (int i=0; i<6; i++)
    {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.5 * i * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            if (arc4random() % 2 == 0)
                [self showAlert:nil];
            else
                [self showActionSheet:nil];
        });
    }
}

- (IBAction)showTextPrompt:(id)sender
{
    UITextField *textField;
    BlockTextPromptAlertView *alert = [BlockTextPromptAlertView promptWithTitle:@"Prompt Title" message:@"With prompts you do have to keep in mind limited screen space due to the keyboard" textField:&textField block:^(BlockTextPromptAlertView *alert){
        [alert.textField resignFirstResponder];
        return YES;
    }];
    
    
    [alert setCancelButtonWithTitle:@"Cancel" block:nil];
    [alert addButtonWithTitle:@"Okay" block:^{
        NSLog(@"Text: %@", textField.text);
    }];
    [alert show];
}


- (IBAction)whatsArrived:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.getarrived.com"]];
}

- (IBAction)arrivedBlog:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.getarrived.com/blog/"]];
}

@end
