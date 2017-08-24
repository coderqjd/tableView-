//
//  Category.h
//  0628-tableViewLink
//
//  Created by 强进冬 on 2017/6/28.
//  Copyright © 2017年 强进冬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Category : NSObject

/** 名称 */
@property (nonatomic, copy) NSString *name;

+ (instancetype)categoryWithDict:(NSDictionary *)dict;

@end
