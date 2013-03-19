//
//  DejalActivityViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/11/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "DejalActivityViewController.h"
#import "DejalActivityDetailViewController.h"

enum Sections
{
    SimpleSection = 0,
    BezelSection,
    KeyboardSection,
    NUM_SECTIONS
};

enum SimpleSectionRows
{
    SimpleSectionLoadingRow = 0,
    SimpleSectionCustomLabelRow,
    SimpleSectionChangingLabelRow,
    SimpleSectionNetworkActivityRow,
    NUM_SIMPLE_SECTION_ROWS
};

enum BezelSectionRows
{
    BezelSectionLoadingRow = 0,
    BezelSectionCustomLabelRow,
    BezelSectionChangingLabelRow,
    BezelSectionMultiLineLabelRow,
    BezelSectionNoLabelRow,
    BezelSectionKeyboardCoveringRow,
    BezelSectionCoveringNavBarRow,
    NUM_BEZEL_SECTION_ROWS
};

enum KeyboardSectionRows
{
    KeyboardSectionLoadingRow = 0,
    KeyboardSectionCustomLabelRow,
    NUM_KEYBOARD_SECTION_ROWS
};

@interface DejalActivityViewController ()

@end

@implementation DejalActivityViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return NUM_SECTIONS;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    switch (section)
    {
        case SimpleSection:
            return NUM_SIMPLE_SECTION_ROWS;
        case BezelSection:
            return NUM_BEZEL_SECTION_ROWS;
        case KeyboardSection:
            return NUM_KEYBOARD_SECTION_ROWS;
        default:
            return 0;
    }
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // This style of figuring out the cell contents is not my preference, but easy enough for this demo.  Normally I use cell controllers that manage the cell contents:
    if (indexPath.section == SimpleSection)
    {
        switch (indexPath.row)
        {
            case SimpleSectionLoadingRow:
                cell.textLabel.text = @"Default \"Loading...\" label text";
                cell.detailTextLabel.text = @"+activityViewForView:";
                break;
            case SimpleSectionCustomLabelRow:
                cell.textLabel.text = @"Custom label text";
                cell.detailTextLabel.text = @"+activityViewForView:withLabel:";
                break;
            case SimpleSectionChangingLabelRow:
                cell.textLabel.text = @"Changing the label text";
                cell.detailTextLabel.text = @"+activityViewForView:withLabel:width:";
                break;
            case SimpleSectionNetworkActivityRow:
                cell.textLabel.text = @"Status bar network activity";
                cell.detailTextLabel.text = @"@property showNetworkActivityIndicator";
                break;
            default:
                NSAssert(NO, @"Unhandled value in cellForRowAtIndexPath SimpleSection");
        }
    }
    else if (indexPath.section == BezelSection)
    {
        switch (indexPath.row)
        {
            case BezelSectionLoadingRow:
                cell.textLabel.text = @"Default \"Loading...\" label text";
                cell.detailTextLabel.text = @"+activityViewForView:";
                break;
            case BezelSectionCustomLabelRow:
                cell.textLabel.text = @"Custom label text";
                cell.detailTextLabel.text = @"+activityViewForView:withLabel:";
                break;
            case BezelSectionChangingLabelRow:
                cell.textLabel.text = @"Changing the label text";
                cell.detailTextLabel.text = @"+activityViewForView:withLabel:width:";
                break;
            case BezelSectionMultiLineLabelRow:
                cell.textLabel.text = @"Multiple line label text";
                cell.detailTextLabel.text = @"+activityViewForView:withLabel:";
                break;
            case BezelSectionNoLabelRow:
                cell.textLabel.text = @"No label text";
                cell.detailTextLabel.text = @"+activityViewForView:withLabel:";
                break;
            case BezelSectionKeyboardCoveringRow:
                cell.textLabel.text = @"With a keyboard";
                cell.detailTextLabel.text = @"+activityViewForView:";
                break;
            case BezelSectionCoveringNavBarRow:
                cell.textLabel.text = @"Covering the navigation bar";
                cell.detailTextLabel.text = @"+activityViewForView:";
                break;
            default:
                NSAssert(NO, @"Unhandled value in cellForRowAtIndexPath for BezelSection");
        }
    }
    else if (indexPath.section == KeyboardSection)
    {
        switch (indexPath.row)
        {
            case KeyboardSectionLoadingRow:
                cell.textLabel.text = @"Default \"Loading...\" label text";
                cell.detailTextLabel.text = @"+activityView";
                break;
            case KeyboardSectionCustomLabelRow:
                cell.textLabel.text = @"Custom label text";
                cell.detailTextLabel.text = @"+activityViewWithLabel:";
                break;
            default:
                NSAssert(NO, @"Unhandled value in cellForRowAtIndexPath for KeyboardSection");
        }
    }
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    switch (section)
    {
        case SimpleSection:
            return @"DejalActivityView";
        case BezelSection:
            return @"DejalBezelActivityView";
        case KeyboardSection:
            return @"DejalKeyboardActivityView";
        default:
            return @"";
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    DejalActivityDetailViewController *demoViewController = [[DejalActivityDetailViewController alloc] initWithNibName:@"DejalActivityDetailViewController" bundle:nil];
    
    if (indexPath.section == SimpleSection)
    {
        switch (indexPath.row)
        {
            case SimpleSectionLoadingRow:
                break;
            case SimpleSectionCustomLabelRow:
                demoViewController.labelText1 = @"Preparing...";
                break;
            case SimpleSectionChangingLabelRow:
                demoViewController.labelText1 = @"Massaging Pixels...";
                demoViewController.labelText2 = @"Reticulating Splines...";
                demoViewController.labelWidth = 140;
                break;
            case SimpleSectionNetworkActivityRow:
                demoViewController.labelText1 = @"Look in status bar...";
                demoViewController.labelText2 = @"Now it's gone...";
                demoViewController.labelWidth = 130;
                demoViewController.useNetworkActivity = YES;
                break;
            default:
                NSAssert(NO, @"Unhandled value in didSelectRowAtIndexPath SimpleSection");
        }
    }
    else if (indexPath.section == BezelSection)
    {
        switch (indexPath.row)
        {
            case BezelSectionLoadingRow:
                demoViewController.useBezelStyle = YES;
                break;
            case BezelSectionCustomLabelRow:
                demoViewController.useBezelStyle = YES;
                demoViewController.labelText1 = @"Preparing...";
                break;
            case BezelSectionChangingLabelRow:
                demoViewController.useBezelStyle = YES;
                demoViewController.labelText1 = @"Massaging Pixels...";
                demoViewController.labelText2 = @"Reticulating Splines...";
                demoViewController.labelWidth = 155;
                break;
            case BezelSectionMultiLineLabelRow:
                demoViewController.useBezelStyle = YES;
                demoViewController.labelText1 = @"Split over\nMultiple lines...";
                break;
            case BezelSectionNoLabelRow:
                demoViewController.useBezelStyle = YES;
                demoViewController.labelText1 = @"";
                break;
            case BezelSectionKeyboardCoveringRow:
                demoViewController.useBezelStyle = YES;
                demoViewController.showKeyboard = YES;
                break;
            case BezelSectionCoveringNavBarRow:
                demoViewController.useBezelStyle = YES;
                demoViewController.showKeyboard = YES;
                demoViewController.coverNavBar = YES;
                break;
            default:
                NSAssert(NO, @"Unhandled value in didSelectRowAtIndexPath for BezelSection");
        }
    }
    else if (indexPath.section == KeyboardSection)
    {
        switch (indexPath.row)
        {
            case KeyboardSectionLoadingRow:
                demoViewController.useKeyboardStyle = YES;
                demoViewController.showKeyboard = YES;
                break;
            case KeyboardSectionCustomLabelRow:
                demoViewController.useKeyboardStyle = YES;
                demoViewController.showKeyboard = YES;
                demoViewController.labelText1 = @"Preparing...";
                break;
            default:
                NSAssert(NO, @"Unhandled value in didSelectRowAtIndexPath for KeyboardSection");
        }
    }
    
	[self.navigationController pushViewController:demoViewController animated:YES];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath;
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;
 {
 
 if (editingStyle == UITableViewCellEditingStyleDelete)
 {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert)
 {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath;
 {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath;
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


@end
