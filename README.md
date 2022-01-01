# ZHTCView
这是一个使用Block替换代理的UITableview &amp; UICollectionView。
## 使用方法如下：

```
- (DSTableView *)tableView {
    if (!_tableView) {
        _tableView = DSTableView.init(CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), UITableViewStyleGrouped);
    }
    return _tableView;
}
```
```
[_tableView numberOfSectionsIn:^NSInteger(UITableView * _Nonnull tableView) {
	return 1;
} numberOfRowsInSection:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
	return 0;
} headerFooter:^DSTableViewHeaderFooterObject * _Nullable(UITableView * _Nonnull tableView, NSInteger section, BOOL isHeader) {
	DSTableViewHeaderFooterObject *obj = [[DSTableViewHeaderFooterObject alloc] init];
	return obj;
} heightForRowAtIndexPath:^NSInteger(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
	return 40;
} cellForRowAtIndexPath:^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
	UITableViewCell *cell = [UITableViewCell alloc] init...
	return cell;
} didSelectRowAtIndexPath:^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
	// didSelectRowAtIndexPath
}];
```
