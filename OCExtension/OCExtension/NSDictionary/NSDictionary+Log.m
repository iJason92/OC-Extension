//
//  NSDictionary+Log.m
//  JoySummer
//
//  Created by ishpherdme on 24/4/15.
//  Copyright (c) 2015 WDL. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSString *pair = [NSString stringWithFormat:@"\t%@ = %@ \n",key,obj];
        [strM appendString:pair];
    }];
    [strM appendString:@"}"];
    return strM;
}
@end
