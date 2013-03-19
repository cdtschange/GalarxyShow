//
//  FontTTFLabelViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/20/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "FontTTFLabelViewController.h"
#import <GalarxyUIKitLib/FontManager.h>
#import <GalarxyUIKitLib/FontLabel.h>
#import <GalarxyUIKitLib/FontLabelStringDrawing.h>

@interface FontTTFLabelViewController ()

@end

@implementation FontTTFLabelViewController

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
    
	[[FontManager sharedManager] loadFont:@"A Damn Mess"];
	[[FontManager sharedManager] loadFont:@"Abberancy"];
	[[FontManager sharedManager] loadFont:@"Abduction"];
	[[FontManager sharedManager] loadFont:@"Paint Boy"];
	[[FontManager sharedManager] loadFont:@"Schwarzwald Regular"];
	[[FontManager sharedManager] loadFont:@"Scissor Cuts"];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
	
	FontLabel *label = [[FontLabel alloc] initWithFrame:CGRectMake(10, 10, 0, 0) fontName:@"Paint Boy" pointSize:40.0f];
	label.textColor = [UIColor magentaColor];
	label.text = @"lorem ipsum";
	[label sizeToFit];
	label.backgroundColor = nil;
	label.opaque = NO;
	[self.view addSubview:label];
	
	FontLabel *label2 = [[FontLabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(label.frame) + 10, 300, 100)
                                                fontName:@"Schwarzwald Regular" pointSize:20.0f];
	label2.textColor = [UIColor blackColor];
	label2.text = @"centered in a frame.\nthis is line two. Long lines should wrap, possibly multiple times. Really long lines should truncate with an ellipsis.";
	label2.textAlignment = UITextAlignmentCenter;
	label2.lineBreakMode = UILineBreakModeTailTruncation;
	label2.backgroundColor = [UIColor greenColor];
	label2.numberOfLines = 0;
	[self.view addSubview:label2];
	
	FontLabel *label3 = [[FontLabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(label2.frame) + 10, 300, 100)
                                                fontName:@"Schwarzwald Regular" pointSize:20.0f];
	label3.textColor = [UIColor magentaColor];
	label3.text = @"right justified.\nThis is line two. Long lines should wrap";
	label3.textAlignment = UITextAlignmentRight;
	label3.backgroundColor = [UIColor blueColor];
	label3.numberOfLines = 0;
	[self.view addSubview:label3];
	
	FontLabel *label4 = [[FontLabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(label3.frame) + 10, 300, 100)];
	ZMutableAttributedString *str = [[ZMutableAttributedString alloc] initWithString:@"This is an attributed string.\nIt even supports underline."
																		  attributes:[NSDictionary dictionaryWithObjectsAndKeys:
																					  [[FontManager sharedManager] zFontWithName:@"Schwarzwald Regular" pointSize:20],
																					  ZFontAttributeName,
																					  nil]];
	[str addAttribute:ZFontAttributeName value:[[FontManager sharedManager] zFontWithName:@"Abberancy" pointSize:30] range:NSMakeRange(11, 10)];
	[str addAttribute:ZForegroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(11, 10)];
	[str addAttribute:ZBackgroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(11, 10)];
	[str addAttribute:ZStrikethroughStyleAttributeName value:[NSNumber numberWithInt:ZUnderlineStyleSingle] range:NSMakeRange(11, 10)];
	[str addAttribute:ZUnderlineStyleAttributeName value:[NSNumber numberWithInt:ZUnderlineStyleSingle] range:NSMakeRange(47, 9)];
	label4.zAttributedText = str;
	label4.textAlignment = UITextAlignmentLeft;
	label4.backgroundColor = [UIColor lightGrayColor];
	label4.numberOfLines = 0;
	[self.view addSubview:label4];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
