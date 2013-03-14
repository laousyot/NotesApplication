//
//  OTLAddNoteViewController.h
//  NotesApplication
//
//  Created by Othmane Laousy on 3/14/13.
//  Copyright (c) 2013 Othmane Laousy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OTLAddNoteViewController : UIViewController

@property (weak,nonatomic) IBOutlet UITextField *titleField;

@property (weak, nonatomic) IBOutlet UITextView *contentField;

- (IBAction)cancelModalViewController:(id)sender;
- (IBAction)doneWithModalViewController:(id)sender;
- (IBAction)foo:(UIStoryboardSegue *)segue;

@end


