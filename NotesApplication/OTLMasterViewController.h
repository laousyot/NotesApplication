//
//  OTLMasterViewController.h
//  NotesApplication
//
//  Created by Othmane Laousy on 3/14/13.
//  Copyright (c) 2013 Othmane Laousy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface OTLMasterViewController : UITableViewController<CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@end
