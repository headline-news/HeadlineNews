//
//  MulitiPicsCell.m
//  FeedsAPP
//
//  Created by student4 on 2019/5/18.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "MultiPicsCell.h"
#import "BigImg.h"

@implementation MultiPicsCell
-(void) setModel:(HomeViewModel *)model
{
    _model = model;
    
    _titleLabel.text = _model.title;
    _model.imageType = 2;
    _leftImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_model.leftImage]]];
    _rightImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_model.rightImage]]];
    _middleImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_model.middleImage]]];
    if([_model.info isEqualToString:@"Error"]){
        _infoLabel.text = @"发布于6:00";
    }
    else{
        _infoLabel.text = @"发布于14:00";
    }
    
    //big img right
    //left
    UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftimgClick:)];
    [_leftImage addGestureRecognizer:tapGestureRecognizer1];
    //让UIImageView和它的父类开启用户交互属性
    [_leftImage setUserInteractionEnabled:YES];
    
    
    //middle
    UITapGestureRecognizer *tapGestureRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(middleimgClick:)];
    [_middleImage addGestureRecognizer:tapGestureRecognizer2];
    [_middleImage setUserInteractionEnabled:YES];
    
    //right
    UITapGestureRecognizer *tapGestureRecognizer3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightimgClick:)];
    [ _rightImage addGestureRecognizer:tapGestureRecognizer3];
    [ _rightImage setUserInteractionEnabled:YES];
    
    
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _imageViews = @[_leftImage,_middleImage,_rightImage];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    
}

#pragma mark - 浏览大图点击事件
-(void)leftimgClick:(UITapGestureRecognizer *)tap{

    UIImageView *imgview = (UIImageView *)tap.view;
    [BigImg BigImageWithImageView:imgview];
}

-(void)middleimgClick:(UITapGestureRecognizer *)tap{

    UIImageView *imgview = (UIImageView *)tap.view;
    
    [BigImg BigImageWithImageView:imgview];
    
}
-(void)rightimgClick:(UITapGestureRecognizer *)tap{

    UIImageView *imgview = (UIImageView *)tap.view;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [BigImg BigImageWithImage:imgview.image frame:[imgview convertRect:imgview.bounds toView:window]];
    
}

@end
