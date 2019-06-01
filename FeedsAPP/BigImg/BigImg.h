#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//预览大图
@interface BigImg : NSObject

+(void)BigImageWithImageView:(UIImageView *)currentImageview;

+(void)BigImageWithImage:(UIImage *)image frame:(CGRect)pOldframe;
@end
