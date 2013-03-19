//
//  ALMultiSelectPickerViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/2/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "ALMultiSelectPickerViewController.h"
#import <GalarxyUIKitLib/ALMultiSelectPickerView.h>

@interface ALMultiSelectPickerViewController ()<ALMultiSelectPickerViewDelegate> {
	NSArray *entries;
	NSMutableDictionary *selectionStates;
	
	ALMultiSelectPickerView *pickerView;
}

@end

@implementation ALMultiSelectPickerViewController

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
	entries = [[NSArray alloc] initWithObjects:@"Row 1", @"Row 2", @"Row 3", @"Row 4", @"Row 5", nil];
	selectionStates = [[NSMutableDictionary alloc] init];
	for (NSString *key in entries)
		[selectionStates setObject:[NSNumber numberWithBool:NO] forKey:key];
	
	// Init picker and add it to view
	pickerView = [[ALMultiSelectPickerView alloc] initWithFrame:CGRectMake(0, 244, 0, 0)];
	pickerView.delegate = self;
	[self.view addSubview:pickerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark ALPickerView delegate methods

- (NSInteger)numberOfRowsForPickerView:(ALMultiSelectPickerView *)pickerView {
	return [entries count];
}

- (NSString *)pickerView:(ALMultiSelectPickerView *)pickerView textForRow:(NSInteger)row {
	return [entries objectAtIndex:row];
}

- (BOOL)pickerView:(ALMultiSelectPickerView *)pickerView selectionStateForRow:(NSInteger)row {
	return [[selectionStates objectForKey:[entries objectAtIndex:row]] boolValue];
}

- (void)pickerView:(ALMultiSelectPickerView *)pickerView didCheckRow:(NSInteger)row {
	// Check whether all rows are checked or only one
	if (row == -1)
		for (id key in [selectionStates allKeys])
			[selectionStates setObject:[NSNumber numberWithBool:YES] forKey:key];
	else
		[selectionStates setObject:[NSNumber numberWithBool:YES] forKey:[entries objectAtIndex:row]];
}

- (void)pickerView:(ALMultiSelectPickerView *)pickerView didUncheckRow:(NSInteger)row {
	// Check whether all rows are unchecked or only one
	if (row == -1)
		for (id key in [selectionStates allKeys])
			[selectionStates setObject:[NSNumber numberWithBool:NO] forKey:key];
	else
		[selectionStates setObject:[NSNumber numberWithBool:NO] forKey:[entries objectAtIndex:row]];
}
@end
