
#ifndef cmDelegate_h
#define cmDelegate_h
#import <Foundation/Foundation.h>

@class textView;

@protocol cmDelegate <NSObject>

@optional


/**
 *  CLTextView delegate
 */
- (void)cl_textViewDidChange:(textView *)textView;
- (void)cl_textViewDidEndEditing:(textView *)textView;

@end


#endif /* cmDelegate_h */
