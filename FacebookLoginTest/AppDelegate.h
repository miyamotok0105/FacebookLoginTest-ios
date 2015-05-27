//
//  AppDelegate.h
//  FacebookLoginTest
//
//  Created by USER on 2015/05/15.
//  Copyright (c) 2015年 USER. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AppDelegate : NSObject <UIApplicationDelegate> 
{
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;



//login view
@property (strong, nonatomic) UIViewController *loginViewController;





@end

