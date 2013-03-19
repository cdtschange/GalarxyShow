//
//  V8HorizontalPickerViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/2/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "V8HorizontalPickerViewController.h"

@interface V8HorizontalPickerViewController (){
    
    NSMutableArray *titleArray;
    int indexCount;
}

@end

@implementation V8HorizontalPickerViewController
@synthesize pickerView;
@synthesize nextButton, reloadButton;
@synthesize infoLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)dealloc{
	self.pickerView = nil;
	self.nextButton = nil;
	self.infoLabel  = nil;
    self.reloadButton =nil;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    titleArray = [NSMutableArray arrayWithObjects:@"All", @"Today", @"Thursday",
                   @"Wednesday", @"Tuesday", @"Monday", nil];
    // titleArray = [[NSMutableArray array] retain]; // for testing
    indexCount = 0;
    
    self.view.backgroundColor = [UIColor blackColor];
	CGFloat margin = 340.0f;
	CGFloat width = (self.view.bounds.size.width - (margin * 2.0f));
	CGFloat pickerHeight = 40.0f;
	CGFloat x = margin;
	CGFloat y = 150.0f;
	CGFloat spacing = 25.0f;
	CGRect tmpFrame = CGRectMake(x, y, width, pickerHeight);
    //
    //	CGFloat width = 200.0f;
    //	CGFloat x = (self.view.frame.size.width - width) / 2.0f;
    //	CGRect tmpFrame = CGRectMake(x, 150.0f, width, 40.0f);
    
	pickerView = [[V8HorizontalPickerView alloc] initWithFrame:tmpFrame];
	pickerView.backgroundColor   = [UIColor darkGrayColor];
	pickerView.selectedTextColor = [UIColor whiteColor];
	pickerView.textColor   = [UIColor grayColor];
	pickerView.delegate    = self;
	pickerView.dataSource  = self;
	pickerView.elementFont = [UIFont boldSystemFontOfSize:14.0f];
	pickerView.selectionPoint = CGPointMake(60, 0);
    
	// add carat or other view to indicate selected element
	UIImageView *indicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"v8hpicker_indicator"]];
	pickerView.selectionIndicatorView = indicator;
    //	pickerView.indicatorPosition = V8HorizontalPickerIndicatorTop; // specify indicator's location
    
	// add gradient images to left and right of view if desired
	UIImageView *leftFade = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"v8hpicker_left_fade"]];
	pickerView.leftEdgeView = leftFade;

	UIImageView *rightFade = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"v8hpicker_right_fade"]];
	pickerView.rightEdgeView = rightFade;
    
    // add image to left of scroll area
	UIImageView *leftImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"v8hpicker_loopback"]];
	pickerView.leftScrollEdgeView = leftImage;
	pickerView.scrollEdgeViewPadding = 20.0f;

	UIImageView *rightImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"v8hpicker_airplane"]];
	pickerView.rightScrollEdgeView = rightImage;
    
	[self.view addSubview:pickerView];
	
	self.nextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	y = y + tmpFrame.size.height + spacing;
	tmpFrame = CGRectMake(x, y, width, 50.0f);
	nextButton.frame = tmpFrame;
	[nextButton addTarget:self
				   action:@selector(nextButtonTapped:)
		 forControlEvents:UIControlEventTouchUpInside];
	[nextButton	setTitle:@"Center Element 0" forState:UIControlStateNormal];
	nextButton.titleLabel.textColor = [UIColor blackColor];
	[self.view addSubview:nextButton];
	
	self.reloadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	y = y + tmpFrame.size.height + spacing;
	tmpFrame = CGRectMake(x, y, width, 50.0f);
	reloadButton.frame = tmpFrame;
	[reloadButton addTarget:self
					 action:@selector(reloadButtonTapped:)
		   forControlEvents:UIControlEventTouchUpInside];
	[reloadButton setTitle:@"Reload Data" forState:UIControlStateNormal];
	[self.view addSubview:reloadButton];
	
	y = y + tmpFrame.size.height + spacing;
	tmpFrame = CGRectMake(x, y, width, 50.0f);
	infoLabel = [[UILabel alloc] initWithFrame:tmpFrame];
	infoLabel.backgroundColor = [UIColor blackColor];
	infoLabel.textColor = [UIColor whiteColor];
	infoLabel.textAlignment = UITextAlignmentCenter;
	[self.view addSubview:infoLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[pickerView scrollToElement:0 animated:NO];
}

#pragma mark - Button Tap Handlers
- (void)nextButtonTapped:(id)sender {
	[pickerView scrollToElement:indexCount animated:NO];
	indexCount += 1;
	if ([titleArray count] <= indexCount) {
		indexCount = 0;
	}
	[nextButton	setTitle:[NSString stringWithFormat:@"Center Element %d", indexCount]
				forState:UIControlStateNormal];
}

- (void)reloadButtonTapped:(id)sender {
	// change our title array so we can see a change
	if ([titleArray count] > 1) {
		[titleArray removeLastObject];
	}
    
	[pickerView reloadData];
}

#pragma mark - HorizontalPickerView DataSource Methods
- (NSInteger)numberOfElementsInHorizontalPickerView:(V8HorizontalPickerView *)picker {
	return [titleArray count];
}

#pragma mark - HorizontalPickerView Delegate Methods
- (NSString *)horizontalPickerView:(V8HorizontalPickerView *)picker titleForElementAtIndex:(NSInteger)index {
	return [titleArray objectAtIndex:index];
}

- (NSInteger) horizontalPickerView:(V8HorizontalPickerView *)picker widthForElementAtIndex:(NSInteger)index {
	CGSize constrainedSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
	NSString *text = [titleArray objectAtIndex:index];
	CGSize textSize = [text sizeWithFont:[UIFont boldSystemFontOfSize:14.0f]
					   constrainedToSize:constrainedSize
						   lineBreakMode:UILineBreakModeWordWrap];
	return textSize.width + 40.0f; // 20px padding on each side
}

- (void)horizontalPickerView:(V8HorizontalPickerView *)picker didSelectElementAtIndex:(NSInteger)index {
	self.infoLabel.text = [NSString stringWithFormat:@"Selected index %d", index];
}
@end
