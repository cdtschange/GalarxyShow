//
//  GSUIDetailViewController.h
//  GalarxyShow
//
//  Created by Wei Mao on 12/2/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GalarxyUIKitLib/PSTCollectionView.h>

@interface GSUIDetailViewController : UIViewController<PSTCollectionViewDataSource,PSTCollectionViewDelegate>
@property (weak, nonatomic) IBOutlet PSTCollectionView *collectionView;

- (void)reloadData:(NSString *)key;

@end
