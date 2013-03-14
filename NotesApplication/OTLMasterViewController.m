//
//  OTLMasterViewController.m
//  NotesApplication
//
//  Created by Othmane Laousy on 3/14/13.
//  Copyright (c) 2013 Othmane Laousy. All rights reserved.
//

#import "OTLMasterViewController.h"
#import "OTLAddNoteViewController.h"
#import "OTLDetailViewController.h"
#import "OTLObject.h"
@interface OTLMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation OTLMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [self performSegueWithIdentifier:@"AddNote" sender:self];
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    OTLObject *object = _objects[indexPath.row];
    cell.textLabel.text = object.titleString;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

-(IBAction)foo:(UIStoryboardSegue *)segue
{
    //OTLMasterViewController *mainView = segue.destinationViewController;
    OTLAddNoteViewController *sourceView= segue.sourceViewController;
    OTLObject *object = [[OTLObject alloc] init];
    object.titleString = sourceView.titleField.text;
    object.detail=sourceView.contentField.text;
    object.date = [NSDate date];
    
    //Location setup
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy= kCLLocationAccuracyHundredMeters;
    self.locationManager.distanceFilter= 1000.0f;
    [self.locationManager startUpdatingLocation];
    object.coordinate= _locationManager.location.coordinate;
    [self.locationManager stopUpdatingLocation];
    if(![CLLocationManager locationServicesEnabled]){
        NSString *msg = @"Application cannot obtain location. Please go to Settings> Privacy> Location and enable location for this application";
        UIAlertView *alert;
        alert = [[UIAlertView alloc]
                 initWithTitle:@"Error"
                 message:msg
                 delegate:self
                 cancelButtonTitle:@"OK"
                 otherButtonTitles:nil];
        [alert show];
    }
    
    [_objects addObject: object];
    [self.tableView reloadData];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        OTLObject *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object.date];
        OTLDetailViewController *detailView=segue.destinationViewController;
        detailView.object=object;
      
    }
    
}

@end
