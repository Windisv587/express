//
//  UIView+FrameExtension.h
//  express
//
//  Created by yuntongios on 15/12/14.
//  Copyright © 2015年 http://www.ytky168.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameExtension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

/** 从xib中创建一个控件 */
+ (instancetype)viewFromXib;

@end
