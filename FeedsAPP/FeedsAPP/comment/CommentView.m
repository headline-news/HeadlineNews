#import <Foundation/Foundation.h>
#import "CommentView.h"

//app的高度
#define cl_ScreenWidth ([UIScreen mainScreen].bounds.size.width)
//app的宽度
#define cl_ScreenHeight ([UIScreen mainScreen].bounds.size.height)


#define UIColorFromHEX(rgb) [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0]

@implementation CommentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"CommentView" owner:self options:nil];
        [self.contentView setFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        [self addSubview:self.contentView];
        
        [self configure];
    }
    return self;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self addSubview:self.clTextView];
    
    if (textField.text.length > 4) {
        NSMutableString *string = [[NSMutableString alloc] initWithString:textField.text];
        self.clTextView.commentTextView.text = [string substringFromIndex:4];
    }
    
    [self.clTextView.commentTextView becomeFirstResponder];
    [[UIApplication sharedApplication].keyWindow addSubview:self.clTextView];
    return NO;
}



#pragma mark - Public Method

- (void)showTextView {
    [self.editTextField becomeFirstResponder];
}

- (void)clearComment {
    self.editTextField.text = @"";
    self.clTextView.commentTextView.text = @"";
    // text time color
    [self.clTextView.sendButton setTitleColor:UIColorFromHEX(0x838383) forState:UIControlStateNormal];
}

#pragma mark - Private Method

- (void)configure {
    self.editView.layer.cornerRadius = 15;
    self.editView.clipsToBounds = YES;
    // line cell fen ge color
    self.editView.layer.borderColor = UIColorFromHEX(0xBCBAC1).CGColor;
    self.editView.layer.borderWidth = 0.5;
    // line cell fen ge color
    self.shareButton.layer.borderWidth = 0.5;
    self.shareButton.layer.borderColor = UIColorFromHEX(0xBCBAC1).CGColor;
    self.shareButton.layer.cornerRadius = CGRectGetHeight(self.shareButton.frame) / 2;
    // line cell fen ge color
    self.markButton.layer.borderWidth = 0.5;
    self.markButton.layer.borderColor = UIColorFromHEX(0xBCBAC1).CGColor;
    self.markButton.layer.cornerRadius = CGRectGetHeight(self.markButton.frame) / 2;
    // line cell fen ge bar color
    UIImageView *lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 0.5)];
    lineView.backgroundColor = UIColorFromHEX(0xA3A3A3);
    [self.contentView addSubview:lineView];
    
    self.editTextField.delegate = self;
}

#pragma mark - Accessor

- (textView *)clTextView  {
    if (!_clTextView) {
        _clTextView = [[textView alloc] initWithFrame:CGRectMake(0, 0, cl_ScreenWidth, cl_ScreenHeight)];
        _clTextView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    return _clTextView;
}

@end
