//
//  DDPageControlViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/10/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "DDPageControlViewController.h"
#import <GalarxyUIKitLib/DDPageControl.h>

#define ARC4RANDOM_MAX	0x100000000

@interface DDPageControlViewController ()

@end

@implementation DDPageControlViewController

@synthesize scrollView ;


- (void)dealloc
{
	self.scrollView = nil ;
}
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
    int numberOfPages = 10 ;
	
	// define the scroll view content size and enable paging
	[scrollView setPagingEnabled: YES] ;
	[scrollView setContentSize: CGSizeMake(scrollView.bounds.size.width * numberOfPages, scrollView.bounds.size.height)] ;
	
	// programmatically add the page control
	pageControl = [[DDPageControl alloc] init] ;
	[pageControl setCenter: CGPointMake(self.view.center.x, self.view.bounds.size.height-30.0f)] ;
	[pageControl setNumberOfPages: numberOfPages] ;
	[pageControl setCurrentPage: 0] ;
	[pageControl addTarget: self action: @selector(pageControlClicked:) forControlEvents: UIControlEventValueChanged] ;
	[pageControl setDefersCurrentPageDisplay: YES] ;
	[pageControl setType: DDPageControlTypeOnFullOffEmpty] ;
	[pageControl setOnColor: [UIColor colorWithWhite: 0.9f alpha: 1.0f]] ;
	[pageControl setOffColor: [UIColor colorWithWhite: 0.7f alpha: 1.0f]] ;
	[pageControl setIndicatorDiameter: 15.0f] ;
	[pageControl setIndicatorSpace: 15.0f] ;
	[self.view addSubview: pageControl] ;
	
	UILabel *pageLabel ;
	CGRect pageFrame ;
	UIColor *color ;
	char aLetter ;
	for (int i = 0 ; i < numberOfPages ; i++)
	{
		// determine the frame of the current page
		pageFrame = CGRectMake(i * scrollView.bounds.size.width, 0.0f, scrollView.bounds.size.width, scrollView.bounds.size.height) ;
		
		// create a page as a simple UILabel
		pageLabel = [[UILabel alloc] initWithFrame: pageFrame] ;
		
		// add it to the scroll view
		[scrollView addSubview: pageLabel] ;
		
		// determine and set its (random) background color
		color = [UIColor colorWithRed: (CGFloat)arc4random()/ARC4RANDOM_MAX green: (CGFloat)arc4random()/ARC4RANDOM_MAX blue: (CGFloat)arc4random()/ARC4RANDOM_MAX alpha: 1.0f] ;
		[pageLabel setBackgroundColor: color] ;
		
		// set some label properties
		[pageLabel setFont: [UIFont boldSystemFontOfSize: 200.0f]] ;
		[pageLabel setTextAlignment: UITextAlignmentCenter] ;
		[pageLabel setTextColor: [UIColor darkTextColor]] ;
		
		// set the label's text as the letter corresponding to the current page index
		aLetter = (char)((i+65)-(i/26)*26) ;	// the capitalized alphabet characters are in the range 65-90
		[pageLabel setText: [NSString stringWithFormat: @"%c", aLetter]] ;
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark DDPageControl triggered actions

- (void)pageControlClicked:(id)sender
{
	DDPageControl *thePageControl = (DDPageControl *)sender ;
	
	// we need to scroll to the new index
	[scrollView setContentOffset: CGPointMake(scrollView.bounds.size.width * thePageControl.currentPage, scrollView.contentOffset.y) animated: YES] ;
}


#pragma mark -
#pragma mark UIScrollView delegate methods

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
	CGFloat pageWidth = scrollView.bounds.size.width ;
    float fractionalPage = scrollView.contentOffset.x / pageWidth ;
	NSInteger nearestNumber = lround(fractionalPage) ;
	
	if (pageControl.currentPage != nearestNumber)
	{
		pageControl.currentPage = nearestNumber ;
		
		// if we are dragging, we want to update the page control directly during the drag
		if (scrollView.dragging)
			[pageControl updateCurrentPageDisplay] ;
	}
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)aScrollView
{
	// if we are animating (triggered by clicking on the page control), we update the page control
	[pageControl updateCurrentPageDisplay] ;
}

@end
