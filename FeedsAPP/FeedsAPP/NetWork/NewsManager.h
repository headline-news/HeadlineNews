//
//  NewsManager.h
//  FeedsAPP
//
//  Created by MyMac on 2019/5/25.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NewsManager : NSObject<NSURLSessionDelegate,NSURLSessionDataDelegate>

+(void) getNewsList:(int)uid :(NSNumber*)offset :(int)count;
+(void) getContent:(NSString*)groupId;
@end

