//
//  NewsManager.m
//  FeedsAPP
//
//  Created by MyMac on 2019/5/25.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "NewsManager.h"

@implementation NewsManager

+(void) httpPostNews
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject
                                                                      delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    //获取当前目录（directory）既 文件夹
    NSString *currentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [currentPath stringByAppendingPathComponent:@"list.plist"];
    NSLog(@"Current directory path is: %@",filePath);
    
    
    NSURL * url = [NSURL URLWithString:@"https://i.snssdk.com/course/article_feed"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    NSString * params =@"uid=4822&offset=0&count=2";
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLSessionDataTask * dataTask =[delegateFreeSession dataTaskWithRequest:urlRequest
                                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                                NSLog(@"Response:%@ %@\n", response, error);
                                                                if(error == nil) {
                                                                    NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                                    NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                                    NSLog(@"Data = %@",text);
                                                                    [dataArray writeToFile:filePath atomically:YES];
                                                                    
                                                                    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
                                                                    NSLog(@"---plist一开始保存时候的内容---%@",array);
                                                                    // NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
                                                                    // NSLog(@"---plist一开始保存时候的内容---%@",dataDictionary);
                                                                }
                                                            }];
    [dataTask resume];
    
    
}
@end

