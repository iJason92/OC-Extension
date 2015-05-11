//
//  NSObject+Extension.m
//  01-网易新闻
//
//  Created by apple on 15/5/5.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)

const char* propertiesKeyDemo = "propertiesKey";

+ (instancetype)objectWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    //    [obj setValuesForKeysWithDictionary:dict];
    NSArray *properties = [self propertyList];
    
    // 遍历属性数组
    for (NSString *key in properties) {
        // 判断字典中是否包含这个key
        if (dict[key] != nil) {
            // 使用 KVC 设置数值
            [obj setValue:dict[key] forKeyPath:key];
        }
    }
    
    return obj;
}

+ (NSArray *)propertyList {
    
    // 0. 判断是否存在关联对象，如果存在，直接返回
    /**
     1> 关联到的对象
     2> 关联的属性 key
     
     提示：在 OC 中，类本质上也是一个对象
     */
    NSArray *pList = objc_getAssociatedObject(self, propertiesKeyDemo);
    if (pList != nil) {
        return pList;
    }
    
    // 1. 获取`类`的属性
    /**
     参数
     1> 类
     2> 属性的计数指针
     */
    unsigned int count = 0;
    // 返回值是所有属性的数组 objc_property_t
    objc_property_t *list = class_copyPropertyList([self class], &count);
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
    
    // 遍历数组
    for (unsigned int i = 0; i < count; ++i) {
        // 获取到属性
        objc_property_t pty = list[i];
        
        // 获取属性的名称
        const char *cname = property_getName(pty);
        
        [arrayM addObject:[NSString stringWithUTF8String:cname]];
    }
    NSLog(@"%@", arrayM);
    
    // 释放属性数组
    free(list);
    
    // 设置关联对象
    /**
     1> 关联的对象
     2> 关联对象的 key
     3> 属性数值
     4> 属性的持有方式 reatin, copy, assign
     */
    objc_setAssociatedObject(self, propertiesKeyDemo, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return arrayM.copy;
}

@end
