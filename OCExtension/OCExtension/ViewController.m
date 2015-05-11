//
//  ViewController.m
//  OCExtension
//
//  Created by Jason on 12/5/15.
//  Copyright (c) 2015年 Shepherd. All rights reserved.
//

#import "ViewController.h"
#import "NSData+Joy.h"
#import "NSObject+Extension.h"
#import "NSString+Joy.h"
#import "UIColor+Joy.h"
#import "UIImage+Joy.h"
#import "UIView+Joy.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // NSArray+Log 让数组内包含中文的部分也直接输出
    NSArray *eArrs = @[@[@"中文"],@"法语",@"德语"];
    NSLog(@"%@",eArrs);
}

@end
