//
//  PhotoStackViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/15/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "PhotoStackViewController.h"

@interface PhotoStackViewController ()
@property (nonatomic, strong) NSArray *photos;
-(void)setup;
@end

@implementation PhotoStackViewController

@synthesize photoStack = _photoStack,
pageControl = _pageControl;

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
    [self setup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    
    [self setPageControl:nil];
}

#pragma mark -
#pragma mark Setup

-(void)setup {
    [self.view addSubview:self.photoStack];
    self.pageControl.numberOfPages = [self.photos count];
}



#pragma mark -
#pragma mark Getters

-(NSArray *)photos {
    if(!_photos) {
        
        _photos = [NSArray arrayWithObjects:
                   [UIImage imageNamed:@"photostack_1.jpg"],
                   [UIImage imageNamed:@"photostack_2.jpg"],
                   [UIImage imageNamed:@"photostack_3.jpg"],
                   [UIImage imageNamed:@"photostack_4.jpg"],
                   [UIImage imageNamed:@"photostack_5.jpg"],
                   [UIImage imageNamed:@"photostack_6.jpg"],
                   nil];
        
    }
    return _photos;
}

-(PhotoStackView *)photoStack {
    if(!_photoStack) {
        _photoStack = [[PhotoStackView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
        _photoStack.center = CGPointMake(self.view.center.x, 270);
        _photoStack.dataSource = self;
        _photoStack.delegate = self;
    }
    
    return _photoStack;
}



#pragma mark -
#pragma mark Deck DataSource Protocol Methods

-(NSUInteger)numberOfPhotosInPhotoStackView:(PhotoStackView *)photoStack {
    return [self.photos count];
}

-(UIImage *)photoStackView:(PhotoStackView *)photoStack photoForIndex:(NSUInteger)index {
    return [self.photos objectAtIndex:index];
}



#pragma mark -
#pragma mark Deck Delegate Protocol Methods

-(void)photoStackView:(PhotoStackView *)photoStackView willStartMovingPhotoAtIndex:(NSUInteger)index {
    // User started moving a photo
}

-(void)photoStackView:(PhotoStackView *)photoStackView willFlickAwayPhotoAtIndex:(NSUInteger)index {
    // User flicked the photo away, revealing the next one in the stack
}

-(void)photoStackView:(PhotoStackView *)photoStackView didRevealPhotoAtIndex:(NSUInteger)index {
    self.pageControl.currentPage = index;
}

-(void)photoStackView:(PhotoStackView *)photoStackView didSelectPhotoAtIndex:(NSUInteger)index {
    NSLog(@"selected %d", index);
}




#pragma mark -
#pragma mark Actions

- (IBAction)tappedInsertAnotherPhoto:(id)sender {
    NSMutableArray *photosMutable = [self.photos mutableCopy];
    [photosMutable addObject:[UIImage imageNamed:[NSString stringWithFormat:@"photostack_%d.jpg",photosMutable.count%6+1]]];
    self.photos = photosMutable;
    [self.photoStack reloadData];
    self.pageControl.numberOfPages = [self.photos count];
}

@end
