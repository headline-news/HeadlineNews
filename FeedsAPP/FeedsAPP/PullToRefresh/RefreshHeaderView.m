//
//  RefreshHeaderView.m
//  FeedsAPP
//
//  Created by student11 on 2019/5/25.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "RefreshHeaderView.h"
#define refreshing @"正在刷新数据"
#define willRefresh @"松手刷新数据"
#define cancelRefresh @"下拉刷新数据"
#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface RefreshHeaderView()
// 标题
@property (nonatomic , strong) UILabel *title;
// 图片
@property (nonatomic , strong) UIImageView *img;
// 圆圈
@property (nonatomic , strong) UIActivityIndicatorView *refreshView;
@end

@implementation RefreshHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(0, -50, WIDTH, 50);
        [self creatViews];
        [self addObserver:self forKeyPath:@"type" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

// 添加刷新视图
- (void)creatViews{
    
    if (self.title == nil) {
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/3, 0, WIDTH/3, 50)];
        [self addSubview:self.title];
    }
    if (self.img == nil) {
        self.img = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/3-30, 10, 30, 30)];
        self.img.image = [UIImage imageNamed:@"refresh"];
        self.img.transform=CGAffineTransformMakeRotation(M_PI);
        [self addSubview:self.img];
    }
    if (self.refreshView == nil) {
        self.refreshView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        self.refreshView.center = CGPointMake(WIDTH/3-15, 25);
        self.refreshView.hidden = YES;
        [self.refreshView startAnimating];
        [self addSubview:self.refreshView];
    }
    self.title.font = [UIFont systemFontOfSize:18];
    self.title.text = cancelRefresh;
    self.title.textAlignment = NSTextAlignmentCenter;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    // 处理刷新视图的改变
    if ([keyPath isEqualToString:@"type"]) {
        self.title.text = [self getRefreshStatus:_type];
        if (_type == RefreshTypeWillRefresh) {
            self.img.hidden = NO;
            self.refreshView.hidden = YES;
            [UIView animateWithDuration:0.3 animations:^{
                self.img.transform=CGAffineTransformMakeRotation(0);
            }];
        }else if (_type == RefreshTypeRefreshing) {
            self.img.hidden = YES;
            self.refreshView.hidden = NO;
        }else{
            self.img.hidden = NO;
            self.refreshView.hidden = YES;
            [UIView animateWithDuration:0.3 animations:^{
                self.img.transform=CGAffineTransformMakeRotation(M_PI);
            }];
        }
    }
}
- (NSString *)getRefreshStatus:(JW_RefreshShowType)status{
    
    switch (status) {
            
        case RefreshTypeWillRefresh:
            return willRefresh;
        case RefreshTypeRefreshing:
            return refreshing;
        case RefreshTypeCancelRefresh:
            return cancelRefresh;
        default:
            break;
    }
}

@end
