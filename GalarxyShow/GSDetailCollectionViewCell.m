//
//  GSDetailCollectionViewCell.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/2/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "GSDetailCollectionViewCell.h"

@implementation GSDetailCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView *imv1= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 128, 128)];
        imv1.image=[UIImage imageNamed:IMG_ICON_PACKAGE];
        [self.contentView addSubview:imv1];
        UIView *flowView = [[UIView alloc] initWithFrame:CGRectMake(14, 70, 100, 40)];
        flowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        [self.contentView addSubview:flowView];
        UILabel *lbl1=[[UILabel alloc] initWithFrame:CGRectMake(14, 70, 100, 40)];
        lbl1.font = [UIFont systemFontOfSize:16];
        lbl1.textAlignment = NSTextAlignmentCenter;
        lbl1.tag=1;
        lbl1.numberOfLines=2;
        lbl1.backgroundColor = [UIColor clearColor];
        lbl1.textColor = [UIColor whiteColor];
        [self.contentView addSubview:lbl1];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
