//
//  HBSDetailViewController.h
//  Season companion
//
//  Created by Olivier on 04/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBSDetailViewController : UIViewController

@property (strong, nonatomic) NSDictionary *detailItem;

@property (strong, nonatomic) IBOutlet UITextView *detailDescriptionLabel;

@end
