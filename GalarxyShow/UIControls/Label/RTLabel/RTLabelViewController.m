//
//  RTLabelViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/21/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "RTLabelViewController.h"
#import "RTLabelTableViewCell.h"
#import <GalarxyUIKitLib/RTLabel.h>

@interface RTLabelViewController () {
	NSMutableArray *dataArray;
}


@end

@implementation RTLabelViewController

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
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,150,30)];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:20]];
    [titleLabel setText:@"RTLabel"];
    [self.navigationItem setTitleView:titleLabel];
    [titleLabel setTextAlignment:UITextAlignmentCenter];
    
    dataArray = [NSMutableArray array];
    NSMutableDictionary *row1 = [NSMutableDictionary dictionary];
    [row1 setObject:@"<b>bold</b> and <i>italic</i> style" forKey:@"text"];
    [dataArray addObject:row1];
    
    NSMutableDictionary *row2 = [NSMutableDictionary dictionary];
    [row2 setObject:@"<font face='HelveticaNeue-CondensedBold' size=20><u color=blue>underlined</u> <uu color=red>text</uu></font>" forKey:@"text"];
    [dataArray addObject:row2];
    
    NSMutableDictionary *row3 = [NSMutableDictionary dictionary];
    [row3 setObject:@"clickable link - <a href='http://store.apple.com'>link to apple store</a> <a href='http://www.google.com'>link to google</a> <a href='http://www.yahoo.com'>link to yahoo</a> <a href='https://github.com/honcheng/RTLabel'>link to RTLabel in GitHub</a> <a href='http://www.wiki.com'>link to wiki.com website</a>" forKey:@"text"];
    [dataArray addObject:row3];
    
    NSMutableDictionary *row4 = [NSMutableDictionary dictionary];
    [row4 setObject:@"<font face='HelveticaNeue-CondensedBold' size=20 color='#CCFF00'>Text with</font> <font face=AmericanTypewriter size=16 color=purple>different colours</font> <font face=Futura size=32 color='#dd1100'>and sizes</font>" forKey:@"text"];
    [dataArray addObject:row4];
    
    NSMutableDictionary *row5 = [NSMutableDictionary dictionary];
    [row5 setObject:@"<font face='HelveticaNeue-CondensedBold' size=20 stroke=1>Text with strokes</font> " forKey:@"text"];
    [dataArray addObject:row5];
    
    NSMutableDictionary *row6 = [NSMutableDictionary dictionary];
    [row6 setObject:@"<font face='HelveticaNeue-CondensedBold' size=20 kern=35>KERN</font> " forKey:@"text"];
    [dataArray addObject:row6];
    
    NSMutableDictionary *row7 = [NSMutableDictionary dictionary];
    [row7 setObject:@"<font face='HelveticaNeue-CondensedBold' size=14><p align=justify><font color=red>JUSTIFY</font> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim </p> <p align=left><font color=red>LEFT ALIGNED</font> veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p><br><p align=right><font color=red>RIGHT ALIGNED</font> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p><br><p align=center><font color=red>CENTER ALIGNED</font> Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p></font> " forKey:@"text"];
    [dataArray addObject:row7];
    
    NSMutableDictionary *row20 = [NSMutableDictionary dictionary];
    [row20 setObject:@"<p indent=20>Indented bla bla bla bla bla bla bla bla bla bla bla bla bla</p>" forKey:@"text"];
    [dataArray addObject:row20];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSMutableDictionary *rowInfo = [dataArray objectAtIndex:indexPath.row];
	if ([rowInfo objectForKey:@"cell_height"])
	{
		return [[rowInfo objectForKey:@"cell_height"] intValue];
	}
	else
	{
		RTLabel *rtLabel = [RTLabelTableViewCell textLabel];
		[rtLabel setText:[rowInfo objectForKey:@"text"]];
		CGSize optimumSize = [rtLabel optimumSize];
		[rowInfo setObject:[NSNumber numberWithInt:optimumSize.height+20] forKey:@"cell_height"];
		return [[rowInfo objectForKey:@"cell_height"] intValue];
	}
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [dataArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"RTLabelTableViewCell";
    RTLabelTableViewCell *cell = (RTLabelTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
	{
        cell = [[RTLabelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	[cell.rtLabel setText:[[dataArray objectAtIndex:indexPath.row] objectForKey:@"text"]];
    return cell;
}

@end
