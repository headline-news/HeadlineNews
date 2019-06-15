

#import <Foundation/Foundation.h>
#import "textView.h"

//app的高度
#define cl_ScreenWidth ([UIScreen mainScreen].bounds.size.width)
//app的宽度
#define cl_ScreenHeight ([UIScreen mainScreen].bounds.size.height)

#define UIColorFromRGB(r,g,b,a) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]

#define UIColorFromHEX(rgb) [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0]

static CGFloat const kCommentTextViewHeight = 200.0;
static CGFloat const kMininumKeyboardHeight = 216.0;

@interface textView ()<UITextViewDelegate>

@property (nonatomic, strong) UIVisualEffectView *backgroundView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewConstraintHeight;

@end

@implementation textView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    // screen width
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"textView" owner:self options:nil];
        [self.contentView setFrame:CGRectMake(0, 0, cl_ScreenWidth, cl_ScreenHeight)];
        [self addSubview:self.contentView];
        
        [self configure];
    }
    return self;
}

#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length > 0) {
        //text main text color
        [self.sendButton setTitleColor: UIColorFromHEX(0x333333) forState:UIControlStateNormal];
    } else {
        //text time color
        [self.sendButton setTitleColor:UIColorFromHEX(0x838383) forState:UIControlStateNormal];
    }
    
    if ([self.delegate respondsToSelector:@selector(cl_textViewDidChange:)]) {
        [self.delegate cl_textViewDidChange:self];
    }
}

#pragma mark - Event Response

- (IBAction)cancelAction:(UIButton *)sender {
    [self.commentTextView resignFirstResponder];
    [self dismissCommentTextView];
}

- (IBAction)sendAction:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(cl_textViewDidEndEditing:)]) {
        [self.delegate cl_textViewDidEndEditing:self];
    }
    
    [self.commentTextView resignFirstResponder];
    [self dismissCommentTextView];
}

- (void)tapAction:(UITapGestureRecognizer *)sender {
    [self.commentTextView resignFirstResponder];
    
    [self dismissCommentTextView];
}

- (void)swipeAction:(UISwipeGestureRecognizer *)sender {
    if (sender.direction == UISwipeGestureRecognizerDirectionDown) {
        [self.commentTextView resignFirstResponder];
        [self dismissCommentTextView];
    }
}

#pragma mark - Private Method

- (void)configure {
    //kColorLineCellSeperator fen ge line color
    self.commentTextView.layer.borderColor = UIColorFromHEX(0xA3A3A3).CGColor;
    self.commentTextView.layer.borderWidth = 0.5;
    self.commentTextView.delegate = self;
    //kColorTextTime time color
    [self.sendButton setTitleColor:UIColorFromHEX(0x838383) forState:UIControlStateNormal];
    //text color
    [self.sendButton setTitleColor:UIColorFromHEX(0x333333)
                          forState:UIControlStateHighlighted];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    UISwipeGestureRecognizer *swipeGr = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    [swipeGr setDirection:UISwipeGestureRecognizerDirectionDown];
    self.gestureRecognizers = @[tapGr, swipeGr];
    
    [self insertSubview:self.backgroundView atIndex:0];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
}

- (void)dismissCommentTextView {
    [self removeFromSuperview];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWasShown:(NSNotification *)aNotification {
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
    
    if (kbSize.height > kMininumKeyboardHeight) {
        self.containerViewConstraintHeight.constant = kCommentTextViewHeight + 20 + kbSize.height;
    } else {
        self.containerViewConstraintHeight.constant = kCommentTextViewHeight + 20 + kMininumKeyboardHeight;
    }
}

#pragma mark - Accessor

- (UIVisualEffectView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIVisualEffectView alloc] initWithFrame:CGRectMake(0, 0, cl_ScreenWidth, cl_ScreenHeight)];
        _backgroundView.backgroundColor = [UIColor blackColor];
        _backgroundView.alpha = 0.5;
        _backgroundView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    }
    return _backgroundView;
}

@end
