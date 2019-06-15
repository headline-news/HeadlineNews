
#ifndef textView_h
#define textView_h
#import <UIKit/UIKit.h>
#import "cmDelegate.h"
@interface textView : UIView

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;

@property (weak, nonatomic) id<cmDelegate> delegate;

@end


#endif /* textView_h */
