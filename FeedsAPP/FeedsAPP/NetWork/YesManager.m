//
//  YesManager.m
//  FeedsAPP
//
//  Created by MyMac on 2019/5/25.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "YesManager.h"

@implementation YesManager

+(Boolean) status:(NSString*)groupId
{
    __block Boolean status;
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    
    NSURL * url = [NSURL URLWithString:@"http://172.19.25.167:8080/HelloWeb/NewInq"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    NSString * params = [[NSString alloc] initWithString:[NSString stringWithFormat:@"id=%@&type=queryStatus",groupId]];
    // NSString * params =@"id=q260BmEU5cED%2bKCdYKa0RQ%3d%3d&type=queryStatus";
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLSessionDataTask * dataTask =[delegateFreeSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          NSLog(@"Response:%@ %@\n", response, error);
                                          if(error == nil) {
                                              NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                              NSLog(@"Data = %@",text);
                                              status = [text boolValue];
                                          }
                                      }];
    [dataTask resume];
    return status;
}

+(void) addCount:(NSString*)groupId
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    
    NSURL * url = [NSURL URLWithString:@"http://172.19.25.167:8080/HelloWeb/NewInq"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    NSString * params = [[NSString alloc] initWithString:[NSString stringWithFormat:@"id=%@&type=add",groupId]];
    // NSString * params =@"id=q260BmEU5cED%2bKCdYKa0RQ%3d%3d&type=add";
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLSessionDataTask * dataTask =[delegateFreeSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          NSLog(@"Response:%@ %@\n", response, error);
                                          if(error == nil) {
                                              NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                              NSLog(@"Data = %@",text);
                                          }
                                      }];
    [dataTask resume];
    
}

+(void) deleteYes:(NSString*)groupId
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    
    NSURL * url = [NSURL URLWithString:@"http://172.19.25.167:8080/HelloWeb/NewInq"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    NSString * params = [[NSString alloc] initWithString:[NSString stringWithFormat:@"id=%@&type=delete",groupId]];
    // NSString * params =@"id=q260BmEU5cED%2bKCdYKa0RQ%3d%3d&type=delete";
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLSessionDataTask * dataTask =[delegateFreeSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          NSLog(@"Response:%@ %@\n", response, error);
                                          if(error == nil) {
                                              NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                              NSLog(@"Data = %@",text);
                                          }
                                      }];
    [dataTask resume];
    
}
+(int) getCount:(NSString*)groupId
{
    __block int count = -1;
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    
    NSURL * url = [NSURL URLWithString:@"http://172.19.25.167:8080/HelloWeb/NewInq"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    NSString * params = [[NSString alloc] initWithString:[NSString stringWithFormat:@"id=%@&type=queryCount",groupId]];
    // NSString * params =@"id=q260BmEU5cED%2bKCdYKa0RQ%3d%3d&type=queryCount";
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLSessionDataTask * dataTask =[delegateFreeSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          NSLog(@"Response:%@ %@\n", response, error);
                                          if(error == nil) {
                                              NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                              NSLog(@"Data = %@",text);
                                              count = [text intValue];
                                          }
                                      }];
    [dataTask resume];
    return count;
}

@end
