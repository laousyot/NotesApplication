//
//  OTLAddNoteViewController.m
//  NotesApplication
//
//  Created by Othmane Laousy on 3/14/13.
//  Copyright (c) 2013 Othmane Laousy. All rights reserved.
//

#import "OTLAddNoteViewController.h"
#import "OTLObject.h"
@interface OTLAddNoteViewController ()

@end

@implementation OTLAddNoteViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelModalViewController:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneWithModalViewController:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
