//
//  SXTabBarViewController.m
//  SXCustomTabBar
//
//  Created by ShaoPro on 15/12/24.
//  Copyright © 2015年 ShaoPro. All rights reserved.
//

#import "SXTabBarViewController.h"


@interface SXTabBarViewController ()
{
    CGAffineTransform trans;
}
/**
 *  背景视图：
 */
@property (nonatomic,strong) UIView * BackgroundView;
/**
 *  背景图片
 */
@property (nonatomic,strong) UIImageView * imageView;
/**
 *  标题
 */
@property (nonatomic,strong) NSArray * titles;

@end

@implementation SXTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    /**
     *  加载控制器：
     */
    [self loadControllers];
    /**
     *  自定义TabBar
     */
    [self creationCusTabBar];
    
}
#pragma mark - === 创建控制器  ===
- (void)loadControllers
{
    
    OneViewController * oneVC = [[OneViewController alloc]init];
    oneVC.title = @"测试一";
    TwoViewController * twoVC = [[TwoViewController alloc]init];
    twoVC.title = @"测试二";
    ThreeViewController * three = [[ThreeViewController alloc]init];
    three.title = @"测试三";
    
    UINavigationController * nav1 = [[UINavigationController alloc]initWithRootViewController:oneVC];
    [nav1.navigationBar setBarTintColor:[UIColor cyanColor]];
    
    UINavigationController * nav2 = [[UINavigationController alloc]initWithRootViewController:twoVC];
    [nav2.navigationBar setBarTintColor:[UIColor yellowColor]];
    
    UINavigationController * nav3 = [[UINavigationController alloc]initWithRootViewController:three];
    [nav3.navigationBar setBarTintColor:[UIColor redColor]];
    
    //添加控制器
    self.viewControllers = @[nav1,nav2,nav3];
    
    
    for (UIView * view in self.tabBar.subviews)
    {
        [view removeFromSuperview];
    }
    //隐藏系统的
    self.tabBar.hidden = YES;
    _BackgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight-60, ScreenWidth, 60)];
    _BackgroundView.backgroundColor = ColorWithRGB(238, 238, 238, 1.0);
    
    [self.view addSubview:_BackgroundView];

    
    _imageView = [[UIImageView alloc]initWithFrame:_BackgroundView.bounds];
    _imageView.image = [UIImage imageNamed:@"icon_tabBar"];
    _imageView.userInteractionEnabled = YES;
    [_BackgroundView addSubview:_imageView];
    /**
     *  保持transform
     */
     trans = _BackgroundView.transform;
}


#pragma mark - === 自定义的TabBar ==
- (void)creationCusTabBar
{

    _titles = @[@"测试一",@"测试二",@"测试三"];
    NSArray * norImages = @[@"tabbar_contacts",@"tabbar_discover",@"tabbar_mainframe"];
    NSArray * seleImages = @[@"tabbar_contactsHL",@"tabbar_discoverHL",@"tabbar_mainframeHL"];
    //按钮宽度
    CGFloat width = ScreenWidth / _titles.count;
    
    
    for (NSInteger i = 0; i<_titles.count; i++)
    {
        //按钮：
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setImage:[UIImage imageNamed:[norImages objectAtIndex:i]]  forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[seleImages objectAtIndex:i]] forState:UIControlStateSelected];
       
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitle:[_titles objectAtIndex:i]forState:UIControlStateNormal];
        [btn setTintColor:[UIColor blackColor]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        btn.tag = i+100;
        
        [btn addTarget:self action:@selector(TapBnt:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 1)
        {
            btn.frame = CGRectMake(width*i, 20, width, 40);
        }
        else
        {
            btn.frame = CGRectMake(width*i, 0, width, 40);
        }
        
        
        [_imageView addSubview:btn];
        
    }
    
}

#pragma mark - === 逻辑处理 ====
/**
 *  点击按钮，切换控制器：
 */
- (void)TapBnt: (UIButton *)sender
{
    for (int i = 0; i < _titles.count; i++)
    {
        UIButton *btn = (UIButton *)[_imageView viewWithTag:i+100];
        btn.selected = NO;
    }
    sender.selected = !sender.selected;
    
    //切换控制器：
    self.selectedIndex = sender.tag - 100;
    
}


#pragma mark - == 显示或隐藏TabBar ===

//隐藏
- (void)HideTabarView:(BOOL)isHideen  animated:(BOOL)animated;
{
    //隐藏
    if (isHideen == YES)
    {
        //需要动画
        if (animated)
        {
            [UIView animateWithDuration:0.6 animations:^{
                //旋转动画:
                
            _BackgroundView.transform = CGAffineTransformRotate(_BackgroundView.transform, M_PI);
            _BackgroundView.alpha = 0;
            }];
        }
        //没有动画
        else
        {
   
            _BackgroundView.alpha = 0;
        }
    }
    //显示
    else
    {
        //需要动画
        if (animated)
        {
            [UIView animateWithDuration:0.6 animations:^{
                
                _BackgroundView.alpha = 1.0;
                _BackgroundView.transform = trans;
            }];
        }
        //没有动画
        else
        {
            _BackgroundView.alpha = 1.0;
            _BackgroundView.transform = trans;
        }
    }
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
