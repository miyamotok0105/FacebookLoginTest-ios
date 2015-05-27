//
//  Regist1ViewController.m
//  FacebookLoginTest
//
//  Created by USER on 2015/05/15.
//  Copyright (c) 2015年 USER. All rights reserved.
//

#import "Regist1ViewController.h"

@interface Regist1ViewController ()

@end

@implementation Regist1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    //--------------------------------------------------------//
    // ボタンを追加
    // これをタップしたら画面遷移
    UIButton *prebutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [prebutton setTitle:@"前へ" forState:UIControlStateNormal];
    [prebutton sizeToFit];
    CGPoint prePoint = self.view.center;
    prePoint.y += 50;
    prebutton.center = prePoint;
    prebutton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [prebutton addTarget:self action:@selector(buttonDidPushToPre) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:prebutton];
    
    // ボタンを追加
    // これをタップしたら画面遷移
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"次へ" forState:UIControlStateNormal];
    [button sizeToFit];
    CGPoint newPoint = self.view.center;
    newPoint.y += 100;
    button.center = newPoint;
    button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button addTarget:self action:@selector(buttonDidPushToNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    //--------------------------------------------------------//
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)buttonDidPushToPre {
    // 自分自身を背面に移動
    // 結果として裏にあるViewController2が前面に出る
    [self.view.window bringSubviewToFront:[self.view.window.subviews objectAtIndex:0]];
    //        [self.view.window exchangeSubviewAtIndex:2 withSubviewAtIndex:0];
}


- (void)buttonDidPushToNext {
    // 自分自身を背面に移動
    // 結果として裏にあるViewController2が前面に出る
    [self.view.window sendSubviewToBack:self.view];
    //    [self.view.window exchangeSubviewAtIndex:0 withSubviewAtIndex:2];
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
