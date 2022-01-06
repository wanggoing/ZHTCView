//
//  ZHCollectionView.m
//  ZHdCharging
//
//  Created by 王朝晖 on 2022/1/6.
//  Copyright © 2022 王朝晖. All rights reserved.
//

#import "ZHCollectionView.h"

@interface ZHCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource>

//多少组
@property (nonatomic,copy)ZHNumberOfSectionsInCollectionViewBlock sectionBlock;
//每组的行数
@property (nonatomic,copy)ZHNumberOfItemsInCollectionViewSectionBlock rowsBlock;
//细胞
@property (nonatomic,copy)ZHCellForRowAtInCollectionViewIndexPathBlock createCell;
//点击
@property (nonatomic,copy)ZHDidSelectRowAtInCollectionViewIndexPath selectBlock;

//细胞大小
@property (nonatomic,copy)ZHSizeForItemAtIndexPath sizeBlock;
//细胞内边距
@property (nonatomic,copy)ZHInsetForSectionAtIndex insetBlock;

@end

@implementation ZHCollectionView

+ (ZHCollectionView * _Nonnull (^)(CGRect, UICollectionViewFlowLayout *))init {
    return ^(CGRect frame, UICollectionViewFlowLayout *layout){
        return [[[self class] alloc] initWithFrame:frame collectionViewLayout:layout];
    };
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor clearColor];
        
        self.dataSource = self;
        self.delegate = self;
        
        self.sectionBlock = ^NSInteger(UICollectionView * _Nonnull collectionView) {
            return 1;
        };
        self.rowsBlock = ^NSInteger(UICollectionView * _Nonnull collectionView, NSInteger section) {
            return 0;
        };
        self.createCell = ^UICollectionViewCell * _Nonnull(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            return nil;
        };
        self.selectBlock = ^(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            
        };
        self.sizeBlock = ^CGSize(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull collectionViewLayout, NSIndexPath * _Nonnull indexPath) {
            return CGSizeZero;
        };
        self.insetBlock = ^UIEdgeInsets(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull collectionViewLayout, NSInteger section) {
            return UIEdgeInsetsZero;
        };
    }
    return self;
}

//TODO: 块回调方式创建 - 不带HeaderView、FooterView
- (void)numberOfSectionsInCollectionView:(ZHNumberOfSectionsInCollectionViewBlock)section
                  numberOfItemsInSection:(ZHNumberOfItemsInCollectionViewSectionBlock)rows
                  cellForItemAtIndexPath:(ZHCellForRowAtInCollectionViewIndexPathBlock)cell
                  sizeForItemAtIndexPath:(ZHSizeForItemAtIndexPath)size
                  insetForSectionAtIndex:(ZHInsetForSectionAtIndex)inset
                 didSelectRowAtIndexPath:(ZHDidSelectRowAtInCollectionViewIndexPath)select
{
    self.sectionBlock = section;
    self.rowsBlock = rows;
    self.createCell = cell;
    self.sizeBlock = size;
    self.insetBlock = inset;
    self.selectBlock = select;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectBlock(collectionView, indexPath);
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSInteger seciton = self.sectionBlock(collectionView);
    return seciton;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger rows = self.rowsBlock(collectionView, section);
    return rows;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = self.createCell(collectionView, indexPath);
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = self.sizeBlock(collectionView, collectionViewLayout, indexPath);
    return size;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets inset = self.insetBlock(collectionView, collectionViewLayout, section);
    return inset;
}

@end
