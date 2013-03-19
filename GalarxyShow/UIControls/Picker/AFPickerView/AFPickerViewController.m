//
//  AFPickerViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/2/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "AFPickerViewController.h"
#import <GalarxyUIKitLib/AFPickerView.h>

@interface AFPickerViewController ()<AFPickerViewDataSource, AFPickerViewDelegate>
{
    AFPickerView *defaultPickerView;
    AFPickerView *daysPickerView;
    NSArray *daysData;
}


@end

@implementation AFPickerViewController
@synthesize numberLabel;
@synthesize dayLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)dealloc{
    
    [self setNumberLabel:nil];
    [self setDayLabel:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    daysData = [[NSArray alloc] initWithObjects:@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday", nil];
    
    defaultPickerView = [[AFPickerView alloc] initWithFrame:CGRectMake(30.0, 30.0, 126.0, 197.0) bgImage:[UIImage imageNamed:@"pickerBackground.png"] shadowImage:[UIImage imageNamed:@"pickerShadows.png"] glassImage:[UIImage imageNamed:@"pickerGlass.png"]];
    defaultPickerView.dataSource = self;
    defaultPickerView.delegate = self;
    [defaultPickerView reloadData];
    [self.view addSubview:defaultPickerView];
    
    daysPickerView = [[AFPickerView alloc] initWithFrame:CGRectMake(30.0, 250.0, 126.0, 197.0) bgImage:[UIImage imageNamed:@"pickerBackground.png"] shadowImage:[UIImage imageNamed:@"pickerShadows.png"] glassImage:[UIImage imageNamed:@"pickerGlass.png"]];
    daysPickerView.dataSource = self;
    daysPickerView.delegate = self;
    daysPickerView.rowFont = [UIFont boldSystemFontOfSize:19.0];
    daysPickerView.rowIndent = 10.0;
    [daysPickerView reloadData];
    [self.view addSubview:daysPickerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - AFPickerViewDataSource

- (NSInteger)numberOfRowsInPickerView:(AFPickerView *)pickerView
{
    if (pickerView == daysPickerView)
        return [daysData count];
    
    return 100;
}




- (NSString *)pickerView:(AFPickerView *)pickerView titleForRow:(NSInteger)row
{
    if (pickerView == daysPickerView)
        return [daysData objectAtIndex:row];
    
    return [NSString stringWithFormat:@"%i", row + 1];
}




#pragma mark - AFPickerViewDelegate

- (void)pickerView:(AFPickerView *)pickerView didSelectRow:(NSInteger)row
{
    if (pickerView == daysPickerView)
        self.dayLabel.text = [daysData objectAtIndex:row];
    else
        self.numberLabel.text = [NSString stringWithFormat:@"%i", row + 1];
}


@end
