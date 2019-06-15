//
//  NewsDetail.m
//  FeedsAPP
//
//  Created by student7 on 2019/6/1.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "NewsDetail.h"

@interface NewsDetail ()

@property (nonatomic, strong) UIWebView *webView;

@end


@implementation NewsDetail

- (void)loadView {
    self.webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController popViewControllerAnimated:YES];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createUIWebViewTest:self.groupId];
    
}

- (void)createUIWebViewTest:(NSString*)groupId {
    self.webView.backgroundColor = [UIColor whiteColor];
    
    //    NSString *currentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    //    NSString *filePath = [currentPath stringByAppendingPathComponent:@"content.plist"];
    //    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    //
    //    [NewsManager getContent:groupId];
    //
    //    NSDictionary * diction = dict[@"data"];
    //    NSString *htmlString = diction[@"article_content"];
    //    NSString *prefix = diction[@"image_url_prefix"];
    
    NSString *htmlString = @"<div><p> \u5317\u4eac\u65f6\u95f411\u670820\u65e5\uff0c\u52c7\u58eb\u5ba2\u573a124-121\u9669\u80dc\u96c4\u9e7f\uff0c\u8c6a\u53d6\u4e03\u8fde\u80dc\uff0c\u675c\u5170\u7279\u9ad8\u6548\u7684\u780d\u4e0b33\u5206\u3002</p><p><img src=\"{{image_domain}}{\"fingerprint\": \"11711196689122212647\", \"hash_id\": 14478782129824553415, \"height\": 457, \"image_type\": 1, \"md5\": \"c8eef7a29c7759c7669c3c2d14173c41\", \"mimetype\": \"image/jpeg\", \"near_dup_id\": \"13135112579092908987\", \"ocr_text\": \"\\u5a1c,C777\\u575b,NXAZ\\u5976,iECON,W2,CC\\u516c,\\u5bb6e\", \"web_uri\": \"11960001c12fa2e1f44a\", \"width\": 640}\"></p><p> \u4eca\u590f\u675c\u5170\u7279\u4ee5\u81ea\u7531\u7403\u5458\u7684\u8eab\u4efd\u52a0\u76df\u4e86\u91d1\u5dde\u52c7\u58eb\u961f\uff0c\u5916\u754c\u5bf9\u6b64\u5404\u6267\u4e00\u8bcd\uff0c\u963f\u675c\u4e5f\u9971\u53d7\u8d28\u7591\uff0c\u4f46\u8bdd\u8bf4\u56de\u6765\uff0c\uff2e\uff22\uff21\u5c31\u662f\u4e00\u4e2a\u5546\u4e1a\u8054\u76df\uff0c\u7403\u573a\u5982\u6218\u573a\u3002\u675c\u5170\u7279\u5230\u6765\u65f6\uff0c\u52c7\u58eb\u7403\u5458\u5c31\u505a\u597d\u4e86\u727a\u7272\u7684\u51c6\u5907\u548c\u5fc3\u6001\u3002\u5c3d\u7ba1\u514b\u83b1-\u6c64\u666e\u68ee\u5728\u5b63\u524d\u8d5b\u8bf4\u8fc7\u727a\u7272\u4e2a\u5192\u9669\uff0c\u4f46\u8c01\u90fd\u77e5\u9053\u5927\u5bb6\u4f1a\u6709\u51fa\u624b\u6570\u7684\u727a\u7272\u3002\u4f0a\u6208\u8fbe\u62c9\u7684\u51fa\u573a\u65f6\u95f4\u4e5f\u4f1a\u51cf\u5c11\uff0c\u4f46\u52c7\u58eb\u5df2\u7ecf\u505a\u597d\u51c6\u5907\u4e86\uff1a\u62db\u52df\u5230\u51ef\u6587-\u675c\u5170\u7279\u8fd9\u6837\u7684\u5de8\u661f\uff0c\u73b0\u6709\u7403\u5458\u89d2\u8272\u4e0d\u6539\u53d8\u662f\u4e0d\u53ef\u80fd\u7684\u3002</p><p><img src=\"{{image_domain}}{\"fingerprint\": \"10558527235972386424\", \"hash_id\": 13632964547979993641, \"height\": 457, \"image_type\": 1, \"md5\": \"bd3205069dd76229be1d051266033bbb\", \"mimetype\": \"image/jpeg\", \"near_dup_id\": \"18334388862306945773\", \"ocr_text\": \"\\u9093RRy,3O,35,  RRC\", \"web_uri\": \"11990004e8abc87b77c1\", \"width\": 640}\"></p><p> \u5728\u5982\u4eca\u7684\u52c7\u58eb\u4f53\u7cfb\u4e2d\uff0c\u675c\u5170\u7279\u51e0\u4e4e\u78b0\u4e0d\u5230\u5305\u5939\uff0c\u5f88\u5c11\u4f1a\u9047\u5230\u534f\u9632\u3002\u7531\u4e8e\u5e93\u91cc\u6301\u7403\u7684\u5a01\u80c1\u592a\u5927\uff0c\u52c7\u58eb\u4ee5\u5f80\u7684\u5bf9\u624b\u4e0d\u4f1a\u8f7b\u6613\u653e\u6389\u7d27\u8ddf\u8fd9\u4e2a\u70b9\u3002\u5f88\u663e\u7136\uff0c\u675c\u5170\u7279\u5728\u52c7\u58eb\u7684\u4f53\u7cfb\u91cc\u80fd\u6253\u66f4\u591a\u7684\u65e0\u7403\u8fdb\u653b\uff0c\u8fd9\u4f7f\u5f97\u4ed6\u7684\u8fdb\u653b\u6548\u7387\u53d8\u5f97\u66f4\u9ad8\u3002</p><p><span> \u622a\u6b62\u76ee\u524d\u52c7\u58eb\u573a\u5747\u8f70\u4e0b116.3\u5206\u6392\u540d\u7b2c\u4e00\uff0c\u6bd4\u6392\u540d\u7b2c\u4e8c\u7684\u6e56\u4eba\u591a6.5\u5206\u3002\u573a\u5747\u62a2\u65ad10.0\u6b21\u6392\u540d\u7b2c\u4e09\uff0c\u4ec5\u6b21\u4e8e\u5feb\u8239\u768410.3\u6b21\u548c\u8001\u9e70\u768410.1\u6b21\u3002\u573a\u5747\u76d6\u5e3d5.9\u6b21\u6392\u540d\u7b2c\u4e94\uff0c\u66f4\u52a0\u53ef\u6015\u7684\u662f\u52c7\u58eb\u76ee\u524d\u573a\u5747\u52a9\u653b\u8fbe\u523030.9\u6b21\u3002\u5176\u4e2d\u683c\u6797\u573a\u57477.0\u52a9\u653b\u6392\u540d\u5c45\u9996\uff0c\u5176\u6b21\u662f\u5e93\u91cc\u76846.2\u6b21\u548c\u675c\u5170\u7279\u76844.3\u6b21\u3002</span></p><p><img src=\"{{image_domain}}{\"fingerprint\": \"17587585151181901566\", \"hash_id\": 14926410740650980045, \"height\": 457, \"image_type\": 1, \"md5\": \"cf25437c3013b2cdd7ec4e8e6f52ec14\", \"mimetype\": \"image/jpeg\", \"near_dup_id\": \"16869781627554077584\", \"ocr_text\": \"\\u5f69\\u6548\", \"web_uri\": \"11970005993c95c3bf82\", \"width\": 640}\"></p><p><span></span><br></p><p><span> \u76ee\u524d\u675c\u5170\u7279\u573a\u5747\u5f97\u5206\u4e3a\uff12\uff17\uff0e\uff19\u5206\uff0c\u672c\u8d5b\u5b63\u81f3\u4eca\uff0c\u675c\u5170\u7279\u547d\u4e2d\u7387\u8fbe\u5230\u60ca\u4eba\u768457.1%\uff0c\u751f\u6daf\u65b0\u9ad8\u3002\u6b64\u524d\u76849\u4e2a\u8d5b\u5b63\uff0c\u675c\u5170\u7279\u547d\u4e2d\u7387\u6700\u9ad8\u65f6\u4e5f\u662f\u4e94\u6210\uff0c2012-13\u8d5b\u5b63\u768451%\u3002\u6b64\u5916\uff0c\u4ed6\u7684\u4e09\u5206\u547d\u4e2d\u7387\u4e5f\u670940.4%\uff0c\u6295\u5c04\u80fd\u529b\u4e0a\u5347\u5230\u4e00\u4e2a\u65b0\u9ad8\u5ea6\u3002</span></p><p><span></span></p><p> \u73b0\u5728\u7684\u52c7\u58eb\u8fdc\u6ca1\u5230\u5341\u5168\u5341\u7f8e\uff0c\u4ed6\u4eec\u4ecd\u6709\u7f3a\u70b9\u3002\u4e8b\u5b9e\u662f\uff0c\u53ef\u80fd\u6709\u7684\u7f3a\u70b9\u65e0\u6cd5\u5f7b\u5e95\u5f25\u8865\uff0c\u53ea\u80fd\u575a\u6301\uff0c\u8fd9\u662f\u7b7e\u4e0b\u675c\u5170\u7279\u4e0d\u5f97\u4e0d\u4ed8\u51fa\u7684\u4ee3\u4ef7\u3002</p><p> \u52c7\u58eb\u5df2\u7ecf\u6709\u4e86\u4e00\u5957\u8db3\u4ee5\u6253\u51fa\u5386\u53f2\u7ea7\u9635\u5bb9\u7684\u597d\u724c\uff0c\u5927\u5bb6\u90fd\u77e5\u9053\u9700\u8981\u65f6\u95f4\u6765\u89e3\u51b3\u6240\u6709\u7684\u95ee\u9898\u3002\u4ed6\u4eec\u7684\u6323\u624e\u663e\u800c\u6613\u89c1\uff0c\u4f46\u73b0\u5728\u9664\u4e86\u5feb\u8239\uff0c\u52c7\u58eb\u5df2\u7ecf\u5728\u6218\u7ee9\u4e0a\u5feb\u8981\u8131\u9896\u800c\u51fa\u4e86\u3002</p><p><img src=\"{{image_domain}}{\"fingerprint\": \"15986709018178536179\", \"hash_id\": 8079423823646009582, \"height\": 457, \"image_type\": 1, \"md5\": \"701fe129363fa8ee08ddc9f397c8ac10\", \"mimetype\": \"image/jpeg\", \"near_dup_id\": \"1577485126001738881\", \"ocr_text\": \",35,  NWWn,KRRO\", \"web_uri\": \"11960001c10dc94d6f78\", \"width\": 640}\"></p><p> \u675c\u5170\u7279\u80fd\u5426\u4fdd\u6301\u7a33\u5b9a\u9ad8\u6548\u7684\u53d1\u6325\u5c06\u51b3\u5b9a\u52c7\u58eb\u80fd\u5426\u518d\u5ea6\u95ef\u8fdb\u603b\u51b3\u8d5b\uff0c\u81f3\u5c11\u76ee\u524d\u675c\u5170\u7279\u662f\u52c7\u58eb\u771f\u5927\u817f\u3002</p><p><span><br></span><br></p></div>";
    
    
    NSString *prefix = @"https://p1-tt.bytecdn.cn/large/";
    
    htmlString = [self filterImageUrlFromHTML:htmlString :prefix];
    
    // 加载本地HTML字符串
    [self.webView loadHTMLString:htmlString baseURL:nil];
    
    // 自动检测电话号码、网址、邮件地址
    self.webView.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    // 缩放网页
    self.webView.scalesPageToFit = YES;
}

