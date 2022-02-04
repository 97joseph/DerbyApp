#import "LeagueTableViewController.h"
#import "DetailViewController.h"

@implementation LeagueTableViewController
@synthesize listData;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableArray *array = [[NSMutableArray alloc] init];     

    // go out to the service and get the data
    NSError *error = nil;
    NSURL *derbyService = [NSURL URLWithString: 
                           @"http://derbynames.gravityworksdesign.com/DerbyNamesService.svc/Leagues"];
 	NSData *data = [NSData dataWithContentsOfURL:derbyService];
 	
    // Use native fucntions to parse the JSON 
    NSDictionary *derbyNames = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:NSJSONReadingMutableLeaves
                                error:&error];
    
    // loop through all of the derby item objects returned, and only add the name object to the our array
    NSArray* derbyNameDetail = [derbyNames objectForKey:@"d"]; 
    
    for (NSDictionary* derbyItem in derbyNameDetail) {
        NSString *name = [derbyItem objectForKey:@"LeagueName"];
        
        NSLog(@"Names: %@", name); 
        [array addObject:name];
    }
    
    self.listData = array;
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
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


#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
       
    [self performSegueWithIdentifier:@"Details" sender:cell];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"Details"])
	{
        DetailViewController *detailView = segue.destinationViewController;
        UITableViewCell *dataCell = (UITableViewCell *)sender;
        [detailView setData:dataCell.textLabel.text];
    }
    
}

@end
