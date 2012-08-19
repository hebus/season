//
//  HBSMasterViewController.h
//  Season companion
//
//  Created by Olivier on 04/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBSMasterViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property IBOutlet UISearchBar *seasonSearchBar;
@property (strong,nonatomic) NSMutableArray *filteredArray;

-(void)lireDonnees;

@end
