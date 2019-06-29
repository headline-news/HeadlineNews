//
//  DetailTableViewCell.m
//  FeedsAPP
//
//  Created by student11 on 2019/6/1.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailTableViewCell.h"
#import "YesManager.h"

@implementation DetailTableViewCell
{
    CGSize labelSize;
    CGFloat _width;
}

-(void) setModel:(DetailViewModel *)model
{
    _model = model;
    
    _name.text = _model.username;
    _userImage.image = [UIImage imageNamed:_model.headImage];
    _content.text = _model.mainText;
    [_zangBtn setTitle:[NSString stringWithFormat:@"%d",_model.likeNum] forState:UIControlStateNormal];
    _posttime.text = _model.time;
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
    _name = [[UILabel alloc] initWithFrame:CGRectMake(57, 15, 250, 40)];
    _name.font=[UIFont systemFontOfSize:15];
    [self addSubview:_name];
    
    //点赞button
    _zangBtn=[ZanButton new];
    //对点赞数初始化
    [_zangBtn setTitle:0 forState:UIControlStateNormal];
    _zangBtn.frame = CGRectMake(_width-60, 20, 28, 28);
    _zangBtn.titleRect = CGRectMake(30, 8, 80, 16);
    [_zangBtn setImage:[UIImage imageNamed:@"c_comment_like_icon"] forState:UIControlStateNormal];
    [_zangBtn setImage:[UIImage imageNamed:@"comment_like_icon_press"] forState:UIControlStateSelected];
    //_zangBtn.selected = YES;
    [_zangBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _zangBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [_zangBtn addTarget:self action:@selector(ZangClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_zangBtn];
    
    //用户头像
    _userImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 17, 40, 40)];
    _userImage.layer.cornerRadius = _userImage.frame.size.width / 2;
    _userImage.layer.masksToBounds = YES;
    [self addSubview:_userImage];
    
    //文本内容
    _content = [[UILabel alloc] initWithFrame:CGRectMake(57, 65, _width-70, 40)];
    _content.font=[UIFont systemFontOfSize:15];
    _content.numberOfLines = 0;
    [self addSubview:_content];
    
    _posttime = [[UILabel alloc] initWithFrame:CGRectMake(57, 110, 250, 40)];
    _posttime.font=[UIFont systemFontOfSize:13];
    _posttime.textColor = [UIColor grayColor];

    [self addSubview:_posttime];
    
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
    
    
    if(self.content.text.length > 97)
    {
        NSString *mainShow = [self.content.text substringWithRange:NSMakeRange(0, 97)];
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
    frame.size.height = labelSize.height+120;
    
    //frame高度
    NSString *hightofcell = [NSString stringWithFormat:@"%.0f",frame.size.height];
    /*[_zangBtn setTitle:hightofcell forState:UIControlStateNormal];
     [_commentBtn setTitle:hightofcell forState:UIControlStateNormal];
     [_forwardBtn setTitle:hightofcell forState:UIControlStateNormal];*/
    
    //发布时间
    _posttime = [[UILabel alloc] initWithFrame:CGRectMake(0, labelSize.height+8, 250, 40)];
    _posttime.font=[UIFont systemFontOfSize:13];
    _posttime.textColor = [UIColor grayColor];
    [_posttime setText:_model.time];
    [_content addSubview:_posttime];
    self.frame = frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
