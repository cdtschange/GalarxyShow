//
//  RadioButtonViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/8/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "RadioButtonViewController.h"

@interface RadioButtonViewController ()
@property (nonatomic,strong) NSMutableDictionary *dic;

@end

@implementation RadioButtonViewController
@synthesize dic=_dic;


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
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(10, 60, 300, 400)];
    container.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:container];
    
    UILabel *questionText = [[UILabel alloc] initWithFrame:CGRectMake(0,0,280,20)];
    questionText.backgroundColor = [UIColor clearColor];
    questionText.text = @"1. Which color do you like?";
    [container addSubview:questionText];
    
    RadioButton *rb1 = [[RadioButton alloc] initWithGroupId:@"first group" index:0];
    RadioButton *rb2 = [[RadioButton alloc] initWithGroupId:@"first group" index:1];
    RadioButton *rb3 = [[RadioButton alloc] initWithGroupId:@"first group" index:2];
    
    rb1.frame = CGRectMake(10,30,22,22);
    rb2.frame = CGRectMake(10,60,22,22);
    rb3.frame = CGRectMake(10,90,22,22);
    
    [container addSubview:rb1];
    [container addSubview:rb2];
    [container addSubview:rb3];
    
    UILabel *label1 =[[UILabel alloc] initWithFrame:CGRectMake(40, 30, 60, 20)];
    label1.backgroundColor = [UIColor clearColor];
    label1.text = @"Red";
    [container addSubview:label1];
    
    UILabel *label2 =[[UILabel alloc] initWithFrame:CGRectMake(40, 60, 60, 20)];
    label2.backgroundColor = [UIColor clearColor];
    label2.text = @"Green";
    [container addSubview:label2];
    
    UILabel *label3 =[[UILabel alloc] initWithFrame:CGRectMake(40, 90, 60, 20)];
    label3.backgroundColor = [UIColor clearColor];
    label3.text = @"Blue";
    [container addSubview:label3];
    
    // idebug 增加
    
    UILabel *questionText2 = [[UILabel alloc] initWithFrame:CGRectMake(0,130,300,20)];
    questionText2.backgroundColor = [UIColor clearColor];
    [questionText2 setAdjustsFontSizeToFitWidth:YES];
    questionText2.text = @"2. Diaoyu islands belong to which country?";
    [container addSubview:questionText2];
    
    RadioButton *rb11 = [[RadioButton alloc] initWithGroupId:@"second group" index:0];
    RadioButton *rb12 = [[RadioButton alloc] initWithGroupId:@"second group" index:1];
    RadioButton *rb13 = [[RadioButton alloc] initWithGroupId:@"second group" index:2];
    
    rb11.frame = CGRectMake(10,160,22,22);
    rb12.frame = CGRectMake(10,190,22,22);
    rb13.frame = CGRectMake(10,220,22,22);
    
    // 设置一个默认选项
    [rb11 setChecked:YES];
    
    
    [container addSubview:rb11];
    [container addSubview:rb12];
    [container addSubview:rb13];
    
    UILabel *label11 =[[UILabel alloc] initWithFrame:CGRectMake(40, 160, 60, 20)];
    label11.backgroundColor = [UIColor clearColor];
    label11.text = @"China";
    [container addSubview:label11];
    
    UILabel *label22 =[[UILabel alloc] initWithFrame:CGRectMake(40, 190, 60, 20)];
    label22.backgroundColor = [UIColor clearColor];
    label22.text = @"China";
    [container addSubview:label22];
    
    UILabel *label33 =[[UILabel alloc] initWithFrame:CGRectMake(40, 220, 60, 20)];
    label33.backgroundColor = [UIColor clearColor];
    label33.text = @"China";
    [container addSubview:label33];
    
    [RadioButton addObserverForGroupId:@"first group" observer:self];
    [RadioButton addObserverForGroupId:@"second group" observer:self];
    
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    submitBtn.frame = CGRectMake(40, 320, 300-60, 40);
    [submitBtn setTitle:@"提交答案" forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(submitClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitBtn];
    
    _dic = [[NSMutableDictionary alloc] initWithCapacity:16];
    

}

-(void)dealloc{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goBack:(id)sender {
    [RadioButton removeObserverForGroupId:@"first group"];
    [RadioButton removeObserverForGroupId:@"second group"];
    [self dismissModalViewControllerAnimated:YES];
}

-(void)submitClick:(id)sender
{
    NSLog(@"dic=%@",self.dic);
    
    UILabel *resultLbl =[[UILabel alloc] initWithFrame:CGRectMake(40, 380, 240, 30)];
    resultLbl.backgroundColor = [UIColor whiteColor];
    resultLbl.textColor = [UIColor redColor];
    NSMutableString *resultStr = [[NSMutableString alloc] initWithCapacity:16];
    
    for (NSString *str in [self.dic allValues]) {
        [resultStr appendFormat:@" %@,",str];
    }
    resultLbl.text = resultStr;
    [self.view addSubview:resultLbl];
}

-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupId{
    NSLog(@"changed to %d in %@",index,groupId);
    
    [_dic setObject:[NSString stringWithFormat:@"%d",index+1] forKey:groupId];
}

@end
