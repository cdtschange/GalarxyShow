//
//  VPPMapClusterViewController.m
//  GalarxyShow
//
//  Created by Wei Mao on 12/22/12.
//  Copyright (c) 2012 isoftstone. All rights reserved.
//

#import "VPPMapClusterViewController.h"
#import "VPPMapAnnotation.h"

@interface VPPMapClusterViewController (){
    
    VPPMapHelper *_mh;
}

@end

@implementation VPPMapClusterViewController
@synthesize mapView;

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
    
	// gets some points
	NSMutableArray * arr = [NSMutableArray array];
	VPPMapAnnotation *ann = [[VPPMapAnnotation alloc] init];
	ann.coordinate = CLLocationCoordinate2DMake(43.3758888244629,-8.39844131469727);
	ann.title = @"Campo de Marte";
	ann.pinAnnotationColor = MKPinAnnotationColorPurple;
	ann.opensWhenShown = YES;
	[arr addObject:ann];
	ann = [[VPPMapAnnotation alloc] init];
	ann.coordinate = CLLocationCoordinate2DMake(43.3576393127441,-8.4019660949707);
	ann.title = @"Tabacos";
    ann.image = [UIImage imageNamed:@"vppmap_bikePin"];
	[arr addObject:ann];
	ann = [[VPPMapAnnotation alloc] init];
	ann.coordinate = CLLocationCoordinate2DMake(43.3529319763184,-8.4093017578125);
	ann.title = @"Estación de Tren";
	[arr addObject:ann];
	
	// sets up the map
	_mh = [VPPMapHelper VPPMapHelperForMapView:self.mapView
                             pinAnnotationColor:MKPinAnnotationColorGreen
                          centersOnUserLocation:NO
                          showsDisclosureButton:YES
                                       delegate:self];
    self.mapView.showsUserLocation = YES;
	_mh.userCanDropPin = YES;
	_mh.allowMultipleUserPins = YES;
	_mh.pinDroppedByUserClass = [VPPMapAnnotation class];
	[_mh setMapAnnotations:arr];
	
    
    
    [arr removeAllObjects];
    arr = [NSMutableArray array];
    [arr addObject:[[UIBarButtonItem alloc] initWithTitle:@"Tons of pins" style:UIBarButtonItemStyleBordered target:self action:@selector(tonsOfPins)]];
    [arr addObject:[[UIBarButtonItem alloc] initWithTitle:@"Toggle Center on me" style:UIBarButtonItemStyleBordered target:self action:@selector(toggleCenterOnMe)]];
    self.navigationItem.rightBarButtonItems = arr;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(float)RandomFloatStart:(float)a end:(float)b {
    float random = ((float) rand()) / (float) RAND_MAX;
    float diff = b - a;
    float r = random * diff;
    return a + r;
}

- (void) tonsOfPins {
    srand((unsigned)time(0));
    
    NSMutableArray *tempPlaces=[[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 100; i++) {
        
        VPPMapAnnotation *place= [[VPPMapAnnotation alloc] init];
        place.coordinate = CLLocationCoordinate2DMake([self RandomFloatStart:41.0 end:44.0],[self RandomFloatStart:-9.0 end:-5.0]);
        [place setTitle:[NSString stringWithFormat:@"Place %d title",i]];
        [tempPlaces addObject:place];
        
    }
    
    _mh.shouldClusterPins = YES;
    [_mh setMapAnnotations:tempPlaces];
}

- (void) toggleCenterOnMe {
    _mh.centersOnUserLocation = !_mh.centersOnUserLocation;
}

#pragma mark -
#pragma mark VPPMapHelperDelegate

- (void) open:(id<MKAnnotation>)annotation {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Annotation pressed" message:[NSString stringWithFormat:@"It says: %@",annotation.title] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [av show];
}

- (BOOL) annotationDroppedByUserShouldOpen:(id<MKAnnotation>)annotation {
	VPPMapAnnotation *ann = (VPPMapAnnotation*)annotation;
	
	ann.title = @"Hi there!";
	ann.pinAnnotationColor = MKPinAnnotationColorGreen;
	
	return YES;
}
@end
