//
//  MyPaletteViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/9/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@interface MyPaletteViewController : ControlBaseViewController
<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
	UILabel* labelColor;
	UILabel* labelLoanshift;
	CGPoint MyBeganpoint;
	CGPoint MyMovepoint;
	int Segment;
	int SegmentWidth;
	//----------------
	UIImageView* pickImage;
	
	UISegmentedControl* WidthButton;
	UISegmentedControl* ColorButton;
}
@property int Segment;
@property (nonatomic,retain)IBOutlet UILabel* labelColor;
@property (nonatomic,retain)IBOutlet UILabel* labelLoanshift;

-(IBAction)myAllColor;
-(IBAction)myAllWidth;
-(IBAction)myPalttealllineclear;
-(IBAction)LineFinallyRemove;
-(IBAction)myRubberSeraser;

-(void)segmentColor;
-(void)segmentWidth;
//=====================
-(IBAction)callCame;
-(IBAction)captureScreen;

@end
