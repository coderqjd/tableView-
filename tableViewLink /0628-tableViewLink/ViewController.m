//
//  ViewController.m
//  0628-tableViewLink
//
//  Created by 强进冬 on 2017/6/28.
//  Copyright © 2017年 强进冬. All rights reserved.
//

#import "ViewController.h"
#import "QJDCategoryViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"商品信息";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createBtn];
}

- (void)createBtn {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 80, 60);
    btn.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [btn setTitle:@"点击进入" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick {
    
    QJDCategoryViewController *vc = [[QJDCategoryViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
