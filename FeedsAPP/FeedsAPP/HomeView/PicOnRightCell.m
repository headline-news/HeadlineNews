//
//  PicOnRightCell.m
//  FeedsAPP
//
//  Created by student4 on 2019/5/18.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "PicOnRightCell.h"
#import "BigImg.h"

@interface PicOnRightCell()

@end

@implementation PicOnRightCell
-(void) setModel:(HomeViewModel *)model
{
    _model = model;
    
    _titleLabel.text = _model.title;
    _model.imageType = 1;
    _rightImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_model.rightImage]]];
    _infoLabel.text = _model.info;
    
    //big img
    UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)];
    [_rightImage addGestureRecognizer:tapGestureRecognizer1];
    [_rightImage setUserInteractionEnabled:YES];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 浏览大图点击事件
-(void)imgClick:(UITapGestureRecognizer *)tap{
    UIImageView *imgview = (UIImageView *)tap.view;
    [BigImg BigImageWithImageView:imgview];
}

@end
