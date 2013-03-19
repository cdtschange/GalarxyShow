//
//  StyledPageControlViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/10/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "StyledPageControlViewController.h"
#import "StyledPageControlTableViewCell.h"

@interface StyledPageControlViewController ()

@end

@implementation StyledPageControlViewController

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 3;
    }
    else if (section==1)
    {
        return 1;
    }
    else if (section==2)
    {
        return 1;
    }
    else if (section==3)
    {
        return 1;
    }
    else if (section==4)
    {
        return 1;
    }
    else if (section==5)
    {
        return 1;
    }
    else return 0;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return @"PageControlStyleDefault";
    }
    else if (section==1)
    {
        return @"PageControlStyleStrokedCircle";
    }
    else if (section==2)
    {
        return @"PageControlStylePressed1";
    }
    else if (section==3)
    {
        return @"PageControlStylePressed2";
    }
    else if (section==4)
    {
        return @"PageControlStyleWithPageNumber";
    }
    else if (section==5)
    {
        return @"PageControlStyleThumb";
    }
    else return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 34;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    StyledPageControlTableViewCell *cell = (StyledPageControlTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[StyledPageControlTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell.pageControl setNumberOfPages:10];
    [cell.pageControl setCurrentPage:5];
    
    if (indexPath.section==0)
    {
        [cell.pageControl setPageControlStyle:PageControlStyleDefault];
        if (indexPath.row==0)
        {
            // default style without changes
        }
        else if (indexPath.row==1)
        {
            // change color
            [cell.pageControl setCoreNormalColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]];
            [cell.pageControl setCoreSelectedColor:[UIColor colorWithRed:0.8 green:0.2 blue:0.2 alpha:1]];
        }
        else if (indexPath.row==2)
        {
            // change gap width
            [cell.pageControl setGapWidth:5];
            // change diameter
            [cell.pageControl setDiameter:9];
        }
    }
    else if (indexPath.section==1)
    {
        [cell.pageControl setPageControlStyle:PageControlStyleStrokedCircle];
    }
    else if (indexPath.section==2)
    {
        [cell.pageControl setPageControlStyle:PageControlStylePressed1];
        [cell.pageControl setBackgroundColor:[UIColor darkGrayColor]];
    }
    else if (indexPath.section==3)
    {
        [cell.pageControl setPageControlStyle:PageControlStylePressed2];
        [cell.pageControl setBackgroundColor:[UIColor darkGrayColor]];
    }
    else if (indexPath.section==4)
    {
        [cell.pageControl setPageControlStyle:PageControlStyleWithPageNumber];
        [cell.pageControl setNumberOfPages:14];
    }
    else if (indexPath.section==5)
    {
        [cell.pageControl setPageControlStyle:PageControlStyleThumb];
        [cell.pageControl setThumbImage:[UIImage imageNamed:@"styledpagecontrol-thumb-normal.png"]];
        [cell.pageControl setSelectedThumbImage:[UIImage imageNamed:@"styledpagecontrol-thumb-selected.png"]];
        [cell.pageControl setNumberOfPages:10];
    }
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}
- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
