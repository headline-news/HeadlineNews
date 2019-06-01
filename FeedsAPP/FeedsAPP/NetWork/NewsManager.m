//
//  NewsManager.m
//  FeedsAPP
//
//  Created by MyMac on 2019/5/25.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "NewsManager.h"

@implementation NewsManager

+(void) getNewsList:(int)uid :(int)offset :(int)count
{
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];

    //获取当前目录（directory）既 文件夹
    NSString *currentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [currentPath stringByAppendingPathComponent:@"list.plist"];
    // NSLog(@"Current directory path is: %@",filePath);


    NSURL * url = [NSURL URLWithString:@"https://i.snssdk.com/course/article_feed"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    NSString * params = [NSString stringWithFormat:@"uid=%d&offset=%d&count=%d",uid,offset,count];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];


    NSURLSessionDataTask * dataTask =[delegateFreeSession dataTaskWithRequest:urlRequest
                                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                          NSLog(@"Response:%@ %@\n", response, error);
                                          if(error == nil) {
                                              NSMutableDictionary *dataArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                              [dataArray writeToFile:filePath atomically:YES];
                                              
                                              // test
                                              // NSMutableDictionary *array = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
                                              // NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                              // NSLog(@"Data = %@",text);
                                              // NSLog(@"---plist一开始保存时候的内容---%@",array);
                                          }
                                          else {
                                              NSLog(@"请求失败:%@",error);
                                          }
                                      }];
    [dataTask resume];
}

+(void) getContent:(NSString*)groupId
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject
                                                                      delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    //获取当前目录（directory）既 文件夹
    NSString *currentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [currentPath stringByAppendingPathComponent:@"content.plist"];
    NSLog(@"Current directory path is: %@",filePath);
    
    //groupId = @"q260BmEU5cED%2bKCdYKa0RQ%3d%3d";
    NSURL * url = [NSURL URLWithString:@"https://i.snssdk.com/course/article_content"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    NSString * pre =@"groupId=";
    NSString * params = [pre stringByAppendingString:groupId];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLSessionDataTask * dataTask =[delegateFreeSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          NSLog(@"Response:%@ %@\n", response, error);
                                          if(error == nil) {
                                              NSMutableDictionary *dataArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                              [dataArray writeToFile:filePath atomically:YES];
                                          }
                                          else {
                                              NSLog(@"请求失败:%@",error);
                                          }
                                      }];
    [dataTask resume];
    
    
}
@end

