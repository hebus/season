//
//  HBSDetailViewController.m
//  Season companion
//
//  Created by Olivier on 04/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HBSDetailViewController.h"

@interface HBSDetailViewController ()
- (void)configureView;
@end

@implementation HBSDetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize cardImageView = _cardImageView;

#pragma mark - Managing the detail item

- (void)setDetailItem:(NSDictionary*)newDetailItem
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
        self.title = [self.detailItem objectForKey:@"name"];
        self.detailDescriptionLabel.text = [self.detailItem objectForKey:@"effet"];
        NSString *path = [[_detailItem objectForKey:@"id"] stringByAppendingString:@".png"];
        self.cardImageView.image = [UIImage imageNamed:path];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.detailDescriptionLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
