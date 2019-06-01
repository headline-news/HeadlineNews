//
//  YesManager.m
//  FeedsAPP
//
//  Created by MyMac on 2019/5/25.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "YesManager.h"

@implementation YesManager

+(void) status:(NSString*)groupId
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject
                                                                      delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    
    NSURL * url = [NSURL URLWithString:@"http://172.19.20.232:8080/HelloWeb/NewInq"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    NSString * params =@"id=q260BmEU5cED%2bKCdYKa0RQ%3d%3d&type=queryStatus";
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLSessionDataTask * dataTask =[delegateFreeSession dataTaskWithRequest:urlRequest
                                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                                NSLog(@"Response:%@ %@\n", response, error);
                                                                if(error == nil) {
                                                                    NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                                    NSLog(@"Data = %@",text);
                                                                }
                                                            }];
    [dataTask resume];
    
}

+(void) addCount:(NSString*)groupId
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject
                                                                      delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    
    NSURL * url = [NSURL URLWithString:@"http://172.19.20.232:8080/HelloWeb/NewInq"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    NSString * params =@"id=q260BmEU5cED%2bKCdYKa0RQ%3d%3d&type=add";
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLSessionDataTask * dataTask =[delegateFreeSession dataTaskWithRequest:urlRequest
                                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
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
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject
                                                                      delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    
    NSURL * url = [NSURL URLWithString:@"http://172.19.20.232:8080/HelloWeb/NewInq"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    NSString * params =@"id=q260BmEU5cED%2bKCdYKa0RQ%3d%3d&type=delete";
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLSessionDataTask * dataTask =[delegateFreeSession dataTaskWithRequest:urlRequest
                                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                                NSLog(@"Response:%@ %@\n", response, error);
                                                                if(error == nil) {
                                                                    NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                                    NSLog(@"Data = %@",text);
                                                                }
                                                            }];
    [dataTask resume];
    
}
+(void) getCount:(NSString*)groupId
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject
                                                                      delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    
    NSURL * url = [NSURL URLWithString:@"http://172.19.20.232:8080/HelloWeb/NewInq"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    NSString * params =@"id=q260BmEU5cED%2bKCdYKa0RQ%3d%3d&type=queryCount";
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLSessionDataTask * dataTask =[delegateFreeSession dataTaskWithRequest:urlRequest
                                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                                NSLog(@"Response:%@ %@\n", response, error);
                                                                if(error == nil) {
                                                                    NSString * text = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                                    NSLog(@"Data = %@",text);
                                                                }
                                                            }];
    [dataTask resume];
    
}

@end
