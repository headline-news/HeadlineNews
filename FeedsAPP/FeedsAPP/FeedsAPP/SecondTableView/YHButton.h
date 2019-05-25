//
//  YHButton.h
//  FeedsAPP
//
//  Created by student on 2019/5/18.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIButton (Layout)

@property (nonatomic,assign) CGRect titleRect;

@property (nonatomic,assign) CGRect imageRect;

@end


@interface YHButton : UIButton

@property (nonatomic,assign) CGRect titleRect;

@property (nonatomic,assign) CGRect imageRect;
@end
