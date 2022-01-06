//
//  ZHTableView.h
//  ZHTCView
//
//  Created by 王朝晖 on 2022/1/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZHTableViewHeaderFooterObject;

// 组
typedef NSInteger(^ZHNumberOfSectionsInBlock)(UITableView *tableView);
// 每组 头/脚
typedef ZHTableViewHeaderFooterObject *_Nullable(^ZHTableViewHeaderFooterBlock)(UITableView *tableView, NSInteger section, BOOL isHeader);
// 每组行数
typedef NSInteger(^ZHNumberOfRowsInSectionBlock)(UITableView *tableView, NSInteger section);
// 每组行高
typedef NSInteger(^ZHHeightForRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
// 细胞
typedef UITableViewCell *_Nonnull(^ZHCellForRowAtIndexPathBlock)(UITableView *tableView,NSIndexPath *indexPath);
// 点击细胞
typedef void(^ZHDidSelectRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);

@interface ZHTableView : UITableView

+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)init __attribute__((unavailable("init Method not available,Please use +")));
- (instancetype)initWithCoder:(NSCoder *)coder __attribute__((unavailable("init Method not available,Please use +")));
- (instancetype)initWithFrame:(CGRect)frame __attribute__((unavailable("init Method not available,Please use +")));
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style __attribute__((unavailable("init Method not available,Please use +")));


+ (ZHTableView * _Nonnull (^)(CGRect rect, UITableViewStyle style))init;

//TODO: 块回调方式创建 - 不带HeaderView、FooterView
- (void)numberOfRowsInSection:(ZHNumberOfRowsInSectionBlock)rows
      heightForRowAtIndexPath:(ZHHeightForRowAtIndexPathBlock)height
        cellForRowAtIndexPath:(ZHCellForRowAtIndexPathBlock)cell
      didSelectRowAtIndexPath:(ZHDidSelectRowAtIndexPath)select;

//TODO: 块回调方式创建 - 带HeaderView、FooterView
- (void)numberOfSectionsIn:(ZHNumberOfSectionsInBlock)section
     numberOfRowsInSection:(ZHNumberOfRowsInSectionBlock)rows
              headerFooter:(ZHTableViewHeaderFooterBlock)headerFooter
   heightForRowAtIndexPath:(ZHHeightForRowAtIndexPathBlock)height
     cellForRowAtIndexPath:(ZHCellForRowAtIndexPathBlock)cell
   didSelectRowAtIndexPath:(ZHDidSelectRowAtIndexPath)select;

@end

@interface ZHTableViewHeaderFooterObject : NSObject

@property (nonatomic,assign) CGFloat height;
@property (nonatomic,strong) UIView *_Nullable view;

@end

NS_ASSUME_NONNULL_END
