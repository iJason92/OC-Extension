//
//  UIImage+Joy.m
//  JoySummer
//
//  Created by ishpherdme on 27/3/15.
//  Copyright (c) 2015年 ishpherdme. All rights reserved.
//

#import "UIImage+Joy.h"

@implementation UIImage (Joy)
/**
 *   采用平铺方式放大图片
 *
 *  @param imgName 图片名
 *
 *  @return 放大后的图片
 */
+ (instancetype) resizeImage:(NSString *) imgName
{
    UIImage *img = [UIImage imageNamed:imgName];
    return  [img resizableImageWithCapInsets:UIEdgeInsetsMake(img.size.height * 0.5 , img.size.width * 0.5 , img.size.height * 0.5 , img.size.width * 0.5)];
    
}

/**
 */
+ (instancetype) circleImageWithName:(NSString *) name borderWidth:(CGFloat) borderWidth borderColor:(UIColor *) borderColor
{
    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    
    // 2.开启上下文
    CGFloat borderW = borderWidth;  // 圆环的宽度
    CGFloat imageW = oldImage.size.width + 2 *borderW;
    CGFloat imageH = oldImage.size.height + 2 * borderW;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.取得当前上下文
    CGContextRef ctx  = UIGraphicsGetCurrentContext();
    // 画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5;
    CGFloat centerX = bigRadius;
    CGFloat centerY = bigRadius;
    // 4.绘制圆形
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx);
    
    CGFloat smallRadius = bigRadius - borderW;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    
    // 裁剪
    CGContextClip(ctx);
    
    [oldImage drawInRect:CGRectMake(borderW, borderW, oldImage.size.width, oldImage.size.height)];
    // 5.按照当前的路径形状(圆形)裁剪,超出这个形状以外的内容都不显示
    
    // CGContextClip(ctx);
    // 6. 画图
    // [oldImage drawInRect:circleRect];
    
    // 7. 取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (instancetype) captureWithView:(UIView *)view
{
    // 1.开启上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    // 2.将控制器的view的layer渲染到上下文
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    // 3.取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        
    // 4.结束上下文
    UIGraphicsEndImageContext();
        
    return newImage;
}

@end
