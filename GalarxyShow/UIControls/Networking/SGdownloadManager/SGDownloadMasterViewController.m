//
//  MasterViewController.m
//  downloadManager
//
//  Created by Htain Lin Shwe on 11/7/12.
//  Copyright (c) 2012 Edenpod. All rights reserved.
//

#import "SGDownloadMasterViewController.h"

#import "SGDownloadDetailViewController.h"
#import "SGDownloadProgressCell.h"

#define DELETE_DONE 0

@interface SGDownloadMasterViewController () {
    NSMutableArray *toDownloadFiles;
}
@end

@implementation SGDownloadMasterViewController

@synthesize detailViewController = _detailViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    
    toDownloadFiles = [[NSMutableArray alloc] initWithObjects:@"http://www.hollywooddesktop.com/w/actresses/1920x1200/jennifer_aniston-010-1920x1200-hollywooddesktop.jpg",@"http://www.hollywooddesktop.com/w/actresses/1920x1200/jennifer_aniston-009-1920x1200-hollywooddesktop.jpg",@"http://www.hollywooddesktop.com/w/musicians/2560x1600/katy_perry-009-2560x1600-hollywooddesktop.jpg",@"http://www.hollywooddesktop.com/w/musicians/2560x1600/katy_perry-008-2560x1600-hollywooddesktop.jpg",@"http://www.hollywooddesktop.com/w/musicians/2560x1600/katy_perry-007-2560x1600-hollywooddesktop.jpg",@"http://www.hollywooddesktop.com/wallpaper/musicians/1920x1200/katy_perry-001-1920x1200-hollywooddesktop.jpg",@"http://www.hollywooddesktop.com/w/actresses/2560x1600/kristen_stewart-009-2560x1600-hollywooddesktop.jpg",@"http://www.hollywooddesktop.com/w/musicians/1920x1200/taylor_swift-014-1920x1200-hollywooddesktop.jpg",@"http://www.hollywooddesktop.com/w/musicians/2560x1600/taylor_swift-011-2560x1600-hollywooddesktop.jpg",@"http://www.hollywooddesktop.com/wallpaper/musicians/2560x1600/taylor_swift-006-2560x1600-hollywooddesktop.jpg",nil];
}

- (void)viewDidUnload
{
    [self setCtable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [toDownloadFiles count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    SGDownloadProgressCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[SGDownloadProgressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier downloadURL:[NSURL URLWithString:[toDownloadFiles objectAtIndex:indexPath.row]]];

        [cell startWithDelegate:self];
    }

    
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[SGDownloadDetailViewController alloc] initWithNibName:@"SGDownloadDetailViewController" bundle:nil];
    }
    SGDownloadProgressCell* cell = (SGDownloadProgressCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    if(cell.downloadedData!=nil) {
        self.detailViewController.imageData = cell.downloadedData;
        [self.navigationController pushViewController:self.detailViewController animated:YES];
    }
}


#pragma mark - progressCell
-(void)progressCellDownloadProgress:(float)progress Percentage:(NSInteger)percentage ProgressCell:(SGDownloadProgressCell *)cell{
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d %%",percentage];
    
}
-(void)progressCellDownloadFinished:(NSData*)fileData ProgressCell:(SGDownloadProgressCell *)cell{
    
    if(DELETE_DONE) {
        NSIndexPath* indexPath = [self.ctable indexPathForCell:cell];
        [toDownloadFiles removeObjectAtIndex:indexPath.row];

        [self.ctable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
    else {
        cell.textLabel.text = @"Finished";
    }
}
-(void)progressCellDownloadFail:(NSError*)error ProgressCell:(SGDownloadProgressCell *)cell{
    
}
@end
