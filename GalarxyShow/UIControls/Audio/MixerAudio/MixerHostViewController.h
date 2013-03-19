/*
 
 Apple's original comments:
 
    File: MixerHostViewController.h
Abstract: View controller: Sets up the user interface and conveys UI actions 
to the MixerHostAudio object. Also responds to state-change notifications from
the MixerHostAudio object.
 Version: 1.0



*/


#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"

@class MixerHostAudio;

@interface MixerHostViewController : ControlBaseViewController 
@property (nonatomic, weak)    IBOutlet UIBarButtonItem    *playButton; 

@property (nonatomic, weak)    IBOutlet UISwitch           *mixerBus0Switch;
// @property (nonatomic, weak)    IBOutlet UISwitch           *mixerBus1Switch;

@property (nonatomic, weak)    IBOutlet UISwitch           *mixerBus2Switch;
@property (nonatomic, weak)    IBOutlet UISegmentedControl *micFxSelector;


@property (nonatomic, weak)    IBOutlet UILabel			*micFreqDisplay;
@property (nonatomic, weak)    IBOutlet UILabel			*micLevelDisplay;
@property (nonatomic, weak)    IBOutlet UIProgressView    *inputLevelDisplayLeft;
@property (nonatomic, weak)    IBOutlet UIProgressView    *inputLevelDisplayRight;

@property (nonatomic, weak)    IBOutlet UILabel           *numberOfInputChannelsDisplay; 

@property (nonatomic, weak)    IBOutlet UISwitch           *mixerBus3Switch;
@property (nonatomic, weak)    IBOutlet UIButton           *synthPlayButton;

@property (nonatomic, weak)    IBOutlet UISwitch           *mixerBus4Switch;
@property (nonatomic, weak)    IBOutlet UIButton           *samplerPlayButton;

@property (nonatomic, weak)    IBOutlet UISwitch           *mixerBus5Switch;
@property (nonatomic, weak)    IBOutlet UISwitch           *mixerBus5FxSwitch;

@property (nonatomic, weak)    IBOutlet UISlider           *mixerBus0LevelFader;
@property (nonatomic, weak)    IBOutlet UISlider           *mixerBus1LevelFader;
@property (nonatomic, weak)    IBOutlet UISlider           *mixerBus2LevelFader;
@property (nonatomic, weak)    IBOutlet UISlider           *mixerBus3LevelFader;
@property (nonatomic, weak)    IBOutlet UISlider           *mixerBus4LevelFader;
@property (nonatomic, weak)    IBOutlet UISlider           *mixerBus5LevelFader;

@property (nonatomic, weak)    IBOutlet UISlider           *mixerOutputLevelFader;
@property (nonatomic, weak)    IBOutlet UISwitch           *mixerFxSwitch;


@property (nonatomic, weak)    IBOutlet UISlider           *micFxFader;
@property (nonatomic, weak)    IBOutlet UISwitch           *micFxSwitch;


@property (nonatomic, strong)    MixerHostAudio              *audioObject;


- (IBAction) enableMixerInput:          (UISwitch *) sender;
- (IBAction) mixerInputGainChanged:     (UISlider *) sender;
- (IBAction) mixerOutputGainChanged:    (UISlider *) sender;
- (IBAction) playOrStop:                (id) sender;

- (IBAction) samplerPlayButtonPressed:                (UIButton *) sender;
- (IBAction) samplerPlayButtonReleased:                (UIButton *) sender;

- (IBAction) synthPlayButtonPressed:                (UIButton *) sender;
- (IBAction) synthPlayButtonReleased:                (UIButton *) sender;



-(IBAction) micFxFaderChanged:			(UISlider *) sender; 
-(IBAction) enableMicFx:				(UISwitch *) sender;
-(IBAction) micFxSelectorChanged:       (UISegmentedControl *) sender;

-(IBAction) enableMixerFx:				(UISwitch *) sender;
-(IBAction) enableMixerBus5Fx:				(UISwitch *) sender;

+ (void) doAlert;

- (void) handlePlaybackStateChanged: (id) notification;
- (void) initializeMixerSettingsToUI;
- (void) registerForAudioObjectNotifications;
// - (void) updateFreqDisplay;							// update text field with current pitch 

- (void) myMethod: (NSTimer *) timer;				// freq display timer method selector


@end
