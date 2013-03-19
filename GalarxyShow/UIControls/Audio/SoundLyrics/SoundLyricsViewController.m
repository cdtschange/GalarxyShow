//
//  SoundLyricsViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/18/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "SoundLyricsViewController.h"
#import "AVFoundation/AVFoundation.h"
#import <GalarxyUIKitLib/MusicLrcHelper.h>
#import <GalarxyUIKitLib/MusicLrcLine.h>

@interface SoundLyricsViewController ()
{
    NSArray *_arrayItemList;
    AVPlayer *player;
    
    NSTimer * _timerPlay;
    UITableView* _tableView;

}
@end

@implementation SoundLyricsViewController

-(void)dealloc{
    
    [player removeObserver:self forKeyPath:@"status"];
    player = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)goBack:(id)sender {
    if (_timerPlay) {
        [_timerPlay invalidate];
        _timerPlay = nil;
    }
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *lrcPath = [[NSBundle mainBundle] pathForResource:@"soundlyc_qbd" ofType:@"lrc"];
    NSString * lrcContent = [NSString stringWithContentsOfFile:lrcPath encoding:NSUTF8StringEncoding error:nil];
    _arrayItemList = [[[MusicLrcHelper alloc] init] parseLrc:lrcContent];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"播放" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(50, 420, 60, 35)];
    [btn addTarget:self action:@selector(playAudio:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];//100, 420, 60, 25
    
    
    UIButton *btnPause = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnPause setTitle:@"暂停" forState:UIControlStateNormal];
    [btnPause setFrame:CGRectMake(200, 420, 60, 35)];
    [btnPause addTarget:self action:@selector(pauseAudio:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnPause];//100, 420, 60, 25
    
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 420)];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [self.view addSubview:_tableView];
    }
    
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"soundlyc_qbd" ofType:@"mp3"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
    [self setupAVPlayerForURL:url];
    
    if (!_timerPlay)
    {
        _timerPlay = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(currentPlayTime) userInfo:nil repeats:YES];
    }


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setupAVPlayerForURL: (NSURL*) url {
    AVAsset *asset = [AVURLAsset URLAssetWithURL:url options:nil];
    AVPlayerItem *anItem = [AVPlayerItem playerItemWithAsset:asset];
    
    player = [AVPlayer playerWithPlayerItem:anItem];
    [player addObserver:self forKeyPath:@"status" options:0 context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if (object == player && [keyPath isEqualToString:@"status"]) {
        if (player.status == AVPlayerStatusFailed) {
            NSLog(@"AVPlayer Failed");
        } else if (player.status == AVPlayerStatusReadyToPlay) {
            NSLog(@"AVPlayer Ready to Play");
            [player play];
        } else if (player.status == AVPlayerItemStatusUnknown) {
            NSLog(@"AVPlayer Unknown");
        }
    }
}

-(Float64) currentPlayTime
{
    if (player)
    {
        CMTime currentTime = player.currentItem.currentTime;
        Float64 fCurrentTime = CMTimeGetSeconds(currentTime);
        //        NSLog(@"fCurrentPlayTime = %f",fCurrentTime);
        int currentIndex = [self currentPlayIndex:[NSString stringWithFormat:@"%f",fCurrentTime]];
        
        [_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:(NSUInteger )currentIndex inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        NSLog(@"currentIndex = %d",currentIndex);
        return fCurrentTime;
    }
    return -1.0f;
}

#pragma mark uitableViewDelegate回调
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_arrayItemList count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellI = @"CellI";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellI];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellI];
    }
    
    if (cell)
    {
        MusicLrcLine *line = [_arrayItemList objectAtIndex:indexPath.row];
        NSString *key = @"key is nil";
        NSString *value = @"value is nil";
        if (line)
        {
            key = [NSString stringWithFormat:@"%f",line.timeLine ];
            value = line.songLineText;
            cell.textLabel.text = value;
            cell.detailTextLabel.text  = key;
        }
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self playAudio:nil];
}

-(void) playAudio:(id) sender
{
    [player play];
}
-(void) pauseAudio:(id) sender
{
    [player pause];
}
-(int) currentPlayIndex:(NSString*) currentPlaySecond
{
    if (!currentPlaySecond || currentPlaySecond.length <= 0)
        return 0;
//    float fCurrentSecond = currentPlaySecond.floatValue;
    int index;
    for (index = 0; index < _arrayItemList.count; index++)
    {
        MusicLrcLine *line = [_arrayItemList objectAtIndex:index];
        if (line)
        {
            float fValue = line.timeLine;
            if (fValue > currentPlaySecond.floatValue)
                break;
        }
    }
    return index - 1;
}



@end
