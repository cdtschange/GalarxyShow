//
//  SBTableAlertViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/3/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "SBTableAlertViewController.h"

@interface SBTableAlertViewController ()

@end

@implementation SBTableAlertViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)dealloc{
    
    [self setTableView:nil];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 4;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
	if ([indexPath row] == 1)
		[cell.textLabel setText:@"Single Select"];
	else if ([indexPath row] == 0)
		[cell.textLabel setText:@"Multiple Select"];
	else if ([indexPath row] == 2)
		[cell.textLabel setText:@"Apple Style"];
	else if ([indexPath row] == 3)
		[cell.textLabel setText:@"Sections"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	SBTableAlert *alert;
	if ([indexPath row] == 1) {
		alert	= [[SBTableAlert alloc] initWithTitle:@"Single Select" cancelButtonTitle:@"Cancel" messageFormat:nil];
		[alert.view setTag:1];
	} else if ([indexPath row] == 0) {
		alert	= [[SBTableAlert alloc] initWithTitle:@"Multiple Select" cancelButtonTitle:@"Cancel" messageFormat:@"Select multiple rows!"];
		[alert setType:SBTableAlertTypeMultipleSelct];
		[alert.view addButtonWithTitle:@"OK"];
		[alert.view setTag:0];
	} else if ([indexPath row] == 2) {
		alert	= [[SBTableAlert alloc] initWithTitle:@"Apple Style" cancelButtonTitle:@"Cancel" messageFormat:nil];
		[alert.view setTag:2];
		[alert setStyle:SBTableAlertStyleApple];
	} else {
		alert	= [[SBTableAlert alloc] initWithTitle:@"Sections" cancelButtonTitle:@"Cancel" messageFormat:@"+ Apple styled table view."];
		[alert setStyle:SBTableAlertStyleApple];
		[alert.view setTag:3];
	}
	
	[alert setDelegate:self];
	[alert setDataSource:self];
	
	[alert show];
	
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - SBTableAlertDataSource

- (UITableViewCell *)tableAlert:(SBTableAlert *)tableAlert cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell;
	
	if (tableAlert.view.tag == 0 || tableAlert.view.tag == 1) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	} else {
		// Note: SBTableAlertCell
		cell = [[SBTableAlertCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	}
	
	[cell.textLabel setText:[NSString stringWithFormat:@"Cell %d", indexPath.row]];
	
	return cell;
}

- (NSInteger)tableAlert:(SBTableAlert *)tableAlert numberOfRowsInSection:(NSInteger)section {
	if (tableAlert.type == SBTableAlertTypeSingleSelect)
		return 3;
	else
		return 10;
}

- (NSInteger)numberOfSectionsInTableAlert:(SBTableAlert *)tableAlert {
	if (tableAlert.view.tag == 3)
		return 2;
	else
		return 1;
}

- (NSString *)tableAlert:(SBTableAlert *)tableAlert titleForHeaderInSection:(NSInteger)section {
	if (tableAlert.view.tag == 3)
		return [NSString stringWithFormat:@"Section Header %d", section];
	else
		return nil;
}

#pragma mark - SBTableAlertDelegate

- (void)tableAlert:(SBTableAlert *)tableAlert didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (tableAlert.type == SBTableAlertTypeMultipleSelct) {
		UITableViewCell *cell = [tableAlert.tableView cellForRowAtIndexPath:indexPath];
		if (cell.accessoryType == UITableViewCellAccessoryNone)
			[cell setAccessoryType:UITableViewCellAccessoryCheckmark];
		else
			[cell setAccessoryType:UITableViewCellAccessoryNone];
		
		[tableAlert.tableView deselectRowAtIndexPath:indexPath animated:YES];
	}
}

- (void)tableAlert:(SBTableAlert *)tableAlert didDismissWithButtonIndex:(NSInteger)buttonIndex {
	NSLog(@"Dismissed: %i", buttonIndex);
	
}

@end
