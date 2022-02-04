#import "ViewController.h"


@implementation ViewController

- (void)getValuesFromPlist
{
    // build the path to your plist
    NSString *path = [[NSBundle mainBundle] pathForResource: @"example" ofType:@"plist"];
    
    // load the plist into a dictionary
    NSDictionary *pListData = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    // loop through each the of Items in the proprery list and log
    for (NSString *item in pListData)
        NSLog(@"Value=%@", item);
    
           
}

- (void)outputSinglePlistValue: (NSString*) itemName
{
    // build the path to your plist
    NSString *path = [[NSBundle mainBundle] pathForResource: @"example" ofType:@"plist"];
    
    // load the plist into a dictionary
    NSDictionary *pListData = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    NSString *value = [pListData objectForKey:itemName]; 
    
    NSLog(@"Name=%@-Value=%@", itemName,value);
}

- (void)writeToPlist
{
    NSString *path = [[NSBundle mainBundle] pathForResource: @"example" ofType:@"plist"];
    NSMutableDictionary* pListData = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
	 
    [pListData setValue:@"Modified Value" forKey:@"Test1"];
    [pListData writeToFile:path atomically: YES]; 
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
    fromLocation:(CLLocation *)oldLocation
{
    // turn the raw lat info into degrees, mintues, seconds
    int latDegrees = newLocation.coordinate.latitude;
    double latDecimal = fabs(newLocation.coordinate.latitude - latDegrees);
    int latMinutes = latDecimal * 60;
    double latSeconds = latDecimal * 3600 - latMinutes * 60;
    
    NSString *latitude = [NSString stringWithFormat:@"%d° %d' %1.4f\"",  latDegrees, latMinutes, latSeconds];
    NSLog(latitude);
    
    // turn the raw long into degrees, mintues, seconds
    int longDegrees = newLocation.coordinate.longitude;
    double longdecimal = fabs(newLocation.coordinate.longitude - longDegrees);
    int longMinutes = longdecimal * 60;
    double longSeconds = longdecimal * 3600 - longMinutes * 60;
    NSString *longitude = [NSString stringWithFormat:@"%d° %d' %1.4f\"",  longDegrees, longMinutes, longSeconds];
    
    NSLog(longitude);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self getValuesFromPlist];
    [self outputSinglePlistValue:@"Test1"];
    [self writeToPlist];
    [self outputSinglePlistValue:@"Test1"];
    
    // GPS Example
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone; // get GPS Data when ever you move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; 
    [locationManager startUpdatingLocation];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
