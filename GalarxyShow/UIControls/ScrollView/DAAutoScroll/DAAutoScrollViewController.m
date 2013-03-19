//
//  DAAutoScrollViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/10/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "DAAutoScrollViewController.h"
#import "DAAutoScrollDetailTableViewController.h"
#import "DAAutoScrollDetailTextViewController.h"

@interface DAAutoScrollViewController ()

@end

@implementation DAAutoScrollViewController

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

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell.
    
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"TableView Example";
            break;
        case 1:
            cell.textLabel.text = @"TextView Example";
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *controller = nil;
    
    switch (indexPath.row)
    {
        case 0:
            controller = [[DAAutoScrollDetailTableViewController alloc] initWithNibName:@"DAAutoScrollDetailTableViewController" bundle:nil];
            break;
        case 1:
            controller = [[DAAutoScrollDetailTextViewController alloc] init];
            break;
        default:
            break;
    }
    
    [self.navigationController pushViewController:controller animated:YES];
}
@end
