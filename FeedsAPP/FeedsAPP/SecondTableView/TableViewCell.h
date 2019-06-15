//
//  UITableViewCell.h
//  FeedsAPP
//
//  Created by student on 2019/5/18.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#ifndef TableViewCell_h
#define TableViewCell_h

#import <UIKit/UIKit.h>
#import "ZanButton.h"

@interface TableViewCell : UITableViewCell{
    
}

//用户名
@property(nonatomic,retain) UILabel *name;
//发布时间
@property(nonatomic,retain) UILabel *posttime;
//用户头像
@property(nonatomic,retain) UIImageView *userImage;
//文本内容
@property(nonatomic,retain) UILabel *content;
//点赞按钮
@property(nonatomic,strong) ZanButton *zangBtn;
//点赞特效
@property(nonatomic,strong) UIImageView *zangPlusImg;
//评论按钮
@property(nonatomic,strong) ZanButton *commentBtn;
//转发按钮
@property(nonatomic,strong) ZanButton *forwardBtn;
//给用户介绍赋值并且实现自动换行
-(void)setIntroductionText:(NSString*)text;
//初始化cell类
-(id)initWithReuseIdentifier:(NSString*)reuseIdentifier;
@end

#endif /* TableViewCell_h */
