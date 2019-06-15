
#ifndef CommentView_h
#define CommentView_h

#import <UIKit/UIKit.h>
#import "cmDelegate.h"
#import "textView.h"


@interface CommentView : UIView<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *editView;
@property (weak, nonatomic) IBOutlet UITextField *editTextField;
@property (weak, nonatomic) IBOutlet UIButton *markButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) id<cmDelegate> delegate;

@property (nonatomic, strong) textView *clTextView;

- (void)showTextView;

- (void)clearComment;

@end



#endif /* CommentView_h */
