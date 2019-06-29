//
//  MUltiPicsModel.m
//  FeedsAPP
//
//  Created by Yueyue on 2019/5/22.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "HomeViewModel.h"
#import "NewsManager.h"

@implementation HomeViewModel

//自定义构造方法，必须调用父类的构造方法
-(id) initWithDict:(NSDictionary *)dict
{
    if(self = [super init])
    {
        self.title = dict[@"title"];
        self.groupId = dict[@"group_id"];
        self.image = dict[@"image_infos"];
        
        NSString *currentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString *filePath = [currentPath stringByAppendingPathComponent:@"content.plist"];
        NSMutableDictionary *contentt = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        NSMutableDictionary *content = contentt[self.groupId];
        
        NSUInteger count = [self.image count];
        if (count > 2) {
            self.imageType = 2;
            
            NSString * pre = self.image[0][@"url_prefix"];
            NSString * uri =self.image[0][@"web_uri"];
            self.rightImage = [pre stringByAppendingPathComponent:uri];
            
            pre = self.image[1][@"url_prefix"];
            uri =self.image[1][@"web_uri"];
            self.middleImage = [pre stringByAppendingPathComponent:uri];
            
            pre = self.image[2][@"url_prefix"];
            uri =self.image[2][@"web_uri"];
            self.leftImage = [pre stringByAppendingPathComponent:uri];
        }
        else if (count > 0) {
            self.imageType = 1;
            NSString * pre = self.image[0][@"url_prefix"];
            NSString * uri =self.image[0][@"web_uri"];
            self.rightImage = [pre stringByAppendingPathComponent:uri];
        }
        else if (count == 0)
            self.imageType = 0;
        
        // NSString * _info = [[NSString alloc] initWithFormat:@"Todo"];
        NSString * code = content[@"code"];
        if ([code isEqualToString:@"0"]) {
            self.info = @"";
            self.prefix = content[@"data"][@"image_url_prefix"];
        }
        else if ([code isEqualToString:@"-1"]) {
            self.info = @"";
        }
        else {
            self.info = @"";
        }
        // self.info = @"Todo";
    }
    return self;
}

+(id) newsWithDict:(NSDictionary *)dict
{
    return  [[self alloc] initWithDict:dict];
}

@end
