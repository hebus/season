//
//  HBSDetailViewController.h
//  Season companion
//
//  Created by Olivier on 04/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MHFacebookImageViewer.h"

@interface HBSDetailViewController : UIViewController

@property (strong, nonatomic) NSDictionary *detailItem;

@property (strong, nonatomic)   IBOutlet UITextView     *detailDescriptionLabel;
@property (strong,nonatomic)    IBOutlet UIImageView    *cardImageView;
@property (strong,nonatomic)    IBOutlet UILabel        *cardNumberLabel;

- (IBAction)swipeGestureHandler:(UISwipeGestureRecognizer *)sender;
- (IBAction)swipeGestureHandlerUP:(UISwipeGestureRecognizer *)sender;


- (void)envoiDictionnaire:(NSMutableArray*)dico withIndexPath:(NSIndexPath*)indexpath;

@end
