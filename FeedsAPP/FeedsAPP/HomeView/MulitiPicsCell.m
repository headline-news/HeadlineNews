//
//  MulitiPicsCell.m
//  FeedsAPP
//
//  Created by student4 on 2019/5/18.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "MulitiPicsCell.h"

@interface MulitiPicsCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UIImageView *middleImage;
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (nonatomic , strong)NSArray *imageViews;
@end

@implementation MulitiPicsCell

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
