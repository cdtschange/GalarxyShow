//
//  LoopPickerViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/2/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "LoopPickerViewController.h"

@interface LoopPickerViewController ()

@end

@implementation LoopPickerViewController
@synthesize myPickerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)dealloc{
    self.myPickerView=nil;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	NSMutableArray *strings = [NSMutableArray arrayWithCapacity:10];
	[strings addObject:@"Zero"];
	[strings addObject:@"One"];
	[strings addObject:@"Two"];
	[strings addObject:@"Three"];
	[strings addObject:@"Four"];
	[strings addObject:@"Five"];
	[strings addObject:@"Six"];
	[strings addObject:@"Seven"];
	[strings addObject:@"Eight"];
	[strings addObject:@"Nine"];
	return [strings objectAtIndex:(row%10)];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	[self pickerViewLoaded:nil];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return 16384;
}


-(void)pickerViewLoaded: (id)blah {
	NSUInteger max = 16384;
	NSUInteger base10 = (max/2)-(max/2)%10;
	[myPickerView selectRow:[myPickerView selectedRowInComponent:0]%10+base10 inComponent:0 animated:false];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

@end
