//
//  Category.m
//  0628-tableViewLink
//
//  Created by 强进冬 on 2017/6/28.
//  Copyright © 2017年 强进冬. All rights reserved.
//

#import "Category.h"

@implementation Category

+ (instancetype)categoryWithDict:(NSDictionary *)dict {

    Category *c = [[Category alloc] init];
    
    [c setValuesForKeysWithDictionary:dict];
    
    return c;
}

@end
