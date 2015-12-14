//
//  YTKYTabBar.m
//  express
//
//  Created by yuntongios on 15/12/14.
//  Copyright © 2015年 http://www.ytky168.com. All rights reserved.
//

#import "YTKYTabBar.h"
#import "OrderReceivViewController.h"

@interface YTKYTabBar ()

//接单按钮
@property(nonatomic,weak)UIButton *OrderReceivButton;

@end

@implementation YTKYTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 设置背景图片
        self.backgroundImage = [UIImage imageNamed:@"bar_image-1"];
        // 添加发布按钮
        UIButton *OrderReceivButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [OrderReceivButton setBackgroundImage:[UIImage imageNamed:@"main"] forState:UIControlStateNormal];
        [OrderReceivButton setBackgroundImage:[UIImage imageNamed:@"main"] forState:UIControlStateHighlighted];
        [OrderReceivButton sizeToFit];
        [OrderReceivButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:OrderReceivButton];
        self.OrderReceivButton = OrderReceivButton;
    }
    return self;
}

- (void)publishClick
{
    OrderReceivViewController *OrderReceiv = [[OrderReceivViewController alloc] init];
    [self.window.rootViewController presentViewController:OrderReceiv animated:NO completion:nil];
}

/**
 * 布局子控件
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    // tabBar的尺寸
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    // 设置发布按钮的位置
    self.OrderReceivButton.center = CGPointMake(width * 0.5, height * 0.5);
    
    // 按钮索引
    int index = 0;
    
    // 按钮的尺寸
    CGFloat tabBarButtonW = width / 3;
    CGFloat tabBarButtonH = height;
    CGFloat tabBarButtonY = 0;
    
    // 设置4个TabBarButton的frame
    for (UIView *tabBarButton in self.subviews) {
        if (![NSStringFromClass(tabBarButton.class) isEqualToString:@"UITabBarButton"]) continue;
        
        // 计算按钮的X值
        CGFloat tabBarButtonX = index * tabBarButtonW;
        if (index >= 1) { // 给后面2个button增加一个宽度的X值
            tabBarButtonX += tabBarButtonW;
        }
        
        // 设置按钮的frame
        tabBarButton.frame = CGRectMake(tabBarButtonX, tabBarButtonY, tabBarButtonW, tabBarButtonH);
        
        // 增加索引
        index++;
    }
}


@end
