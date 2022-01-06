//
//  ZHCollectionView.h
//  ZHdCharging
//
//  Created by 王朝晖 on 2022/1/6.
//  Copyright © 2022 王朝晖. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 组
typedef NSInteger(^ZHNumberOfSectionsInCollectionViewBlock)(UICollectionView *collectionView);
// 每组行数
typedef NSInteger(^ZHNumberOfItemsInCollectionViewSectionBlock)(UICollectionView *collectionView, NSInteger section);
// 细胞
typedef UICollectionViewCell *_Nonnull(^ZHCellForRowAtInCollectionViewIndexPathBlock)(UICollectionView *collectionView,NSIndexPath *indexPath);
// 点击细胞
typedef void(^ZHDidSelectRowAtInCollectionViewIndexPath)(UICollectionView *collectionView, NSIndexPath *indexPath);

// 细胞大小
typedef CGSize(^ZHSizeForItemAtIndexPath)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSIndexPath *indexPath);
// 细胞内边距
typedef UIEdgeInsets(^ZHInsetForSectionAtIndex)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section);

@interface ZHCollectionView : UICollectionView

+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)init __attribute__((unavailable("init Method not available,Please use +")));
- (instancetype)initWithCoder:(NSCoder *)coder __attribute__((unavailable("init Method not available,Please use +")));
- (instancetype)initWithFrame:(CGRect)frame __attribute__((unavailable("init Method not available,Please use +")));
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style __attribute__((unavailable("init Method not available,Please use +")));


+ (ZHCollectionView * _Nonnull (^)(CGRect, UICollectionViewFlowLayout *))init;

//TODO: 块回调方式创建 - 不带HeaderView、FooterView
- (void)numberOfSectionsInCollectionView:(ZHNumberOfSectionsInCollectionViewBlock)section
                  numberOfItemsInSection:(ZHNumberOfItemsInCollectionViewSectionBlock)rows
                  cellForItemAtIndexPath:(ZHCellForRowAtInCollectionViewIndexPathBlock)cell
                  sizeForItemAtIndexPath:(ZHSizeForItemAtIndexPath)size
                  insetForSectionAtIndex:(ZHInsetForSectionAtIndex)inset
                 didSelectRowAtIndexPath:(ZHDidSelectRowAtInCollectionViewIndexPath)select;

@end

NS_ASSUME_NONNULL_END
