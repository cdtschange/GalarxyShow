//
//  ThumbnailPickerViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/11/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "ThumbnailPickerViewController.h"

@interface ThumbnailPickerViewController ()
{
    NSUInteger _numberOfItems;
}

@end

@implementation ThumbnailPickerViewController

@synthesize images = _images;
@synthesize imageView = _imageView, infoLabel = _infoLabel;
@synthesize numberOfItemsSlider = _numberOfItemsSlider, selectedIndexSlider = _selectedIndexSlider,
numberOfItemsLabel = _numberOfItemsLabel, selectedIndexLabel = _selectedIndexLabel,
reloadTimeLabel = _reloadTimeLabel;
@synthesize toolbar = _toolbar, thumbnailPickerView = _thumbnailPickerView;

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
    
    self.thumbnailPickerView.delegate = self;
    
    NSArray *paths = [[NSBundle mainBundle] pathsForResourcesOfType:@"jpg" inDirectory:nil];
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:paths.count];
    for (int i =1;i<=28;i++) {
        NSString *str = [NSString stringWithFormat:@"thumbnail_image%03d.jpg",i];
        [images addObject:[UIImage imageNamed:str]];
    }
    self.images = images;
    
    _numberOfItems = self.images.count;
    
    self.numberOfItemsSlider.minimumValue = 0;
    self.numberOfItemsSlider.maximumValue = _numberOfItems;
    self.numberOfItemsSlider.value = _numberOfItems;
    self.numberOfItemsLabel.text = [NSString stringWithFormat:@"%d", _numberOfItems];
    
    self.selectedIndexSlider.minimumValue = 0;
    self.selectedIndexSlider.maximumValue = _numberOfItems-1;
    self.selectedIndexLabel.text = [NSString string];
    
    self.reloadTimeLabel.text = [NSString string];
    self.infoLabel.text = [NSString string];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private API

- (void)_reloadThumbnailPickerView
{
    NSDate *date1 = [NSDate date];
    [self.thumbnailPickerView reloadData];
    NSDate *date2 = [NSDate date];
    self.reloadTimeLabel.text = [NSString stringWithFormat:@"reloaded in %.4fs", [date2 timeIntervalSinceDate:date1]];
}

- (void)_sliderValueChanged:(UISlider *)sender
{
    NSInteger value = [sender value];
    if (sender == self.selectedIndexSlider) {
        [self.thumbnailPickerView setSelectedIndex:value animated:YES];
        [self _updateUIWithSelectedIndex:value];
    } else if (sender == self.numberOfItemsSlider) {
        if (_numberOfItems != value) {
            _numberOfItems = value;
            self.selectedIndexSlider.maximumValue = _numberOfItems == 0 ? 0 : _numberOfItems-1;
            self.numberOfItemsLabel.text = [NSString stringWithFormat:@"%d", _numberOfItems];
            [self _reloadThumbnailPickerView];
            self.infoLabel.text = [NSString stringWithFormat:@"%d of %d", (int)self.selectedIndexSlider.value+1, _numberOfItems];
            
            if (_numberOfItems <= self.thumbnailPickerView.selectedIndex) {
                [self.thumbnailPickerView setSelectedIndex:self.selectedIndexSlider.maximumValue animated:YES];
                [self _updateUIWithSelectedIndex:self.selectedIndexSlider.maximumValue];
            }
        }
    }
}

- (void)_updateUIWithSelectedIndex:(NSUInteger)index
{
    self.imageView.image = [self.images objectAtIndex:index];
    self.infoLabel.text = [NSString stringWithFormat:@"%d of %d", index+1, _numberOfItems];
    self.selectedIndexSlider.value = index;
    self.selectedIndexLabel.text = [NSString stringWithFormat:@"%d", index];
}

#pragma mark - ThumbnailPickerView data source

- (NSUInteger)numberOfImagesForThumbnailPickerView:(ThumbnailPickerView *)thumbnailPickerView
{
    return _numberOfItems;
}

- (UIImage *)thumbnailPickerView:(ThumbnailPickerView *)thumbnailPickerView imageAtIndex:(NSUInteger)index
{
    UIImage *image = [self.images objectAtIndex:index];
    usleep(10*1000);
    return image;
}

#pragma mark - ThumbnailPickerView delegate

- (void)thumbnailPickerView:(ThumbnailPickerView *)thumbnailPickerView didSelectImageWithIndex:(NSUInteger)index
{
    [self _updateUIWithSelectedIndex:index];
}
@end
