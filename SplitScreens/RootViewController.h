//
//  RootViewController.h
//  SplitScreens
//
//  Created by Hristo Hristov on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//



@interface RootViewController : UIViewController

@property (nonatomic, strong) UIWindow* exernalWindow;
@property (nonatomic, strong) UILabel*  mainLabel;
@property (nonatomic, strong) UILabel*  subLabel;

- (void)connectedScreensChanged;

@end
