//
//  RootViewController.m
//  Part of the ASIHTTPRequest sample project - see http://allseeing-i.com/ASIHTTPRequest for details
//
//  Created by Ben Copsey on 16/06/2010.
//  Copyright 2010 All-Seeing Interactive. All rights reserved.
//

#import "ASIDemoRootViewController.h"
#import "ASIDemoSynchronousViewController.h"
#import "ASIDemoQueueViewController.h"
#import "ASIDemoAuthenticationViewController.h"
#import "ASIDemoUploadViewController.h"
#import "ASIDemoWebPageViewController.h"

@implementation ASIDemoRootViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
	}
	switch ([indexPath row]) {
		case 0:
			[[cell textLabel] setText:@"Synchronous"];
			break;
		case 1:
			[[cell textLabel] setText:@"Queue"];
			break;
		case 2:
			[[cell textLabel] setText:@"Authentication"];
			break;
		case 3:
			[[cell textLabel] setText:@"Upload"];
			break;
		case 4:
			[[cell textLabel] setText:@"Web Page Download"];
			break;
	}
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UIViewController *viewController = nil;
	switch ([indexPath row]) {
		case 0:
			viewController = [[ASIDemoSynchronousViewController alloc] initWithNibName:@"ASIDemoSampleViewController" bundle:nil];
			break;
		case 1:
			viewController = [[ASIDemoQueueViewController alloc] initWithNibName:@"ASIDemoSampleViewController" bundle:nil];
			break;
		case 2:
			viewController = [[ASIDemoAuthenticationViewController alloc] initWithNibName:@"ASIDemoSampleViewController" bundle:nil];
			break;
		case 3:
			viewController = [[ASIDemoUploadViewController alloc] initWithNibName:@"ASIDemoSampleViewController" bundle:nil];
			break;
		case 4:
			viewController = [[ASIDemoWebPageViewController alloc] initWithNibName:@"ASIDemoSampleViewController" bundle:nil];
			break;
	}	
    [self.navigationController pushViewController:viewController animated:YES];
	
}

@end
