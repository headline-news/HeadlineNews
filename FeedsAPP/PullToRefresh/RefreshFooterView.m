//
//  RefreshFooterView.m
//  FeedsAPP
//
//  Created by student11 on 2019/5/25.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "RefreshFooterView.h"

#define loading @"正在加载更多"
#define willLoad @"松手加载更多"
#define cancelLoad @"上拉加载更多"
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface RefreshFooterView()
// 标题
@property (nonatomic , strong) UILabel *title;
// 图片
@property (nonatomic , strong) UIImageView *img;
// 圆圈
@property (nonatomic , strong) UIActivityIndicatorView *refreshView;
@end
@implementation RefreshFooterView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self creatViews];
        [self addObserver:self forKeyPath:@"type" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}
- (void)creatViews{
    
    if (self.title == nil) {
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/3, 0, WIDTH/3, 50)];
        [self addSubview:self.title];
    }
    if (self.img == nil) {
        self.img = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/3-30, 10, 30, 30)];
        self.img.image = [UIImage imageNamed:@"refresh"];
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
    self.title.text = cancelLoad;
    self.title.textAlignment = NSTextAlignmentCenter;
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    // 处理刷新视图的改变
    if ([keyPath isEqualToString:@"type"]) {
        self.title.text = [self getRefreshStatus:_type];
        if (_type == LoadTypeWillLoad) {
            self.img.hidden = NO;
            self.refreshView.hidden = YES;
            [UIView animateWithDuration:0.3 animations:^{
                self.img.transform=CGAffineTransformMakeRotation(M_PI);
            }];
        }else if (_type == LoadTypeLoading) {
            self.img.hidden = YES;
            self.refreshView.hidden = NO;
        }else{
            self.img.hidden = NO;
            self.refreshView.hidden = YES;
            [UIView animateWithDuration:0.3 animations:^{
                self.img.transform=CGAffineTransformMakeRotation(0);
            }];
        }
    }
    
}
- (NSString *)getRefreshStatus:(JW_LoadShowType)status{
    
    switch (status) {
            
        case LoadTypeWillLoad:
            return willLoad;
        case LoadTypeLoading:
            return loading;
        case LoadTypeCancel:
            return cancelLoad;
        default:
            break;
    }
}

@end
