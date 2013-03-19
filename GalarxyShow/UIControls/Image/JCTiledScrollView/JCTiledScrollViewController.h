//
//  JCTiledScrollViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/12/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"
#import "JCTiledDemoDetailView.h"
#import <GalarxyUIKitLib/JCTiledScrollView.h>

@interface JCTiledScrollViewController : ControlBaseViewController<JCTileSource, JCTiledScrollViewDelegate>

@property (strong, nonatomic) JCTiledScrollView *scrollView;
@property (strong, nonatomic) JCTiledDemoDetailView *detailView;

@end
