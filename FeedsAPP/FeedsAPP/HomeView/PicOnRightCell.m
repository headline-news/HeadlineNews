//
//  PicOnRightCell.m
//  FeedsAPP
//
//  Created by student4 on 2019/5/18.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "PicOnRightCell.h"


@interface PicOnRightCell()

@end

@implementation PicOnRightCell
-(void) setModel:(HomeViewModel *)model
{
    _model = model;
    
    _titleLabel.text = _model.title;
    _model.imageType = 1;
    _rightImage.image = [UIImage imageNamed:_model.rightImage];
    _infoLabel.text = _model.info;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
