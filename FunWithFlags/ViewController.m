//
//  ViewController.m
//  FunWithFlags
//
//  Created by Daniel Hakimi-Nayeri on 05/07/2012.
//  Copyright (c) 2012 Lola Cars. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize questions, questionKeys;
@synthesize answers, answerKeys;
@synthesize images, imageKeys;

-(void)playGame:(id)sender
{
   // GameViewController *gvc = [self.storyboard instantiateViewControllerWithIdentifier:@"GameView"];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];       
	// Do any additional setup after loading the view, typically from a nib.*/
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
/*
- (IBAction)playGame:(id)sender {
}*/
@end
