//
//  RefreshHeaderView.h
//  FeedsAPP
//
//  Created by student11 on 2019/5/25.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, JW_RefreshShowType) {
    // 刷新状态
    RefreshTypeWillRefresh = 0,
    RefreshTypeRefreshing = 1,
    RefreshTypeCancelRefresh = 2
};
@interface RefreshHeaderView : UIView

@property (nonatomic , assign) JW_RefreshShowType type;

@end

NS_ASSUME_NONNULL_END
