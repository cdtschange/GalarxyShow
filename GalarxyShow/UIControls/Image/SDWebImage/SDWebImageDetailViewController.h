//
//  SDWebImageDetailViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/12/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDWebImageDetailViewController : UIViewController

@property (strong, nonatomic) NSURL *imageURL;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
