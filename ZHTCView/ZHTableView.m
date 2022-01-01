//
//  ZHTableView.m
//  ZHTCView
//
//  Created by 王朝晖 on 2022/1/1.
//

#import "ZHTableView.h"

@interface ZHTableView () <UITableViewDelegate, UITableViewDataSource>

//多少组
@property (nonatomic,copy)ZHNumberOfSectionsInBlock sectionBlock;
//每组 头/脚
@property (nonatomic,copy)ZHTableViewHeaderFooterBlock headerFooterBlock;
//每组的行数
@property (nonatomic,copy)ZHNumberOfRowsInSectionBlock rowsBlock;
//每组行高
@property (nonatomic,copy)ZHHeightForRowAtIndexPathBlock heightBlock;

//声明自定义类型变量
@property (nonatomic,copy)ZHCellForRowAtIndexPathBlock createCell;
//声明自定义类型变量
@property (nonatomic,copy)ZHDidSelectRowAtIndexPath selectBlock;

@end

@implementation ZHTableView

+ (ZHTableView * _Nonnull (^)(CGRect, UITableViewStyle))init {
    return ^(CGRect frame, UITableViewStyle style){
        return [[[self class] alloc] initWithFrame:frame style:style];
    };
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        self.dataSource = self;
        self.delegate = self;
        
        if (@available(iOS 15.0, *)) {
            self.sectionHeaderTopPadding = 0;
        }
        
        self.sectionBlock = ^NSInteger(UITableView * _Nonnull tableView) {
            return 1;
        };
        self.headerFooterBlock = ^ZHTableViewHeaderFooterObject * _Nullable(UITableView * _Nonnull tableView, NSInteger section, BOOL isHeader) {
            ZHTableViewHeaderFooterObject *obj = [ZHTableViewHeaderFooterObject new];
            obj.height = .0f;
            obj.view = nil;
            return obj;
        };
        self.rowsBlock = ^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
            return 0;
        };
        self.heightBlock = ^NSInteger(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
            return 44;
        };
        self.createCell = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
            return nil;
        };
        self.selectBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
            
        };
    }
    return self;
}

- (void)numberOfRowsInSection:(ZHNumberOfRowsInSectionBlock)rows
      heightForRowAtIndexPath:(ZHHeightForRowAtIndexPathBlock)height
        cellForRowAtIndexPath:(ZHCellForRowAtIndexPathBlock)cell
      didSelectRowAtIndexPath:(ZHDidSelectRowAtIndexPath)select
{
    self.rowsBlock = rows;
    self.heightBlock = height;
    self.createCell = cell;
    self.selectBlock = select;
}

- (void)numberOfSectionsIn:(ZHNumberOfSectionsInBlock)section
     numberOfRowsInSection:(ZHNumberOfRowsInSectionBlock)rows
              headerFooter:(ZHTableViewHeaderFooterBlock)headerFooter
   heightForRowAtIndexPath:(ZHHeightForRowAtIndexPathBlock)height
     cellForRowAtIndexPath:(ZHCellForRowAtIndexPathBlock)cell
   didSelectRowAtIndexPath:(ZHDidSelectRowAtIndexPath)select;
{
    self.sectionBlock = section;
    self.headerFooterBlock = headerFooter;
    self.rowsBlock = rows;
    self.heightBlock = height;
    self.createCell = cell;
    self.selectBlock = select;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger seciton = self.sectionBlock(tableView);
    return seciton;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    ZHTableViewHeaderFooterObject *object = self.headerFooterBlock(tableView, section, YES);
    return object.height;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ZHTableViewHeaderFooterObject *object = self.headerFooterBlock(tableView, section, YES);
    return object.view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    ZHTableViewHeaderFooterObject *object = self.headerFooterBlock(tableView, section, NO);
    return object.height;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    ZHTableViewHeaderFooterObject *object = self.headerFooterBlock(tableView, section, NO);
    return object.view;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = self.rowsBlock(tableView, section);
    return rows;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = self.heightBlock(tableView, indexPath);
    return height;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = self.createCell(tableView,indexPath);
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectBlock(tableView, indexPath);
}

@end


@implementation ZHTableViewHeaderFooterObject

- (instancetype)init {
    if (self = [super init]) {
        self.view = nil;
        self.height = 0.f;
    }
    return self;
}

@end
