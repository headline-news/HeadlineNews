//
//  YesManager.h
//  FeedsAPP
//
//  Created by MyMac on 2019/5/25.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface YesManager : NSObject<NSURLSessionDelegate,NSURLSessionDataDelegate>

+(int) getCount:(NSString*)groupId;
+(void) deleteYes:(NSString*)groupId;
+(void) addCount:(NSString*)groupId;
+(Boolean) status:(NSString*)groupId;

@end
