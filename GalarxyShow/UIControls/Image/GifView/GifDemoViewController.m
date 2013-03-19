//
//  GifDemoViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/14/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "GifDemoViewController.h"
#import <GalarxyUIKitLib/GifView.h>

@interface GifDemoViewController ()

@end

@implementation GifDemoViewController

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
    
    //1. 第三方
    // 网络图片
    //  NSData *urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.chinagif.com/gif/part/boy/0045.gif"]];
    
    // 本地图片
    NSData *localData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gifview_run" ofType:@"gif"]];
    
    GifView *dataView = [[GifView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) data:localData];
    [self.view addSubview:dataView];
    
    // 或者
    
    GifView *pathView =[[GifView alloc] initWithFrame:CGRectMake(100, 0, 100, 100) filePath:[[NSBundle mainBundle] pathForResource:@"gifview_run" ofType:@"gif"]];
    [self.view addSubview:pathView];
    
    //2. webView
    
//    webbiew的会好一些，第一种和第三种都是通过定时器来控制图片模拟动画的，它们控制的桢速是固定的。如果设置的模拟桢速跟gif本身的桢速相近的话倒没什么，如果桢速相差过大就不行了。webview加载的gif会保持原有的桢速。这个webview可以设置透明： [webView setBackgroundColor:[UIColor clearColor]]; [webView setOpaque:NO];这样就不会出现白的底色，当然，前提是gif的每个桢图也是背景透明的
    NSString *path = [[NSBundle mainBundle] pathForResource:@"gifview_run" ofType:@"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:path];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 120, 100, 100)];
    webView.backgroundColor = [UIColor redColor];
    webView.scalesPageToFit = YES;
    [webView loadData:gifData MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [webView setBackgroundColor:[UIColor clearColor]];
    [webView setOpaque:NO];
    [self.view addSubview:webView];
    
    //3. animationView
    
    UIImageView *gifImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 240, 100, 100)];
    NSArray *gifArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"gifview_1"],
                         [UIImage imageNamed:@"gifview_2"],
                         [UIImage imageNamed:@"gifview_3"],
                         [UIImage imageNamed:@"gifview_4"],
                         [UIImage imageNamed:@"gifview_5"],
                         [UIImage imageNamed:@"gifview_6"],
                         [UIImage imageNamed:@"gifview_7"],
                         [UIImage imageNamed:@"gifview_8"],
                         [UIImage imageNamed:@"gifview_9"],
                         [UIImage imageNamed:@"gifview_10"],
                         [UIImage imageNamed:@"gifview_11"],
                         [UIImage imageNamed:@"gifview_12"],
                         [UIImage imageNamed:@"gifview_13"],
                         [UIImage imageNamed:@"gifview_14"],
                         [UIImage imageNamed:@"gifview_15"],
                         [UIImage imageNamed:@"gifview_16"],
                         [UIImage imageNamed:@"gifview_17"],
                         [UIImage imageNamed:@"gifview_18"],
                         [UIImage imageNamed:@"gifview_19"],
                         [UIImage imageNamed:@"gifview_20"],
                         [UIImage imageNamed:@"gifview_21"],
                         [UIImage imageNamed:@"gifview_22"],nil];
    gifImageView.animationImages = gifArray; //动画图片数组
    gifImageView.animationDuration = 5; //执行一次完整动画所需的时长
    gifImageView.animationRepeatCount = 999;  //动画重复次数
    [gifImageView startAnimating];
    [self.view addSubview:gifImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
