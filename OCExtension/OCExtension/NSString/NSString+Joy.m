//
//  NSString+Joy.m
//  JoySummer
//
//  Created by ishpherdme on 27/3/15.
//  Copyright (c) 2015年 ishpherdme. All rights reserved.
//

#import "NSString+Joy.h"

@implementation NSString (Joy)
- (CGSize ) sizeOfText:(CGSize ) maxSize  Font:(UIFont *) font
{
    return [self boundingRectWithSize:maxSize options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font}context:nil].size;
}
@end
