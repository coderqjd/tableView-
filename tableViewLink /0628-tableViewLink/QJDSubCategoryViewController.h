//
//  QJDSubCategoryViewController.h
//  0628-tableViewLink
//
//  Created by 强进冬 on 2017/6/28.
//  Copyright © 2017年 强进冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QJDSubCategoryViewController;

@protocol QJDSubCategoryViewControllerDelegate <NSObject>

@optional
- (void)subCategoryViewController:(QJDSubCategoryViewController *)subCategoryViewController willDisplayHeaderViewWithSection:(NSInteger)section;

- (void)subCategoryViewController:(QJDSubCategoryViewController *)subCategoryViewController didEndDisplayingHeaderViewWithSection:(NSInteger)section;

@end

@interface QJDSubCategoryViewController : UITableViewController

/** 代理属性 */
@property (nonatomic, weak) id<QJDSubCategoryViewControllerDelegate> delegate;

@end
