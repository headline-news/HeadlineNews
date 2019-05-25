//
//  UserModel.h
//  FeedsAPP
//
//  Created by student on 2019/5/18.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#ifndef UserModel_h
#define UserModel_h
#import <UIKit/UIKit.h>
#import "YHButton.h"


@interface UserModel : NSObject

//用户名
@property (nonatomic,copy) NSString *username;
//发布时间
@property(nonatomic,retain) UILabel *posttime;
//文本内容
@property (nonatomic,copy) NSString *introduction;
//头像图片路径
@property (nonatomic,copy) NSString *imagePath;
//点赞按钮
@property(nonatomic,strong) YHButton *zangBtn;
//评论按钮
@property(nonatomic,strong) YHButton *commentBtn;
//转发按钮
@property(nonatomic,strong) YHButton *forwardBtn;

@end
#endif /* UserModel_h */
