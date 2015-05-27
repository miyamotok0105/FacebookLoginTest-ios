//
//  LoginViewController.h
//  FacebookLoginTest
//
//  Created by USER on 2015/05/15.
//  Copyright (c) 2015年 USER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

//#import <FacebookSDK/FacebookSDK.h>

@interface LoginViewController : UIViewController
{
//    NSArray *permissionsNeeded;
}


@property (strong, nonatomic) FBSDKLoginManager *loginManager;


//@property (weak, nonatomic) IBOutlet FBLoginView *loginView;
//
//@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
//@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;
//@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
//@property (weak, nonatomic) IBOutlet UILabel *profileLabel;

@end

