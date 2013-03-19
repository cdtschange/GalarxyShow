//
//  SliderPageControlViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 1/10/13.
//  Copyright (c) 2013 isoftstone. All rights reserved.
//

#import "SliderPageControlViewController.h"

@interface SliderPageControlViewController ()

@end

@implementation SliderPageControlViewController
@synthesize scrollView;
@synthesize demoContent;
@synthesize sliderPageControl;

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
    
    self.demoContent = [NSMutableArray new];
    NSMutableDictionary *page1 = [NSMutableDictionary dictionary];
    [page1 setObject:@"RED" forKey:@"title"];
    [page1 setObject:[UIColor redColor] forKey:@"color"];
    [self.demoContent addObject:page1];
    NSMutableDictionary *page2 = [NSMutableDictionary dictionary];
    [page2 setObject:@"ORANGE" forKey:@"title"];
    [page2 setObject:[UIColor orangeColor] forKey:@"color"];
    [self.demoContent addObject:page2];
    NSMutableDictionary *page3 = [NSMutableDictionary dictionary];
    [page3 setObject:@"YELLOW" forKey:@"title"];
    [page3 setObject:[UIColor yellowColor] forKey:@"color"];
    [self.demoContent addObject:page3];
    NSMutableDictionary *page4 = [NSMutableDictionary dictionary];
    [page4 setObject:@"GREEN" forKey:@"title"];
    [page4 setObject:[UIColor greenColor] forKey:@"color"];
    [self.demoContent addObject:page4];
    NSMutableDictionary *page5 = [NSMutableDictionary dictionary];
    [page5 setObject:@"BLUE" forKey:@"title"];
    [page5 setObject:[UIColor blueColor] forKey:@"color"];
    [self.demoContent addObject:page5];
    NSMutableDictionary *page6 = [NSMutableDictionary dictionary];
    [page6 setObject:@"PURPLE" forKey:@"title"];
    [page6 setObject:[UIColor purpleColor] forKey:@"color"];
    [self.demoContent addObject:page6];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,[self.view bounds].size.width,[self.view bounds].size.height)];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setContentSize:CGSizeMake([self.demoContent count]*self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setDelegate:self];
    [self.view addSubview:self.scrollView];
    
    self.sliderPageControl = [[SliderPageControl  alloc] initWithFrame:CGRectMake(0,[self.view bounds].size.height-20,[self.view bounds].size.width,20)];
    self.sliderPageControl.viewFrame = self.view.bounds;
    [self.sliderPageControl addTarget:self action:@selector(onPageChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderPageControl setDelegate:self];
    [self.sliderPageControl setShowsHint:YES];
    [self.view addSubview:self.sliderPageControl];
    [self.sliderPageControl setNumberOfPages:[self.demoContent count]];
    [self.sliderPageControl setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
    
    
    for (int i=0; i<[self.demoContent count]; i++)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i*self.scrollView.frame.size.width,0,self.scrollView.frame.size.width,self.scrollView.frame.size.height)];
        [view setBackgroundColor:[[self.demoContent objectAtIndex:i] objectForKey:@"color"]];
        [self.scrollView addSubview:view];
    }
    
    [self changeToPage:1 animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {
	self.sliderPageControl =nil;
	self.demoContent =nil;
    self.scrollView =nil;
}

#pragma mark scrollview delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView_
{
	pageControlUsed = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView_
{
    if (pageControlUsed)
	{
        return;
    }
	
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
	
	[sliderPageControl setCurrentPage:page animated:YES];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView_
{
	pageControlUsed = NO;
}

#pragma mark sliderPageControlDelegate

- (NSString *)sliderPageController:(id)controller hintTitleForPage:(NSInteger)page
{
	NSString *hintTitle = [[self.demoContent objectAtIndex:page] objectForKey:@"title"];
	return hintTitle;
}

- (void)onPageChanged:(id)sender
{
	pageControlUsed = YES;
	[self slideToCurrentPage:YES];
	
}

- (void)slideToCurrentPage:(bool)animated
{
	int page = sliderPageControl.currentPage;
	
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:animated];
}

- (void)changeToPage:(int)page animated:(BOOL)animated
{
	[sliderPageControl setCurrentPage:page animated:YES];
	[self slideToCurrentPage:animated];
}
@end
