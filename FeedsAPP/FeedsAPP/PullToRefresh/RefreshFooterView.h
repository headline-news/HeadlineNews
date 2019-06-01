//
//  RefreshFooterView.h
//  FeedsAPP
//
//  Created by student11 on 2019/5/25.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JW_LoadShowType) {
    // 刷新状态
    LoadTypeWillLoad = 0,
    LoadTypeLoading = 1,
    LoadTypeCancel = 2
};

@interface RefreshFooterView : UIView

@property (nonatomic , assign) JW_LoadShowType type;
@end

NS_ASSUME_NONNULL_END
