//
//  TagsCloudLabelViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/20/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "TagsCloudLabelViewController.h"

@interface TagsCloudLabelViewController ()

@end

@implementation TagsCloudLabelViewController
@synthesize tableref = _tableref;

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
    //   MytableView.backgroundColor =
    //  [UIColor colorWithPatternImage:[UIImage imageNamed:@"dotline.png"]];
    [self.tableref setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableref.opaque = NO;
    //////////////////////////////////////
    
    TagLabels = [[NSMutableArray alloc] init];
    timer=[NSTimer scheduledTimerWithTimeInterval:2
                                           target:self
                                         selector:@selector(resetTagLabel)
                                         userInfo:nil
                                          repeats:YES];
    LabelContent = [[NSMutableArray alloc] init];
    for (int i = 0; i<50; i++) {
        NSString* content=[@"" stringByAppendingFormat:@"hello%i",i];
        [LabelContent addObject:content];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc
{
    self.tableref =nil;
}


static int labelContentIndex = 0;
-(void)resetTagLabel
{
    for (int i = 0; i<5; i++)
    {
        if (TagLabels.count==0) {
            return;
        }
        int LabelIndex = rand()%[TagLabels count];
        TouchAbleLabel* tempLabel = [TagLabels objectAtIndex:LabelIndex];
        NSString* labelcontent = [LabelContent objectAtIndex:labelContentIndex++ % [LabelContent count]];
        [tempLabel setText:labelcontent animated:YES];
        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int count = 15;
    
    return count;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return @"梅州";
    }
    
    else
        return @"";
}
static int global_tags_for_touchAbleLabel= 1000;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = nil;
    
    static NSString *kDisplayCell_ID = @"DisplayCellID";
    cell = [tableView dequeueReusableCellWithIdentifier:kDisplayCell_ID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDisplayCell_ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        for (int i = 0; i<=3;i++) {
            float x_offset = rand()%230 -15;
            float y_offset = rand()%220- 10 ;
            
            TouchAbleLabel* tempLabel = [[TouchAbleLabel alloc] initWithFrame:CGRectMake(380*i+x_offset,5+y_offset , 80, 40)];
            tempLabel.backgroundColor = [UIColor clearColor];
            tempLabel.textColor = [UIColor yellowColor];
            tempLabel.text = @"test";
            float alpha_random = (rand()%10) *0.1;
            tempLabel.alpha = alpha_random;
            
            float font_size = (rand()%10)+8;
            tempLabel.font = [UIFont systemFontOfSize:font_size];
            
            tempLabel.tag = global_tags_for_touchAbleLabel++;
            [tempLabel setDelegate:self];
            
            tempLabel.transitionEffect = BBCyclingLabelTransitionEffectScaleFadeOut;
            tempLabel.transitionDuration = 3;
            //[tempLabel setText:@"newText" animated:YES];
            [TagLabels addObject:tempLabel];
            [cell addSubview:tempLabel];
        }
        
        
    }
    
    
    
    return cell;
}


//- (void)myLabel:(TouchAbleLabel *)myLabel touchesWtihTag:(NSInteger)tag;
- (void)touchAbleLabel:(TouchAbleLabel *)myLabel touchesWtihTag:(NSInteger)tag {
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:webSite.text]];
    NSLog(@"press decected");
    NSLog(@"press tags is %i", tag);
}

@end
