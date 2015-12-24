//
//  NextViewController.m
//  SXCustomTabBar
//
//  Created by ShaoPro on 15/12/24.
//  Copyright © 2015年 ShaoPro. All rights reserved.
//

#import "NextViewController.h"
#import "SXTabBarViewController.h"
@interface NextViewController ()

@end

@implementation NextViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    SXTabBarViewController * tabBar = (SXTabBarViewController *)self.tabBarController;
    //自定义隐藏Tabbar
    [tabBar HideTabarView:YES animated:YES];
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
