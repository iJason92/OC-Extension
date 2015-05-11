//
//  NSArray+Log.m
//  JoySummer
//
//  Created by ishpherdme on 24/4/15.
//  Copyright (c) 2015 WDL. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        // 遍历数组
        [strM appendString:[NSString stringWithFormat:@"\t%@,\n",obj]];
        
    }];
    [strM appendString:@")"];
    return strM;
}
@end
