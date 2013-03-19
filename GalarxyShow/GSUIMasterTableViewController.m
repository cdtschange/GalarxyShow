//
//  GSUIMasterTableViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/2/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "GSUIMasterTableViewController.h"
#import "GSUIDetailViewController.h"

@interface GSUIMasterTableViewController (){
    NSArray *dataArray_;
    NSArray *keyArray_;
    NSArray *imageArray_;
}

@end

@implementation GSUIMasterTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    dataArray_ = @[
        @"动画",
        @"音频声效",
        @"按钮",
        @"日历",
        @"图表",
        @"绘图",
        @"手势",
        @"指示器",
        @"图像",
        @"标签",
        @"地图",
        @"导航条",
        @"网络",
        @"选择器",
        @"弹出视图",
        @"进度条",
        @"滚动视图",
        @"分段选择",
        @"滑杆",
        @"状态栏",
        @"开关",
        @"选项卡",
        @"列表",
        @"文字视图",
        @"视图布局",
        @"视图切换",
        @"网页",
        @"Cocos2d",
        @"其他"];
    keyArray_ = @[
        @"animation",
        @"audio",
        @"button",
        @"calendar",
        @"chart",
        @"drawing",
        @"gesture",
        @"hud",
        @"image",
        @"label",
        @"map",
        @"navigationbar",
        @"networking",
        @"picker",
        @"popupview",
        @"progress",
        @"scrollview",
        @"segment",
        @"slider",
        @"statusbar",
        @"switch",
        @"tabbar",
        @"table",
        @"text",
        @"viewlayout",
        @"viewtransition",
        @"webview",
        @"cocos2d",
        @"others"];
    imageArray_ = @[
        @"icon_animation.png",
        @"icon_audio.png",
        @"icon_button.png",
        @"icon_calendar.png",
        @"icon_chart.png",
        @"icon_drawing.png",
        @"icon_gesture.png",
        @"icon_hud.png",
        @"icon_image.png",
        @"icon_label.png",
        @"icon_map.png",
        @"icon_navigationbar.png",
        @"icon_networking.png",
        @"icon_picker.png",
        @"icon_popupview.png",
        @"icon_progress.png",
        @"icon_scrollview.png",
        @"icon_segment.png",
        @"icon_slider.png",
        @"icon_statusbar.png",
        @"icon_switch.png",
        @"icon_tabbar.png",
        @"icon_table.png",
        @"icon_text.png",
        @"icon_viewlayout.png",
        @"icon_viewtransition.png",
        @"icon_webview.png",
        @"icon_cocos2d.png",
        @"icon_others.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return dataArray_.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"GSUIMasterTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    cell.textLabel.text = dataArray_[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:imageArray_[indexPath.row]];
    
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
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
     */
    UINavigationController *detailVCNav=[self.splitViewController.viewControllers objectAtIndex:1];
    GSUIDetailViewController *detailVC = detailVCNav.viewControllers[0];
    [detailVC reloadData:keyArray_[indexPath.row]];
}

@end
