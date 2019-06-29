//
//  MultiTabCell.m
//  FeedsAPP
//
//  Created by Yueyue on 2019/5/11.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "MultiTabCell.h"

@interface MultiTabCell()

@end

@implementation MultiTabCell
-(void) setModel:(HomeViewModel *)model
{
    _model = model;
    
    _title.text = _model.title;
    _model.imageType = 0;
    if([_model.info isEqualToString:@"Error"]){
        _info.text = @"发布于6:00";
    }
    else{
        _info.text = @"发布于14:00";
    }
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
