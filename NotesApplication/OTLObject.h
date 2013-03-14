//
//  OTLObject.h
//  NotesApplication
//
//  Created by Othmane Laousy on 3/14/13.
//  Copyright (c) 2013 Othmane Laousy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface OTLObject : NSObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) NSString *detail;
@property CLLocationCoordinate2D coordinate;

@end
