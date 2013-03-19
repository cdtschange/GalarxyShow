//
//  GSUIDetailViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/2/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "GSUIDetailViewController.h"
#import "GSDetailCollectionViewCell.h"

@interface GSUIDetailViewController (){
    NSDictionary *sourceDataDictionary_;
    NSDictionary *sourceValueDictionary_;
    NSArray *dataArray_;
    NSArray *valueArray_;
}

- (void)initCollectionView;

@end

static NSString *const kCollectionCellIdentify = @"GSDetailCollectionCellView";

@implementation GSUIDetailViewController
@synthesize collectionView = collectionView_;

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
	// Do any additional setup after loading the view.
    sourceDataDictionary_ = @{
        @"animation":@[],
        @"audio":@[
            @"MDAudio Player",
            @"Sound Recorder",
            @"Audio Cocos2d",
            @"Online AudioPlayer",
            @"Sound Lyrics",
            @"Piano Audio",
            @"CMSound Engine",
            @"Voice TTS",
            @"Mixer Audio"],
        @"button":@[
            @"DBTile Button",
            @"Shaped Button",
            @"ZenPlayer Button",
            @"RoundProgress Button",
            @"MacOsLike Button",
            @"JPStupid Button",
            @"MAConfirm Button",
            @"Radio Button",
            @"DAReload Activity",
            @"QuadCurve Menu",
            @"QBKOverlay Menu",
            @"JCGrid Menu",
            @"MGTile Menu",
            @"TouchPie Menu",
            @"Action Header View"],
        @"calendar":@[
            @"OC Calendar",
            @"Vurig Calendar",
            @"CK Calendar"],
        @"chart":@[
            @"Plot Creator",
            @"XY PieChart",
            @"FRD 3D BarChart",
            @"JTYBattery BarChart",
            @"Percentage Chart"],
        @"drawing":@[
            @"IL ColorPicker",
            @"Inf ColorPicker",
            @"KZ ColorPicker",
            @"Animated Path",
            @"My Palette"],
        @"gesture":@[
            @"SPUserResizable View",
            @"Hegaka DragDropBin",
            @"JM WhenTappedView",
            @"OneFinger Rotation",
            @"Pinch SplitView",
            @"Drag Button",
            @"JDDroppable View",
            @"AllAround PullView",
            @"AM GravityView",
            @"Shake View",
            @"TK DragView"],
        @"hud":@[
            @"MBProgress HUD",
            @"ATM HUD",
            @"SVStatus HUD",
            @"Dejal ActivityView",
            @"TISpring LoadedViews",
            @"ZAActivity Bar"],
        @"image":@[
            @"FGallery View",
            @"MWPhoto BrowserView",
            @"SCGif Example",
            @"Thumbnail PickerView",
            @"ImageReflection View",
            @"MagnifyingGlass View",
            @"JSAnimated ImagesView",
            @"Curled View",
            @"Scratch MaskView",
            @"FVImage Sequence",
            @"SDWeb ImageView",
            @"AG ImagePicker",
            @"JCTiled ScrollView",
            @"GPUImage Filter",
            @"GPU DLC ImageFilter",
            @"CHYProgress ImageView",
            @"ELTranslucent View",
            @"JBKen BurnsView",
            @"DSGraphics Kit",
            @"Gif View",
            @"MTImage MapView",
            @"PinchScale ImageView",
            @"SMTransform Layer",
            @"Photo Stack",
            @"KICrop ImageView",
            @"BJCrop ImageView",
            @"Degree360 Panorama",
            @"WCSlider BeforeAfter",
            @"JBCroppable View"],
        @"label":@[
            @"JHTicker View",
            @"TTTAttributed Label",
            @"Marquee Label",
            @"StrikeThrough Label",
            @"RSMasked Label",
            @"TIToken Field",
            @"FX Label",
            @"AUI AnimatedText",
            @"FontTTF Label",
            @"BBCycling Label",
            @"PFSphere LabelView",
            @"Different FontsLabel",
            @"TagsCloud Label",
            @"RRS GlowLabel",
            @"TouchCloud Label",
            @"RT Label",
            @"DW TagList",
            @"ZCScroll NumLabel",
            @"MTAnimated Label",
            @"All LabelFont"],
        @"map":@[
            @"MapAnnotation Spike",
            @"Hazard Map",
            @"iCode Map",
            @"Map Callouts",
            @"Animated Callout",
            @"VPPMap Cluster",
            @"MapKit DragAndDrop",
            @"HGMoving Annotation",
            @"SM CalloutView",
            @"Region Annotation",
            @"MTDirections Kit",
            @"CustomMK AnnotationView"],
        @"navigationbar":@[
            @"Pretty Kit",
            @"NavBar CustomItem"],
        @"networking":@[
            @"ASIHttp Request",
            @"Reachability",
            @"SGdownload Manager"],
        @"picker":@[
            @"Loop Picker",
            @"AF PickerView",
            @"V8Horizontal PickerView",
            @"MultiDial Controller",
            @"ALMultiSelect PickerView",
            @"SM RotaryWheel",
            @"HZArea PickerView",
            @"CD Wheel"],
        @"popupview":@[
            @"CMPop TipView",
            @"SB TableAlert",
            @"DDLogin AlertPrompt",
            @"Block Alerts",
            @"LeveyPop ListView",
            @"YIPopup TextView",
            @"TB HintView",
            @"FP Popover",
            @"KNSemi ModalView",
            @"MK EntryPanel",
            @"UAModalPanel",
            @"CQMFloating Controller",
            @"Nifty SearchView",
            @"AGAlert Progressbar",
            @"MJPopup ViewController",
            @"MK InfoPanel",
            @"JS Notifier",
            @"TS Popover",
            @"CM ActionSheet",
            @"AH AlertView",
            @"Shaking AlertView",
            @"Custom AlertView",
            @"AW ActionSheet",
            @"JFDepth View",
            @"FWT PopoverView",
            @"GR AlertView"],
        @"progress":@[
            @"DDProgress View",
            @"DACircular Progress",
            @"YL ProgressBar",
            @"PDColored ProgressView",
            @"KD ProgressBar",
            @"BJ RangeSlider",
            @"AM ProgressView"],
        @"scrollview":@[
            @"DDPage Control",
            @"SliderPage Control",
            @"StyledPage Control",
            @"iCarousel",
            @"HV ScrollView",
            @"SY Paginator",
            @"DA Auto ScrollView",
            @"WKVertical ScrollBar",
            @"SGFocus ImageView",
            @"DAKeyboard Control",
            @"ISColumns View",
            @"SMPage Control",
            @"IAInfinite GridView",
            @"MDC ParallaxView",
            @"A3Parallax Scroll"],
        @"segment":@[
            @"Custom Segmented Control",
            @"SVSegmented Control",
            @"HMSegmented Control"],
        @"slider":@[
            @"MHRotary Knob",
            @"SQ Risk Cursor",
            @"Double Slider",
            @"F3Bar Gauge",
            @"UICircular Slider",
            @"UISound Mixer",
            @"SEFilter Control",
            @"NMRange Slider",
            @"TV Calibrated Slider"],
        @"statusbar":@[
            @"Discreet Notification",
            @"BW StatusBar Overlay"],
        @"switch":@[
            @"DCRound Switch"],
        @"tabbar":@[
            @"MHTabBar Controller"],
        @"table":@[],
        @"text":@[],
        @"viewlayout":@[
            @"PPReveal SideView"],
        @"viewtransition":@[],
        @"webview":@[],
        @"cocos2d":@[],
        @"others":@[]
    };
    sourceValueDictionary_ = @{
        @"animation":@[],
        @"audio":@[
            @"MDAudioPlayerViewController",
            @"SoundRecorderViewController",
            @"AudioCocos2dViewController",
            @"OLAudioPlayerViewController",
            @"SoundLyricsViewController",
            @"PianoAudioViewController",
            @"CMSoundEngineViewController",
            @"VoiceTTSViewController",
            @"MixerHostViewController"],
        @"button":@[
            @"DBTileButtonViewController",
            @"ShapedButtonViewController",
            @"ZenPlayerButtonViewController",
            @"RoundProgressButtonViewController",
            @"MacOsLikeButtonViewController",
            @"JPStupidButtonViewController",
            @"MAConfirmButtonViewController",
            @"RadioButtonViewController",
            @"DAReloadActivityViewController",
            @"QuadCurveMenuViewController",
            @"QBKOverlayMenuViewController",
            @"JCViewController",
            @"MLGViewController",
            @"TouchPieMenuViewController",
            @"DDActionHeaderViewController"],
        @"calendar":@[
            @"OCCalendarDemoViewController",
            @"VurigCalendarViewController",
            @"CKCalendarViewController"],
        @"chart":@[
            @"CreatorChartListViewController",
            @"XYPieChartViewController",
            @"FRD3DMainStoryboard",
            @"JTYBatteryBarChartViewController",
            @"PercentageChartViewController"],
        @"drawing":@[
            @"ILColorPickerViewController",
            @"InfColorPickerViewController",
            @"KZColorPickerViewController",
            @"AnimatedPathViewController",
            @"MyPaletteViewController"],
        @"gesture":@[
            @"SPUserResizableViewController",
            @"HegakaDragAndDropRecycleBinViewController",
            @"JMWhenTappedViewController",
            @"OneFingerRotationViewController",
            @"PinchSplitViewController",
            @"DragButtonViewController",
            @"JDDroppableViewController",
            @"AllAroundPullViewController",
            @"AMGravityViewController",
            @"ShakeViewController",
            @"TKDragViewController"],
        @"hud":@[
            @"MBProgressHUDViewController",
            @"ATMHudViewController",
            @"SVStatusHUDViewController",
            @"DejalActivityViewController",
            @"TISpringLoadedViewController",
            @"ZAActivityBarViewController"],
        @"image":@[
            @"FGalleryDemoViewController",
            @"MWPhotoBrowserViewController",
            @"SCGifExampleViewController",
            @"ThumbnailPickerViewController",
            @"ImageReflectionViewController",
            @"MagnifyingGlassViewController",
            @"JSAnimatedImagesViewController",
            @"CurledViewController",
            @"ScratchMaskViewController",
            @"FVImageSequenceViewController",
            @"SDWebImageDemoViewController",
            @"AGImagePickerViewController",
            @"JCTiledScrollViewController",
            @"GPUImageFilterViewController",
            @"GPUDLCImageFilterViewController",
            @"CHYProgressImageViewController",
            @"TranslucentViewController",
            @"JBKenBurnsViewController",
            @"DSGraphicsKitStoryboard",
            @"GifDemoViewController",
            @"MTImageMapViewController",
            @"PinchScaleImageViewController",
            @"SMTransformViewController",
            @"PhotoStackViewController",
            @"KICropImageViewController",
            @"BJCropImageViewController",
            @"Degree360PanoramaViewController",
            @"WCSliderBeforeAfterViewController",
            @"JBCroppableViewController"],
        @"label":@[
            @"JHTickerViewController",
            @"TTTAttributedLabelViewController",
            @"MarqueeLabelViewController",
            @"StrikeThroughLabelViewController",
            @"RSMaskedLabelViewController",
            @"TITokenFieldViewController",
            @"FXLabelViewController",
            @"AUIAnimatedTextViewController",
            @"FontTTFLabelViewController",
            @"BBCyclingLabelViewController",
            @"PFSphereLabelViewController",
            @"DifferentFontsLabelViewController",
            @"TagsCloudLabelViewController",
            @"RRSGlowLabelViewController",
            @"TouchCloudLabelViewController",
            @"RTLabelViewController",
            @"DWTagListViewController",
            @"ZCScrollNumLabelViewController",
            @"MTAnimatedLabelViewController",
            @"AllLabelFontViewController"],
        @"map":@[
            @"MapAnnotationSpikeViewController",
            @"HazardMapViewController",
            @"iCodeMapViewController",
            @"MapCalloutsViewController",
            @"AnimatedCalloutViewController",
            @"VPPMapClusterViewController",
            @"MapKitDragAndDropViewController",
            @"HGMovingAnnotationViewController",
            @"SMCalloutViewController",
            @"RegionAnnotationViewController",
            @"MTDirectionsSampleViewController",
            @"CustomMKAnnotationViewController"],
        @"navigationbar":@[
            @"PrettyKitDemoViewController",
            @"NavBarCustomItemMainViewController"],
        @"networking":@[
            @"ASIDemoRootViewController",
            @"ReachabilityDemoViewController",
            @"SGDownloadMasterViewController"],
        @"picker":@[
            @"LoopPickerViewController",
            @"AFPickerViewController",
            @"V8HorizontalPickerViewController",
            @"MultiDialViewDemoController",
            @"ALMultiSelectPickerViewController",
            @"SMRotaryWheelViewController",
            @"HZAreaPickerViewController",
            @"CDWheelDemoViewController"],
        @"popupview":@[
            @"CMPopTipViewController",
            @"SBTableAlertViewController",
            @"DDLoginAlertPromptViewController",
            @"BlockAlertsDemoViewController",
            @"LeveyPopListViewController",
            @"YIPopupTextViewController",
            @"TBHintDemoViewController",
            @"FPPopoverViewController",
            @"KNSemiModalViewController",
            @"MKEntryPanelViewController",
            @"UAModalPanelViewController",
            @"CQMFloatingViewController",
            @"NiftySearchViewController",
            @"AGAlertProgressbarViewController",
            @"MJPopupViewController",
            @"MKInfoPanelDemoViewController",
            @"JSNotifierViewController",
            @"TSPopoverViewController",
            @"CMActionSheetViewController",
            @"AHAlertViewController",
            @"ShakingAlertViewController",
            @"CustomAlertViewController",
            @"AWIconSheetViewController",
            @"JFDepthBottomViewController",
            @"FWTPopoverViewController",
            @"GRAlertViewController"],
        @"progress":@[
            @"DDProgressViewController",
            @"DACircularProgressViewController",
            @"YLProgressBarViewController",
            @"PDColoredProgressViewController",
            @"KDProgressBarViewController",
            @"BJRangeSliderWithProgressViewController",
            @"AMProgressViewController"],
        @"scrollview":@[
            @"DDPageControlViewController",
            @"SliderPageControlViewController",
            @"StyledPageControlViewController",
            @"iCarouselExampleViewController",
            @"HVScrollViewController",
            @"SYPaginatorDemoViewController",
            @"DAAutoScrollViewController",
            @"WKVerticalScrollBarViewController",
            @"SGFocusImageViewController",
            @"DAKeyboardControlViewController",
            @"ISColumnsViewController",
            @"SMPageControlViewController",
            @"IAInfiniteGridViewController",
            @"MDCParallaxViewController",
            @"A3ParallaxScrollViewController"],
        @"segment":@[
            @"CustomSegmentedViewController",
            @"SVSegmentedViewController",
            @"HMSegmentedViewController"],
        @"slider":@[
            @"MHRotaryKnobViewController",
            @"SQRiskCursorViewController",
            @"DoubleSliderViewController",
            @"F3BarGaugeViewController",
            @"UICircularSliderViewController",
            @"UISoundMixerViewController",
            @"SEFilterViewController",
            @"NMRangeSliderViewController",
            @"TVCalibratedSliderViewController"],
        @"statusbar":@[
            @"GCDiscreetNotificationViewController",
            @"BWStatusBarOverlayViewController"],
        @"switch":@[
            @"DCRoundSwitchViewController"],
        @"tabbar":@[
            @"MHTabBarDemoViewController"],
        @"table":@[],
        @"text":@[],
        @"viewlayout":@[
            @"PPRevealSideRootViewController"],
        @"viewtransition":@[],
        @"webview":@[],
        @"cocos2d":@[],
        @"others":@[]
    };
    dataArray_ = sourceDataDictionary_[@"button"];
    valueArray_ = sourceValueDictionary_[@"button"];
    [self initCollectionView];
}