- (NSString *)filterImageUrlFromHTML:(NSString *)html :(NSString *)prefix
{
    NSMutableArray *resultArray = [NSMutableArray array];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<(img|IMG)(.*?)(/>|></img>|>)" options:NSRegularExpressionAllowCommentsAndWhitespace error:nil];
    NSArray *result = [regex matchesInString:html options:NSMatchingReportCompletion range:NSMakeRange(0, html.length)];
    NSString* temp2 = html;
    temp2 = [temp2 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    
    for (NSTextCheckingResult *item in result) {
        NSString *imgHtml = [html substringWithRange:[item rangeAtIndex:0]];
        NSString* temp = imgHtml;
        NSLog(@"%@", temp);
        temp = [temp stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
        
        NSArray *tmpArray = nil;
        if ([imgHtml rangeOfString:@"\""].location != NSNotFound) {
            tmpArray = [imgHtml componentsSeparatedByString:@"\""];
        }
        
        if (tmpArray.count >= 30) {
            NSString *src = tmpArray[30];
            
            NSString* tempStr=@"<img src=\"";
            NSString* str_1;
            str_1 = [tempStr stringByAppendingString: prefix];
            NSString* str_2;
            str_2 = [str_1 stringByAppendingString: src];
            str_1 = [str_2 stringByAppendingString: @"\" >"];
            
            temp2 = [temp2 stringByReplacingOccurrencesOfString:temp withString:str_1];
            
            NSUInteger loc = [src rangeOfString:@"\""].location;
            if (loc != NSNotFound) {
                src = [src substringToIndex:loc];
                [resultArray addObject:src];
                
            }
        }
    }
    //NSLog(@"%@", temp2);
    temp2 = [temp2 stringByReplacingOccurrencesOfString:@"\\\"" withString:@"\""];
    
    return temp2;
}


@end
