//
//  UIManager.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/8/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "UIManager.h"

@implementation UIManager

+(UIBarButtonItem *)createCloseBarButtonItem:(id)sender{
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleBordered  target:sender action:@selector(goBack:)];
    return barItem;
}
@end
