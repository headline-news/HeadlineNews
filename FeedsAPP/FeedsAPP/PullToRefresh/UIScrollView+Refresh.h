//
//  UIScrollView+Refresh.h
//  FeedsAPP
//
//  Created by student11 on 2019/5/25.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RefreshHeaderView;
@class RefreshFooterView;

typedef NS_ENUM(NSInteger , JW_RefreshStatus) {
    
    // 刷新状态
    RefreshStatusWillRefresh = 0,
    RefreshStatusRefreshing = 1,
    RefreshStatusCancelRefresh = 2,
    RefreshStatusWillLoad = 3,
    RefreshStatusLoading = 4,
    RefreshStatusCancelLoad = 5
};
// 刷新的回调
typedef void(^headerRefresh)();
typedef void(^footerRefresh)();

@interface UIScrollView (Refresh)

@property (nonatomic , copy) headerRefresh headerBlock;
@property (nonatomic , copy) footerRefresh footerBlock;
@property (nonatomic , copy) NSString *RefreshStatus;
@property (nonatomic , assign) BOOL myStatus;

// 下拉刷新
- (void)addHeaderRefreshWithBlock:(headerRefresh)block;
- (void)endHeaderRefresh;

// 上拉加载
- (void)addFooterRefreshWithBlock:(footerRefresh)block;
- (void)endFooterRefresh;
@end

NS_ASSUME_NONNULL_END
