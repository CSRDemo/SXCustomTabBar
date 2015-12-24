//
//  ThreeViewController.m
//  SXCustomTabBar
//
//  Created by ShaoPro on 15/12/24.
//  Copyright © 2015年 ShaoPro. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth,ScreenHeight-64-60)];
    imageView.image = [UIImage imageNamed:@"03.jpg"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:imageView];
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
