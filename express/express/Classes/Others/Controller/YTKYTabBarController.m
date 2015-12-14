//
//  YTKYTabBarController.m
//  express
//
//  Created by yuntongios on 15/12/14.
//  Copyright © 2015年 http://www.ytky168.com. All rights reserved.
//

#import "YTKYTabBarController.h"
#import "MyViewController.h"
#import "OrderReceivViewController.h"
#import "SendViewController.h"
#import "YTKYNavigationController.h"
#import "YTKYTabBar.h"


@interface YTKYTabBarController ()

@end

@implementation YTKYTabBarController

- (void)viewDidLoad {
        [super viewDidLoad];
        
        // 设置item属性
        [self setupItem];
        
        // 添加所有的子控制器
        [self setupChildVcs];
        
        // 处理TabBar
        [self setupTabBar];
    }
    
    /**
     * 处理TabBar
     */
    - (void)setupTabBar
    {
        [self setValue:[[YTKYTabBar alloc] init] forKeyPath:@"tabBar"];
    }
    
    /**
     * 添加所有的子控制器
     */
    - (void)setupChildVcs
    {
        [self setupChildVc:[[SendViewController alloc] init] title:@"寄件" image:@"iconfont-kuaijie_n" selectedImage:@"iconfont-kuaijie"];
        
//        [self setupChildVc:[[OrderReceivViewController alloc] init] title:@"接单" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
        
        [self setupChildVc:[[MyViewController alloc] init] title:@"我的" image:@"iconfont-ren_select" selectedImage:@"iconfont-ren"];
        
    }
    
    /**
     * 添加一个子控制器
     * @param title 文字
     * @param image 图片
     * @param selectedImage 选中时的图片
     */
    - (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
    {
        // 包装一个导航控制器
        YTKYNavigationController *nav = [[YTKYNavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
        
        // 设置子控制器的tabBarItem
        nav.tabBarItem.title = title;
        nav.tabBarItem.image = [UIImage imageNamed:image];
        nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    
    /**
     * 设置item属性
     */
    - (void)setupItem
    {
        // UIControlStateNormal状态下的文字属性
        NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
        // 文字颜色
        normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        // 文字大小
        normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
        
        // UIControlStateSelected状态下的文字属性
        NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
        // 文字颜色
        selectedAttrs[NSForegroundColorAttributeName] = [UIColor blueColor];
        
        // 统一给所有的UITabBarItem设置文字属性
        // 只有后面带有UI_APPEARANCE_SELECTOR的属性或方法, 才可以通过appearance对象来统一设置
        UITabBarItem *item = [UITabBarItem appearance];
        [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
        [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    }



@end
