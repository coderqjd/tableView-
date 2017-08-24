//
//  QJDCategoryViewController.h
//  0628-tableViewLink
//
//  Created by 强进冬 on 2017/6/28.
//  Copyright © 2017年 强进冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QJDCategoryViewControllerDelegate <NSObject>
@optional
- (void)categoryViewController:(UIViewController *)categoryViewController didSelectRowWithIndexPath:(NSIndexPath *)indexPath;
@end

@interface QJDCategoryViewController : UIViewController

/** 代理 */
@property (nonatomic, weak) id<QJDCategoryViewControllerDelegate> delegate;

//- (void)didSelectRowAtIndexPathCompletion:(void (^)(NSInteger))completion;

@end
