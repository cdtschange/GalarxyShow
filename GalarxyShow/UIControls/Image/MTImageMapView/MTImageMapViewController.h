//
//  ViewController.h
//  ImageMap
//
//  Created by Almighty Kim on 9/27/12.
//  Copyright (c) 2012 Colorful Glue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlBaseViewController.h"
#import <GalarxyUIKitLib/MTImageMapView.h>

@interface MTImageMapViewController : ControlBaseViewController<MTImageMapDelegate>
@property (nonatomic, strong) IBOutlet UIScrollView         *viewScrollStub;
@property (nonatomic, strong) IBOutlet MTImageMapView       *viewImageMap;
@property (nonatomic, strong)          NSArray              *stateNames;
@end
