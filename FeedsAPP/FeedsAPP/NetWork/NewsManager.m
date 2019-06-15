//
//  NewsManager.m
//  FeedsAPP
//
//  Created by MyMac on 2019/5/25.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "NewsManager.h"

@implementation NewsManager

+(void) getNewsList:(int)uid :(NSNumber*)offset :(int)count
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
    int off = [offset intValue];
    NSString * params = [NSString stringWithFormat:@"uid=%d&offset=%d&count=%d",uid,off,count];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    static NSMutableDictionary * dict = nil;
    
    NSBlockOperation *oper1 =[NSBlockOperation blockOperationWithBlock:^{
        NSURLSessionDataTask * dataTask =[delegateFreeSession dataTaskWithRequest:urlRequest
                                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                                    NSLog(@"Response:%@ %@\n", response, error);
                                                                    if(error == nil) {
                                                                        dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                                        [dict writeToFile:filePath atomically:YES];
                                                                        
                                                                    }
                                                                }];
        
        [dataTask resume];
    }];
    
    // 任务2
    NSBlockOperation *oper2 = [NSBlockOperation blockOperationWithBlock:^{
        NSDictionary * diction = dict[@"data"];
        NSArray * diction1 = diction[@"article_feed"];
        for (NSDictionary *arr in diction1) {
            NSString * group_id = arr[@"group_id"];
            [NewsManager getContent:group_id];
        }
    }];
    // 添加依赖
    [oper2 addDependency:oper1];
    
    // 创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperations:@[oper1, oper2] waitUntilFinished:YES];



}

+(void) getContent:(NSString*)groupId
{
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    //获取当前目录（directory）既 文件夹
    NSString *currentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [currentPath stringByAppendingPathComponent:@"content.plist"];
    // NSLog(@"Current directory path is: %@",filePath);
    
    //groupId = @"q260BmEU5cED%2bKCdYKa0RQ%3d%3d";
    NSURL * url = [NSURL URLWithString:@"https://i.snssdk.com/course/article_content"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    NSString * params = [NSString stringWithFormat:@"groupId=%@",groupId];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    static NSMutableDictionary *dataArray = nil;
    
    NSURLSessionDataTask * dataTask =[delegateFreeSession dataTaskWithRequest:urlRequest
                                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                                NSLog(@"Response:%@ %@\n", response, error);
                                          if(error == nil) {
                                              
                                              dataArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                              // judge if the file exist
                                              NSFileManager *fileManager = [NSFileManager defaultManager];
                                              BOOL result = [fileManager fileExistsAtPath:filePath];
                                              NSMutableDictionary *dict =[[NSMutableDictionary alloc] init];
                                              if (result) {
                                                   dict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
                                              }
                                              [dict setObject:dataArray forKey:groupId];
                                              [dict writeToFile:filePath atomically:YES];
                                          }
                                      }];
    [dataTask resume];
    
}
@end

