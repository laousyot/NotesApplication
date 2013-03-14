//
//  OTLDetailViewController.m
//  NotesApplication
//
//  Created by Othmane Laousy on 3/14/13.
//  Copyright (c) 2013 Othmane Laousy. All rights reserved.
//

#import "OTLDetailViewController.h"

@interface OTLDetailViewController ()
- (void)configureView;
@end

@implementation OTLDetailViewController

#pragma mark - Managing the detail item
-(void)mapViewDidFinishLoadingMap:(MKMapView *)mapView{
    [self addPinToMapAtLocation: _object.coordinate];

}
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    if (self.view){
        self.detailTitle.text=_object.titleString;
        self.detailDescription.text=_object.detail;
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Location
- (void)addPinToMapAtLocation:(CLLocationCoordinate2D)location
{
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    
    pin.coordinate = location;
    [self.mapView addAnnotation:pin];
    [self.mapView setCenterCoordinate:pin.coordinate];
    MKCoordinateSpan span;
    span.latitudeDelta=0.03;
    span.longitudeDelta=0.03;
    MKCoordinateRegion region=[self.mapView regionThatFits:MKCoordinateRegionMakeWithDistance(location, 200,  200)];
    region.center=pin.coordinate;
    region.span= span;
    [self.mapView setRegion:region animated:TRUE];
        
}

@end
