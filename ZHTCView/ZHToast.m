//
//  ZHToast.m
//  OBLink
//
//  Created by 王朝晖 on 2021/8/6.
//

#import "ZHToast.h"
#import <QuartzCore/QuartzCore.h>
    
// Set visibility duration
static const CGFloat kDuration = 2;


// Static toastview queue variable
static NSMutableArray *toasts;

@interface ZHToast ()

@property (nonatomic, readonly) UILabel *textLabel;

- (void)fadeToastOut;
+ (void)nextToastInView:(UIView *)parentView;

@end

@implementation ZHToast

@synthesize textLabel = _textLabel;


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - NSObject

- (id)initWithText:(NSString *)text {
    if ((self = [self initWithFrame:CGRectZero])) {
        // Add corner radius
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.6];
        self.layer.cornerRadius = 5;
        self.autoresizingMask = UIViewAutoresizingNone;
        self.autoresizesSubviews = NO;
        
        NSString *labelText = text;
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:4];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
        
        
        // Init and add label
        _textLabel = [[UILabel alloc] init];
        _textLabel.attributedText = attributedString;
        _textLabel.minimumScaleFactor = 15;
        _textLabel.font = [UIFont systemFontOfSize:15];
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.adjustsFontSizeToFitWidth = NO;
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.numberOfLines = 20;
        [_textLabel sizeToFit];
        
        [self addSubview:_textLabel];
    }    
    return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public

+ (void)toastInView:(UIView *)parentView withText:(NSString *)text {
    // Add new instance to queue
    ZHToast *view = [[ZHToast alloc] initWithText:text];
    
    CGFloat lWidth = view.textLabel.frame.size.width;
    CGFloat lHeight = view.textLabel.frame.size.height;
    CGFloat pWidth = parentView.frame.size.width;
    CGFloat pHeight = parentView.frame.size.height;
    
    CGFloat maxWidth = parentView.frame.size.width-40;
    if (lWidth > maxWidth) {
        lWidth = maxWidth;
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        [style setLineSpacing:4];
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:15], NSParagraphStyleAttributeName:style};
        CGFloat height = [text boundingRectWithSize:CGSizeMake(maxWidth, 2000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size.height;
        lHeight = height;
    }
    
    // Change toastview frame
    view.frame = CGRectMake((pWidth - lWidth - 20) / 2., pHeight - lHeight - 60, lWidth + 20, lHeight + 10);
    view.alpha = 0.0f;
    view.textLabel.frame = CGRectMake(10, 5, lWidth, lHeight);
    
    if (toasts == nil) {
        toasts = [[NSMutableArray alloc] initWithCapacity:1];
        [toasts addObject:view];
        [ZHToast nextToastInView:parentView];
    }
    else {
        [toasts addObject:view];
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private

- (void)fadeToastOut {
    // Fade in parent view
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished){
        UIView *parentView = self.superview;
        [self removeFromSuperview];
        // Remove current view from array
        [toasts removeObject:self];
        if ([toasts count] == 0) {
            toasts = nil;
        }
        else
            [ZHToast nextToastInView:parentView];
    }];
}


+ (void)nextToastInView:(UIView *)parentView {
    if ([toasts count] > 0) {
        ZHToast *view = [toasts objectAtIndex:0];
        // Fade into parent view
        [parentView addSubview:view];
        [UIView animateWithDuration:.5  delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            view.alpha = 1.0;
        } completion:^(BOOL finished){
            
        }];
        // Start timer for fade out
        [view performSelector:@selector(fadeToastOut) withObject:nil afterDelay:kDuration];
    }
}


@end
