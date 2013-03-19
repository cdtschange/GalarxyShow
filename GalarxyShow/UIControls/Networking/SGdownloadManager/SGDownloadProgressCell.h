//
//  progressCell.h
//  downloadManager
//
//  Created by Htain Lin Shwe on 11/7/12.
//  Copyright (c) 2012 Edenpod. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyFoundationLib/SGdownloader.h>

@class SGDownloadProgressCell;
@protocol SGDownloadProgressCellDelegate<NSObject>
@required
-(void)progressCellDownloadProgress:(float)progress Percentage:(NSInteger)percentage ProgressCell:(SGDownloadProgressCell*)cell;
-(void)progressCellDownloadFinished:(NSData*)fileData ProgressCell:(SGDownloadProgressCell*)cell;
-(void)progressCellDownloadFail:(NSError*)error ProgressCell:(SGDownloadProgressCell*)cell; 
@end



@interface SGDownloadProgressCell : UITableViewCell <SGdownloaderDelegate>
@property (nonatomic,readonly) NSData *downloadedData;
@property (nonatomic,readonly) NSURL *downloadURL;
@property (nonatomic,strong) id<SGDownloadProgressCellDelegate> delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier downloadURL:(NSURL*)url;

-(void)startWithDelegate:(id<SGDownloadProgressCellDelegate>)delegate;
@end
