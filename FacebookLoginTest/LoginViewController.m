//
//  LoginViewController.m
//  FacebookLoginTest
//
//  Created by USER on 2015/05/15.
//  Copyright (c) 2015年 USER. All rights reserved.
//

#import "LoginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //--------------------------------------------------------//

    
    //--------------------------------------------------------//
    //--------------------------------------------------------//
    // ■facebook Login
    UIImage *image_LoginFacebook = [UIImage imageNamed:@"LG_btn_facebook@2x.png"];
    UIButton *btn_LoginFacebook = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn_LoginFacebook.frame = CGRectMake(self.view.frame.size.width/3, self.view.frame.size.height*0.7, 200, 30);
    [btn_LoginFacebook setBackgroundImage:image_LoginFacebook forState:UIControlStateNormal];
    [btn_LoginFacebook addTarget:self
                          action:@selector(loginbuton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_LoginFacebook];
    //--------------------------------------------------------//
    UIButton *logoutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [logoutButton setTitle:@"logout" forState:UIControlStateNormal];
    [logoutButton sizeToFit];
    CGPoint logoutPoint = self.view.center;
    logoutPoint.y += 10;
    logoutButton.center = logoutPoint;
    logoutButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [logoutButton addTarget:self action:@selector(buttonLogout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoutButton];
    //--------------------------------------------------------//
    UIButton *tokenButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [tokenButton setTitle:@"delete" forState:UIControlStateNormal];
    [tokenButton sizeToFit];
    CGPoint tokenPoint = self.view.center;
    tokenPoint.y += 30;
    tokenButton.center = tokenPoint;
    tokenButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [tokenButton addTarget:self action:@selector(buttonDelete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tokenButton];
    //--------------------------------------------------------//
    UIButton *loadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loadButton setTitle:@"loadData" forState:UIControlStateNormal];
    [loadButton sizeToFit];
    CGPoint loadPoint = self.view.center;
    loadPoint.y += 50;
    loadButton.center = loadPoint;
    loadButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [loadButton addTarget:self action:@selector(buttonLoad) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loadButton];
    //--------------------------------------------------------//
    
    
    [self _loadData];
    
    

    
}

//------------------------- ★　　★ -------------------------//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_loadData {
    // ...
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        // handle response
        if (!error) {
            
            NSLog(@"fetched user:%@", result);
            // result is a dictionary with the user's Facebook data
            NSDictionary *userData = (NSDictionary *)result;
            
            NSString *facebookID = userData[@"id"];
            NSString *name = userData[@"name"];
            NSString *location = userData[@"location"][@"name"];
            NSString *gender = userData[@"gender"];
            NSString *birthday = userData[@"birthday"];
            NSString *relationship = userData[@"relationship_status"];
            
            NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
            
            UILabel *label = [[UILabel alloc] init];
            label.frame = CGRectMake(10, 10, 200, 50);
            label.backgroundColor = [UIColor yellowColor];
            label.textColor = [UIColor blueColor];
            label.font = [UIFont fontWithName:@"AppleGothic" size:12];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = facebookID;
            [self.view addSubview:label];
            
            UILabel *label2 = [[UILabel alloc] init];
            label2.frame = CGRectMake(10, 50, 200, 50);
            label2.backgroundColor = [UIColor yellowColor];
            label2.textColor = [UIColor blueColor];
            label2.font = [UIFont fontWithName:@"AppleGothic" size:12];
            label2.textAlignment = NSTextAlignmentCenter;
            label2.text = name;
            [self.view addSubview:label2];
            
            // Now add the data to the UI elements
            // ...
        }
        
    }];
}

-(void)loginbuton:(UIButton*)button{

    NSLog(@"login button start");
    

    _loginManager = [[FBSDKLoginManager alloc] init];
    [_loginManager logInWithReadPermissions:@[@"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            // Process error
        } else if (result.isCancelled) {
            // Handle cancellations
        } else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if ([result.grantedPermissions containsObject:@"email"]) {
                // Do work
            }
        }
    }];
    
}



- (void)buttonLogout {

    NSLog(@"logout");
    [_loginManager logOut];
    
    
}



- (void)buttonLoad {
    
    
    NSLog(@"loadData");
    
    
    [self _loadData];
    
    
}



- (void)buttonDelete {
    
    NSLog(@"delete");
    
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me/permissions"
                                       parameters:nil
                                       HTTPMethod:@"DELETE"]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         // ...
     }];
    
   
    

}


//------------------------- ★　FB　★ ------------------------->>//
//------------------------- ★　FB　★ -------------------------<<//



@end
