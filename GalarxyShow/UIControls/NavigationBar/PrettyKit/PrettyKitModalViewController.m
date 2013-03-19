//
//  ModalViewController.m
//  PrettyExample
//
//  Created by Seth Gholson on 4/25/12.
//  Copyright (c) 2012 NA. All rights reserved.
//

#import "PrettyKitModalViewController.h"

@interface PrettyKitModalViewController ()

@end

@implementation PrettyKitModalViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)onDoneClick:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}
@end
