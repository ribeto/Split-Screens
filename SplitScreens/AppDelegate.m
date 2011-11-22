//
//  AppDelegate.m
//  SplitScreens
//
//  Created by Hristo Hristov on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  // Override point for customization after application launch.
  self.window.backgroundColor = [UIColor whiteColor];
  
  RootViewController* rootViewController = [[RootViewController alloc] init];
  [[self window] setRootViewController:rootViewController];
  [self.window makeKeyAndVisible];
  
  
  //
  // Add notification observers for screen addition 
  //
  [[NSNotificationCenter defaultCenter] addObserver:self 
                                           selector:@selector(screenDidConnect:) 
                                               name:UIScreenDidConnectNotification 
                                             object:nil];
  
  [[NSNotificationCenter defaultCenter] addObserver:self 
                                           selector:@selector(screenDidDisconnect:) 
                                               name:UIScreenDidDisconnectNotification 
                                             object:nil];
  
  if( [[UIScreen screens] count] > 1 ) {
    [rootViewController connectedScreensChanged];
  }
  
  return YES;
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

- (void)connectedScreensChanged {
  
  RootViewController* rootViewController = (RootViewController*)[[self window] rootViewController];
  [rootViewController connectedScreensChanged];
}

- (void)screenDidConnect:(NSNotification*)note {
  [self connectedScreensChanged];
}

- (void)screenDidDisconnect:(NSNotification*)note {
  [self connectedScreensChanged];
}

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

- (void)applicationWillResignActive:(UIApplication *)application
{
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

@end