- (void)didReceiveMemoryWarning
{
    [self setCollectionView:nil];
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

-(void)dealloc{
    [self setCollectionView:nil];
}

- (void)viewDidUnload {
    [self setCollectionView:nil];
    [super viewDidUnload];
}

-(void)reloadData:(NSString *)key{
    if ([[sourceDataDictionary_ allKeys] containsObject:key]&&[[sourceValueDictionary_ allKeys] containsObject:key]) {
        dataArray_ = sourceDataDictionary_[key];
        valueArray_ = sourceValueDictionary_[key];
        [collectionView_ reloadData];
    }
}

#pragma mark - Private Methods
- (void)initCollectionView{
    [collectionView_ registerClass:[GSDetailCollectionViewCell class] forCellWithReuseIdentifier:kCollectionCellIdentify];
    PSTCollectionViewFlowLayout *flowLayout = [PSTCollectionViewFlowLayout new];
    [flowLayout setSectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [collectionView_ setCollectionViewLayout:(PSTCollectionViewLayout *)flowLayout];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return dataArray_.count;
}

- (PSTCollectionViewCell *)collectionView:(PSTCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PSTCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionCellIdentify
                                                                             forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[PSTCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 128, 128)];
    }
    
    if (cell.reuseIdentifier == kCollectionCellIdentify) {
        NSString *name = dataArray_[indexPath.row];

        UILabel *lblId = (UILabel*)[cell viewWithTag:1];
        lblId.text = name;
    }
    
    return cell;
}



///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - PSTCollectionViewDelegateFlowLayout

- (CGSize)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(128, 128);
}

- (CGFloat)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

- (CGFloat)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}
-(void)collectionView:(PSTCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cname = valueArray_[indexPath.row];
    if ([cname hasSuffix:@"Storyboard"]) {
        UIStoryboard *stryBoard=[UIStoryboard storyboardWithName:cname bundle:nil];
        [self presentModalViewController:[stryBoard instantiateInitialViewController] animated:YES];
    }else{
        Class class = NSClassFromString(cname);
        
        UIViewController *controller = [[class alloc] initWithNibName:cname bundle:nil];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
        controller.title = dataArray_[indexPath.row];
        [navController.navigationBar setBarStyle:UIBarStyleBlackOpaque];
        [self presentModalViewController:navController animated:YES];
    }
}

@end
