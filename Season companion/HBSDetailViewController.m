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

@implementation HBSDetailViewController{
    NSMutableArray *_dico;
    NSInteger row;
}

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize cardImageView = _cardImageView;
@synthesize cardNumberLabel = _cardNumberLabel;


#pragma mark - Managing the detail item

- (void)setDetailItem:(NSDictionary*)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

#pragma mark - swipe gestures recognizer
- (IBAction)swipeGestureHandler:(UISwipeGestureRecognizer *)sender {
    if(sender.state == UIGestureRecognizerStateEnded){
        NSLog(@"Swipe Down Gesture Ended");
        if(row +1 > (_dico.count-1))
            row = 0;
        else {
            row++;
        }
        _detailItem = [_dico objectAtIndex:row];
        [self configureView];
    }
    else if(sender.state == UIGestureRecognizerStateBegan){
        NSLog(@"Swipe Down Gesture Began");
    }
}
- (IBAction)swipeGestureHandlerUP:(UISwipeGestureRecognizer *)sender {
    if(sender.state == UIGestureRecognizerStateEnded){
        NSLog(@"Swipe UP Gesture Ended");
        if(row-1<0)
            row = _dico.count-1;
        else {
            row--;
        }
        _detailItem = [_dico objectAtIndex:row];
        [self configureView];
    }
    else if(sender.state == UIGestureRecognizerStateBegan){
        NSLog(@"Swipe UP Gesture Began");
    }
}

-(void)envoiDictionnaire:(NSMutableArray *)dico withIndexPath:(NSIndexPath *)indexpath{
    row = indexpath.row;
    _dico = dico;
    _detailItem = [_dico objectAtIndex:row];
    [self configureView];
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.title = [self.detailItem objectForKey:@"name"];
        self.detailDescriptionLabel.text = [self.detailItem objectForKey:@"effet"];
        self.cardNumberLabel.text = [[self.detailItem objectForKey:@"id"] stringByAppendingString:@" / 50"];
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
