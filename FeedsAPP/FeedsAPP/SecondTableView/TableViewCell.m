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
    //_zangBtn=[[UIButton alloc] initWithFrame:CGRectMake(_width/6-30, labelSize.height+88, 28, 28)];
    _zangBtn = [ZanButton new];
    [_zangBtn setImage:[UIImage imageNamed:@"c_comment_like_icon"] forState:UIControlStateNormal];
    [_zangBtn setImage:[UIImage imageNamed:@"comment_like_icon_press"] forState:UIControlStateSelected];
    //_zangBtn.selected = YES;
    [_zangBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _zangBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [_zangBtn addTarget:self action:@selector(ZangClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //评论button
    _commentBtn=[ZanButton new];
    [_commentBtn setImage:[UIImage imageNamed:@"comment_feed"] forState:UIControlStateNormal];
    [_commentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _commentBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    
    //转发button
    _forwardBtn=[ZanButton new];
    [_forwardBtn setImage:[UIImage imageNamed:@"feed_share"] forState:UIControlStateNormal];
    [_forwardBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _forwardBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    
}

-(void)ZangClicked:(id)sender
{
    _zangBtn.selected = !(_zangBtn.selected);
    int ZanNum = [_zangBtn.titleLabel.text intValue];
    if (_zangBtn.selected) {
        ZanNum = ZanNum + 1;
    } else {
        ZanNum = ZanNum - 1;
    }
    NSString *NumToString = [NSString stringWithFormat:@"%d",ZanNum];
    [_zangBtn setTitle:NumToString forState:UIControlStateNormal];
    [self ZangAction];
}

-(void)ZangAction{
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:0 animations: ^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 / 3.0 animations: ^{
            self.zangBtn.transform = CGAffineTransformMakeScale(1.3f, 1.3f); // 放大
        }];
        [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:1/3.0 animations: ^{
            self.zangBtn.transform = CGAffineTransformMakeScale(0.8f, 0.8f); // 放小
        }];
        [UIView addKeyframeWithRelativeStartTime:2/3.0 relativeDuration:1/3.0 animations: ^{
            self.zangBtn.transform = CGAffineTransformMakeScale(1.0f, 1.0f); //恢复原样
        }];
    } completion:nil];
    
    self.zangPlusImg.alpha=1;
    self.zangPlusImg.frame=CGRectMake(66, 0, 15, 15);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 1.5;
    animation.rotationMode = kCAAnimationRotateAuto;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(66, 8)];
    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(66, -6)];
    animation.delegate = self;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.values=@[value1,value2];
    [self.zangPlusImg.layer addAnimation:animation forKey:nil];
}

//赋值 and 自动换行,计算出cell的高度
-(void)setIntroductionText:(NSString*)text{
    _width = [[UIScreen mainScreen] bounds].size.width;
    //获得当前cell高度
    CGRect frame = [self frame];
    //文本赋值
    self.content.text = text;
    
    
    if(self.content.text.length>97)
    {
        NSString *mainShow = [self.content.text substringWithRange:NSMakeRange(0, 97)];
        mainShow=[mainShow stringByAppendingString:@"... 展开"];
        //mainShow.font
        NSMutableAttributedString *temp  = [[NSMutableAttributedString alloc] initWithString: mainShow];
        [temp addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(97, 6)];
        [temp addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:255 green:0 blue:0 alpha:0.8] range:NSMakeRange(101, 2)];
        self.content.attributedText = temp;
        //self.content.text = mainShow;
        
    }
    
    
    //设置label的最大行数
    self.content.numberOfLines = 10;
    CGSize size = CGSizeMake(_width-25, 1000);
    labelSize = [self.content.text sizeWithFont:self.content.font constrainedToSize:size lineBreakMode:NSLineBreakByClipping];
    self.content.frame = CGRectMake(self.content.frame.origin.x, self.content.frame.origin.y, labelSize.width, labelSize.height);
    
    //计算出自适应的高度
    frame.size.height = labelSize.height+130;
    
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
    [_zangBtn setTitle:@"120" forState:UIControlStateNormal];
    [_commentBtn setTitle:@"125" forState:UIControlStateNormal];
    [_forwardBtn setTitle:@"50" forState:UIControlStateNormal];
    //_zangBtn.imageRect=CGRectMake(_width/6-30, labelSize.height+8, 28, 28);
    _zangBtn.frame = CGRectMake(_width/6-30, labelSize.height+88, 28, 28);
    _zangBtn.titleRect=CGRectMake(28, 9, 80, 16);
    
    _commentBtn.frame=CGRectMake(_width/2-28, labelSize.height+93, 28, 28);
    _commentBtn.titleRect=CGRectMake(28, 5, 80, 16);
    
    _forwardBtn.frame=CGRectMake(_width*5/6-28, labelSize.height+90, 28, 28);
    _forwardBtn.titleRect=CGRectMake(28, 8, 80, 16);
    
    [self addSubview:_zangBtn];
    [self addSubview:_commentBtn];
    [self addSubview:_forwardBtn];
    
    self.frame = frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}


@end  
