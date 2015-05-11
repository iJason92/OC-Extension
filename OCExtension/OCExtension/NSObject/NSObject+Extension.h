//
//  NSObject+Extension.h
//  01-网易新闻
//
//  Created by apple on 15/5/5.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

/**
 *  字典转模型方法
 */
+ (instancetype)objectWithDict:(NSDictionary *)dict;
/**
 *  返回类的属性列表
 */
+ (NSArray *)propertyList;
@end
