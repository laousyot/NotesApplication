//
//  OTLDetailViewController.h
//  NotesApplication
//
//  Created by Othmane Laousy on 3/14/13.
//  Copyright (c) 2013 Othmane Laousy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OTLDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
