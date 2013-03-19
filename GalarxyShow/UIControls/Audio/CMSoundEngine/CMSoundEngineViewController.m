//
//  CMSoundEngineViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/19/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "CMSoundEngineViewController.h"
#import <GalarxyUIKitLib/CMOpenALSoundManager.h>

@interface CMSoundEngineViewController ()
{
    CMOpenALSoundManager *soundMgr;
}
@end

@implementation CMSoundEngineViewController

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
	
	//start the audio manager...
	soundMgr = [[CMOpenALSoundManager alloc] init];
	soundMgr.soundFileNames = [NSArray arrayWithObject:@"cmsound_Start.caf"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	// start background music
	[soundMgr playBackgroundMusic:@"cmsound_backgroundLoop.m4a"]; // you could use forcePlay: YES if you wanted to stop any other audio source (iPod)
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	if(section == 0)
		return @"Background Audio Volume";
	else if(section == 1)
		return @"Effects volume";
	
	else return nil;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		
		// create a slider for the first 2 sections only
		if(indexPath.section < 2)
		{
			UISlider *slider;
			slider = [[UISlider alloc] initWithFrame:CGRectMake(5.0, 0.0, cell.bounds.size.width - cell.indentationWidth * 2.0, cell.bounds.size.height)];
			slider.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
			slider.minimumValueImage = [UIImage imageNamed:@"cmsound_volumedown.png"];
			slider.maximumValueImage = [UIImage imageNamed:@"cmsound_volumeup.png"];
			
			slider.maximumValue = 1.0;
			slider.minimumValue = 0.0;
			slider.value = 1.0; // in a real app you should read this value from the user defaults
			
			if(indexPath.section == 0)
			{
				[slider addTarget:self action:@selector(musicVolume:) forControlEvents:UIControlEventValueChanged];
				slider.enabled = !soundMgr.isiPodAudioPlaying; // disable the slider if the ipod is playing...
			}
			else
				[slider addTarget:self action:@selector(effectsVolume:) forControlEvents:UIControlEventValueChanged];
			
			
			[cell.contentView addSubview:slider];
		}
    }
    
	// Configure the cell.
	if(indexPath.section == 2)
	{
		cell.textLabel.text = @"Play sound effect";
		cell.textLabel.textAlignment = UITextAlignmentCenter;
	}
	else if(indexPath.section == 3)
	{
		cell.textLabel.text = @"Play/Pause background music";
		cell.textLabel.textAlignment = UITextAlignmentCenter;
	}
    
    return cell;
}

- (void) musicVolume:(id)sender
{
	soundMgr.backgroundMusicVolume = ((UISlider *)sender).value;
}

- (void) effectsVolume:(id)sender
{
	soundMgr.soundEffectsVolume = ((UISlider *)sender).value;
}


// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if(indexPath.section < 2) return;
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	if (indexPath.section == 2) {
		// play our sound effect
		[soundMgr playSoundWithID:AUDIOEFFECT];
		return;
	}
	
	if ([soundMgr isBackGroundMusicPlaying])
	{
		[soundMgr pauseBackgroundMusic];
	}
	else
	{
		[soundMgr resumeBackgroundMusic];
	}
    
}

@end
