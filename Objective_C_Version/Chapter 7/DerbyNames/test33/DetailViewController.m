
#import "DetailViewController.h"

@implementation DetailViewController
@synthesize listData;
@synthesize data;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // build our URL to get the data from
    NSString* url = @"http://derbynames.gravityworksdesign.com/DerbyNamesService.svc/DerbyNames?$filter=League%20eq%20'";
    NSString* escapedUrlString = [data stringByAddingPercentEscapesUsingEncoding: NSASCIIStringEncoding];
    NSString *urlToGetData = [NSString stringWithFormat:@"%@%@'",url,escapedUrlString];
    
    // get the data
    NSMutableArray *array = [[NSMutableArray alloc] init]; 
    NSError *error = nil;
    NSURL *derbyService = [NSURL URLWithString: urlToGetData];
 	NSData *rosterData = [NSData dataWithContentsOfURL:derbyService];
 	NSDictionary *derbyNames = [NSJSONSerialization
                                JSONObjectWithData:rosterData
                                options:NSJSONReadingMutableLeaves
                                error:&error];
    
    
    // process the data
    NSArray* derbyNameDetail = [derbyNames objectForKey:@"d"]; 
    
    for (NSDictionary* derbyItem in derbyNameDetail) {
        NSString *name = [derbyItem objectForKey:@"Name"];
        NSString *leauge = [derbyItem objectForKey:@"League"];
        NSString *number = [derbyItem objectForKey:@"Number"];
        
        NSLog(@"Names: %@-%@-%@", name, leauge, number); 
        [array addObject:name];
    }
    
    // return the data
    self.listData = array;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [listData objectAtIndex:row];
    
    return cell;
}
@end
