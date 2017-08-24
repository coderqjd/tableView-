//
//  QJDCategoryViewController.m
//  0628-tableViewLink
//
//  Created by 强进冬 on 2017/6/28.
//  Copyright © 2017年 强进冬. All rights reserved.
//

#import "QJDCategoryViewController.h"
#import "Category.h"
#import "QJDSubCategoryViewController.h"

@interface QJDCategoryViewController () <UITableViewDelegate, UITableViewDataSource, QJDSubCategoryViewControllerDelegate>
/** 总类别数据 */
@property (nonatomic, strong) NSArray *categories;

/** 总类别tableview */
@property (nonatomic, weak) UITableView *categoryTableview;

@end

@implementation QJDCategoryViewController

- (NSArray *)categories {

    if (!_categories) {
        NSArray *dictArr = @[@{@"name" : @"第1类"},
                             @{@"name" : @"第2类"},
                             @{@"name" : @"第3类"},
                             @{@"name" : @"第4类"},
                             @{@"name" : @"第5类"},
                             @{@"name" : @"第6类"},
                             @{@"name" : @"第7类"},
                             @{@"name" : @"第8类"},
                             @{@"name" : @"第9类"},
                             @{@"name" : @"第10类"},
                             @{@"name" : @"第11类"},
                             @{@"name" : @"第12类"},
                             @{@"name" : @"第13类"},
                             @{@"name" : @"第14类"},
                             @{@"name" : @"第15类"},
                             @{@"name" : @"第16类"},
                             @{@"name" : @"第17类"},
                             @{@"name" : @"第18类"},
                             @{@"name" : @"第19类"},
                             @{@"name" : @"第20类"},
                             ];
        
        NSMutableArray *categoryArr = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArr) {
            Category *c = [Category categoryWithDict:dict];
            [categoryArr addObject:c];
        }
        
        _categories = categoryArr;
    }
    
    return _categories;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self addSubCateVc];
}

/** 设置tableview */
- (void)setupTableView {

    UITableView *categoryTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, QJDScreenWidth/4, QJDScreenHeight)];
    categoryTableView.delegate = self;
    categoryTableView.dataSource = self;
    categoryTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:categoryTableView];
    self.categoryTableview = categoryTableView;
    
    // 默认选择首行
    [self.categoryTableview selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
}

/** 添加子类别控制器和视图 */
- (void)addSubCateVc {

    QJDSubCategoryViewController *subVc = [[QJDSubCategoryViewController alloc] init];
    subVc.delegate = self;
    [self addChildViewController:subVc];
    [self.view addSubview:subVc.view];
    
//    self.delegate = subVc; // 代理类在外部也可以被设置为代理，但是协议要放在头文件中遵守，
    
    
}

#pragma mark - Table view data sourc
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    }
    
    Category *c = self.categories[indexPath.row];
    cell.textLabel.text = c.name;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.highlightedTextColor = QJDColor(62, 202, 191, 1);
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 告诉代理
    if ([self.delegate respondsToSelector:@selector(categoryViewController:didSelectRowWithIndexPath:)]) {
        [self.delegate categoryViewController:self didSelectRowWithIndexPath:indexPath];
    }
}

#pragma mark - <QJDSubCategoryViewControllerDelegate>
- (void)subCategoryViewController:(QJDSubCategoryViewController *)subCategoryViewController willDisplayHeaderViewWithSection:(NSInteger)section {

    [self.categoryTableview selectRowAtIndexPath:[NSIndexPath indexPathForRow:section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
}

-(void)subCategoryViewController:(QJDSubCategoryViewController *)subCategoryViewController didEndDisplayingHeaderViewWithSection:(NSInteger)section {

    [self.categoryTableview selectRowAtIndexPath:[NSIndexPath indexPathForRow:section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
}

@end
