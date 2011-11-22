//
//  RootViewController.m
//  SplitScreens
//
//  Created by Hristo Hristov on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

@synthesize exernalWindow;
@synthesize mainLabel;
@synthesize subLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
  
  UIView* rootView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
  
  float labelHeight = 100.0f;
  
  //
  // Setup the main label
  //
  UILabel* tempLabel = nil;
  tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 
                                                        CGRectGetHeight([rootView frame])-2*labelHeight, 
                                                        CGRectGetWidth([rootView frame]), 
                                                        labelHeight)];
  [tempLabel setBackgroundColor:[UIColor redColor]];
  [tempLabel setTextColor:[UIColor lightGrayColor]];
  [tempLabel setTextAlignment:UITextAlignmentCenter];
  [tempLabel setFont:[UIFont boldSystemFontOfSize:40.0f]];
  [tempLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
  [tempLabel setText:@"Main Label"];
  [self setMainLabel:tempLabel];
  
  //
  // Setup the sub label
  //
  tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 
                                                        CGRectGetHeight([rootView frame])-labelHeight, 
                                                        CGRectGetWidth([rootView frame]), 
                                                        labelHeight)];
  [tempLabel setBackgroundColor:[UIColor blueColor]];
  [tempLabel setTextColor:[UIColor lightGrayColor]];
  [tempLabel setTextAlignment:UITextAlignmentCenter];
  [tempLabel setFont:[UIFont boldSystemFontOfSize:40.0f]];
  [tempLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
  [tempLabel setText:@"Sub Label"];
  [self setSubLabel:tempLabel];
  
  [rootView addSubview:[self mainLabel]];
  [rootView addSubview:[self subLabel]];
  [self setView:rootView];
  
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
- (void)setupExernalWindowWithScreen:(UIScreen*)screen {
  UIWindow* newWindow = [[UIWindow alloc] initWithFrame:[screen bounds]];
  [newWindow setScreen:screen];
  [newWindow setHidden:NO];
  
  [self setExernalWindow:newWindow];
}


- (void)connectedScreensChanged {
  if( [[UIScreen screens] count] == 1 ) {
    [mainLabel removeFromSuperview];
    float labelHeight = CGRectGetHeight([mainLabel frame]);
    [mainLabel setFrame:CGRectMake(0, 
                                   CGRectGetHeight([[self view] frame])-2*labelHeight, 
                                   CGRectGetWidth([[self view] frame]), 
                                   labelHeight)];
    
    [[self view] addSubview:mainLabel];
  
  } else {
    
    [self setupExernalWindowWithScreen:[[UIScreen screens] lastObject]];
    UIWindow* win = [self exernalWindow];
    
    [mainLabel removeFromSuperview];
    
    float labelHeight = CGRectGetHeight([mainLabel frame]);
    [mainLabel setFrame:CGRectMake(0, 
                                   CGRectGetHeight([win frame])-labelHeight, 
                                   CGRectGetWidth([win frame]), 
                                   labelHeight)];
    [win addSubview:mainLabel];
    
    
  }
}


@end
