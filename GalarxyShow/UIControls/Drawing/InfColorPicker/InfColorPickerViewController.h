//==============================================================================
//
//  PickerSamplePadViewController.h
//  PickerSamplePad
//
//  Created by Troy Gaul on 8/17/10.
//
//  Copyright (c) 2011 InfinitApps LLC - http://infinitapps.com
//	Some rights reserved: http://opensource.org/licenses/MIT
//
//==============================================================================

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/InfColorPicker.h>
#import "ControlBaseViewController.h"

//------------------------------------------------------------------------------

@interface InfColorPickerViewController : ControlBaseViewController< InfColorPickerControllerDelegate,
															 UIPopoverControllerDelegate,
															 UITableViewDelegate >
{
	UIPopoverController* activePopover;
	BOOL updateLive;
}

- (IBAction) changeColor: (id) sender;

@end

//------------------------------------------------------------------------------
