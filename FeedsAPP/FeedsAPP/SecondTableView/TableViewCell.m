//
//  TableViewCell.m
//  FeedsAPP
//
//  Created by student on 2019/5/18.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewCell.h"

@implementation TableViewCell
{
    CGSize labelSize;
    CGFloat _width;
}

-(id)initWithReuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initLayuot];
    }
    return self;
}
//初始化控件
-(void)initLayuot{
    _width = [[UIScreen mainScreen] bounds].size.width;
    //用户名
    _name = [[UILabel alloc] initWithFrame:CGRectMake(57, 10, 250, 40)];
    _name.font=[UIFont systemFontOfSize:15];
    [self addSubview:_name];
    
    //发布时间
    _posttime = [[UILabel alloc] initWithFrame:CGRectMake(57, 30, 250, 40)];
    _posttime.font=[UIFont systemFontOfSize:13];
    _posttime.textColor = [UIColor grayColor];
    [_posttime setText:@"15分钟前   iPhone客户端 "];
    [self addSubview:_posttime];
    
    //用户头像
    _userImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 17, 40, 40)];
    _userImage.layer.cornerRadius = _userImage.frame.size.width / 2;
    _userImage.layer.masksToBounds = YES;
    [self addSubview:_userImage];
    
    //文本内容
    _content = [[UILabel alloc] initWithFrame:CGRectMake(12, 75, _width, 40)];
    _content.font=[UIFont systemFontOfSize:15];
    [self addSubview:_content];
    
    //点赞button
    _zangBtn=[YHButton new];
    [_zangBtn setImage:[UIImage imageNamed:@"c_comment_like_icon"] forState:UIControlStateNormal];
    [_zangBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _zangBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    
    //评论button
    _commentBtn=[YHButton new];
    [_commentBtn setImage:[UIImage imageNamed:@"comment_feed"] forState:UIControlStateNormal];
    [_commentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _commentBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    
    //转发button
    _forwardBtn=[YHButton new];
    [_forwardBtn setImage:[UIImage imageNamed:@"feed_share"] forState:UIControlStateNormal];
    [_forwardBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _forwardBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    
}

//赋值 and 自动换行,计算出cell的高度
-(void)setIntroductionText:(NSString*)text{
    _width = [[UIScreen mainScreen] bounds].size.width;
    //获得当前cell高度
    CGRect frame = [self frame];
    //文本赋值
    self.content.text = text;
    //设置label的最大行数
    self.content.numberOfLines = 10;
    CGSize size = CGSizeMake(_width-25, 1000);
    labelSize = [self.content.text sizeWithFont:self.content.font constrainedToSize:size lineBreakMode:NSLineBreakByClipping];
    self.content.frame = CGRectMake(self.content.frame.origin.x, self.content.frame.origin.y, labelSize.width, labelSize.height);
    
    //计算出自适应的高度
    frame.size.height = labelSize.height+120;
    
    //frame高度
    NSString *hightofcell = [NSString stringWithFormat:@"%.0f",frame.size.height];
    /*[_zangBtn setTitle:hightofcell forState:UIControlStateNormal];
    [_commentBtn setTitle:hightofcell forState:UIControlStateNormal];
    [_forwardBtn setTitle:hightofcell forState:UIControlStateNormal];*/
    
    //对点赞数、评论数、转发数进行初始化
    [_zangBtn setTitle:@"0" forState:UIControlStateNormal];
    [_commentBtn setTitle:@"0" forState:UIControlStateNormal];
    [_forwardBtn setTitle:@"0" forState:UIControlStateNormal];
    
    //添加赞、转发、评论button,对点赞数、评论数、转发数赋值
    [_zangBtn setTitle:@"1.1k" forState:UIControlStateNormal];
    [_commentBtn setTitle:@"1.1k" forState:UIControlStateNormal];
    [_forwardBtn setTitle:@"1.1k" forState:UIControlStateNormal];
    _zangBtn.imageRect=CGRectMake(_width/6-30, labelSize.height+8, 28, 28);
    _zangBtn.titleRect=CGRectMake(_width/6-2, labelSize.height+16, 80, 16);
    
    _commentBtn.imageRect=CGRectMake(_width/2-28, labelSize.height+10, 28, 28);
    _commentBtn.titleRect=CGRectMake(_width/2, labelSize.height+16, 80, 16);
    
    _forwardBtn.imageRect=CGRectMake(_width*5/6-28, labelSize.height+10, 28, 28);
    _forwardBtn.titleRect=CGRectMake(_width*5/6, labelSize.height+16, 80, 16);
    
    [_content addSubview:_zangBtn];
    [_content addSubview:_commentBtn];
    [_content addSubview:_forwardBtn];
    
    self.frame = frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}


@end  
