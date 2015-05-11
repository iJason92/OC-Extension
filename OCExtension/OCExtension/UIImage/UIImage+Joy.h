//
//  UIImage+Joy.h
//  JoySummer
//
//  Created by ishpherdme on 27/3/15.
//  Copyright (c) 2015年 ishpherdme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Joy)
/**
 *  调整图片大小
 *
 *  @param imgName 图片名
 */
+ (instancetype) resizeImage:(NSString *) imgName;

/**
 *  图形变圆并加上边框
 *
 *  @param name        图片名
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 */
+ (instancetype) circleImageWithName:(NSString *) name borderWidth:(CGFloat) borderWidth borderColor:(UIColor *) borderColor;

+ (instancetype) captureWithView:(UIView *)view;

@end
