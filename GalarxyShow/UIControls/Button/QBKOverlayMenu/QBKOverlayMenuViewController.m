//
//  QBKOverlayMenuViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/5/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "QBKOverlayMenuViewController.h"

@interface QBKOverlayMenuViewController ()

@end

@implementation QBKOverlayMenuViewController

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
    
    QBKOverlayMenuViewOffset offset;
    offset.bottomOffset = 44;
    
    _qbkOverlayMenu = [[QBKOverlayMenuView alloc] initWithDelegate:self position:kQBKOverlayMenuViewPositionBottom offset:offset];
    [_qbkOverlayMenu setParentView:[self view]];
    
    [_qbkOverlayMenu addButtonWithImage:[UIImage imageNamed:@"rw-button.png"] index:0];
    [_qbkOverlayMenu addButtonWithImage:[UIImage imageNamed:@"rw-button.png"] index:1];
    [_qbkOverlayMenu addButtonWithImage:[UIImage imageNamed:@"rw-button.png"] index:2];
    [_qbkOverlayMenu addButtonWithImage:[UIImage imageNamed:@"rw-button.png"] index:3];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - Métodos de QBKOverlayMenuViewDelegate
- (void)overlayMenuView:(QBKOverlayMenuView *)overlayMenuView didActivateAdditionalButtonWithIndex:(NSInteger)index
{
    NSLog(@"Botón pulsado con índice: %d", index);
}

- (void)didPerformUnfoldActionInOverlayMenuView:(QBKOverlayMenuView *)overlaymenuView
{
    NSLog(@"Menú DESPLEGADO");
}

- (void)didPerformFoldActionInOverlayMenuView:(QBKOverlayMenuView *)overlaymenuView
{
    NSLog(@"Menú REPLEGADO");
}
@end
