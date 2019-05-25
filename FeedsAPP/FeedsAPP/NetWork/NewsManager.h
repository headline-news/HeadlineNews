//
//  NewsManager.h
//  FeedsAPP
//
//  Created by MyMac on 2019/5/25.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NewsManager : NSObject<NSURLSessionDelegate,NSURLSessionDownloadDelegate,NSURLSessionDataDelegate>

+(void) httpPostNews;
@end
