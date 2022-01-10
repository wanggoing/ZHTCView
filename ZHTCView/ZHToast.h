//
//  ZHToast.h
//  OBLink
//
//  Created by 王朝晖 on 2021/8/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHToast : UIView{
@private
    UILabel *_textLabel;
}

+ (void)toastInView:(UIView *)parentView withText:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
