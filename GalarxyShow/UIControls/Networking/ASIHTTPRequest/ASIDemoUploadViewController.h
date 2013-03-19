//
//  UploadViewController.h
//  Part of the ASIHTTPRequest sample project - see http://allseeing-i.com/ASIHTTPRequest for details
//
//  Created by Ben Copsey on 31/12/2008.
//  Copyright 2008 All-Seeing Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIDemoSampleViewController.h"
@class ASIFormDataRequest;

@interface ASIDemoUploadViewController : ASIDemoSampleViewController {
	
	ASIFormDataRequest *request;
	
	IBOutlet UIProgressView *progressIndicator;
	UITextView *resultView;
}

- (IBAction)performLargeUpload:(id)sender;
- (IBAction)toggleThrottling:(id)sender;

@property (retain, nonatomic) ASIFormDataRequest *request;
@end
