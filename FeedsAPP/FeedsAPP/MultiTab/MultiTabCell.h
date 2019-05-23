//
//  MultiTabCell.h
//  FeedsAPP
//
//  Created by Yueyue on 2019/5/11.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#ifndef MultiTabCell_h
#define MultiTabCell_h

#import <UIKit/UIKit.h>
#import "HomeViewModel.h"
@interface MultiTabCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *info;

@property(nonatomic,strong) HomeViewModel *model;
@end

#endif /* MultiTabCell_h */
