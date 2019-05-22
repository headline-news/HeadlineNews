//
//  MulitiPicsCell.m
//  FeedsAPP
//
//  Created by student4 on 2019/5/18.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "MultiPicsCell.h"

@implementation MultiPicsCell
-(void) setModel:(HomeViewModel *)model
{
    _model = model;
    
    _titleLabel.text = _model.title;
    _model.imageType = 2;
    _leftImage.image = [UIImage imageNamed:_model.leftImage];
    _rightImage.image = [UIImage imageNamed:_model.rightImage];
    _middleImage.image = [UIImage imageNamed:_model.middleImage];
    _infoLabel.text = _model.info;
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



@end
