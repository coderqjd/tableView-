//
//  QJDSubCategoryViewController.m
//  0628-tableViewLink
//
//  Created by 强进冬 on 2017/6/28.
//  Copyright © 2017年 强进冬. All rights reserved.
//

#import "QJDSubCategoryViewController.h"
#import "QJDCategoryViewController.h"

@interface QJDSubCategoryViewController ()<QJDCategoryViewControllerDelegate>

/** 组名数据 */
@property (nonatomic, strong) NSArray *sections;
/** 子类别的数据 */
@property (nonatomic, strong) NSArray *subCategories;
/** 是否向上滑动 */
@property (nonatomic, assign) BOOL isScrollUp;

@end

static NSString *const cellID = @"subcategory";

@implementation QJDSubCategoryViewController

#pragma mark - lazy
- (NSArray *)sections {

    if(!_sections) {
        _sections = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十",@"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十"];
        NSMutableArray *mArr = [NSMutableArray array];
        for (NSString *str in _sections) {
            NSString *string = [NSString stringWithFormat:@"第%@组", str];
            [mArr addObject:string];
        }
        _sections = mArr;
    }
    
    return _sections;
}

- (NSArray *)subCategories {

    if (!_subCategories) {
        _subCategories = @[@"鞋子",@"衣服",@"化妆品",@"饮用水",@"副食品",@"小吃",@"鞋子",@"衣服",@"化妆品",@"饮用水"];
    }
    return _subCategories;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    [self setupTableView];
    
    // 设置代理
    QJDCategoryViewController *cateVc = (QJDCategoryViewController *)self.parentViewController;
    cateVc.delegate = self;
}


/** 设置tableview */
- (void)setupTableView {

    self.tableView.frame = CGRectMake(QJDScreenWidth * 0.25, 64, QJDScreenWidth*0.75, QJDScreenHeight - 64);
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 200, 0);
    self.tableView.showsVerticalScrollIndicator = NO;
}

#pragma mark - <QJDCategoryViewControllerDelegate>
- (void)categoryViewController:(UIViewController *)categoryViewController didSelectRowWithIndexPath:(NSIndexPath *)indexPath {

    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subCategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    cell.textLabel.text = self.subCategories[indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    return self.sections[section];
}

#pragma mark - <UITableViewDelegate>
/**
 * 主要是依据TableView的顶段的头视图的出现和消失,来传section的值
 */
/** 头视图将要显示时 */
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {

    // 向下滑,头视图才会出现, section:此时左边TableView的 row = section
    if ([self.delegate respondsToSelector:@selector(subCategoryViewController:willDisplayHeaderViewWithSection:)] && !self.isScrollUp && self.tableView.dragging) {
        
        [self.delegate subCategoryViewController:self willDisplayHeaderViewWithSection:section];
    }
}

/** 头视图不再显示时 */
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    
    // 向上滑动头视图才会消失
    if ([self.delegate respondsToSelector:@selector(subCategoryViewController:didEndDisplayingHeaderViewWithSection:)] && self.isScrollUp && self.tableView.dragging) {
        
        [self.delegate subCategoryViewController:self didEndDisplayingHeaderViewWithSection:section + 1];
    }
}

#pragma mark - <UIScrollerViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    static CGFloat lastOffsetY = 0;
    
    if (lastOffsetY < scrollView.contentOffset.y) {
        NSLog(@"%.2f, %.2f---向上滑动", lastOffsetY, scrollView.contentOffset.y);
    } else {
        NSLog(@"%.2f, %.2f---向下滑动", lastOffsetY, scrollView.contentOffset.y);
    }
    self.isScrollUp = lastOffsetY < scrollView.contentOffset.y;
    lastOffsetY = scrollView.contentOffset.y;
}
@end
