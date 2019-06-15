//
//  PicOnRightModel.m
//  FeedsAPP
//
//  Created by Yueyue on 2019/5/22.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "DetailViewModel.h"

@implementation DetailViewModel

//自定义构造方法，必须调用父类的构造方法
-(id) initWithDict:(NSDictionary *)dict
{
    if(self = [super init])
    {
        self.username = dict[@"leftImage"];
        self.likeNum = [dict[@"imageType"] intValue];
        self.mainText = dict[@"title"];
        self.headImage = dict[@"leftImage"];
        self.time = dict[@"info"];
    }
    return self;
}

+(id) newsWithDict:(NSDictionary *)dict
{
    return  [[self alloc] initWithDict:dict];
}

@end
