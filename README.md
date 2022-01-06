# ZHTCView
这是一个使用Block替换代理的UITableview &amp; UICollectionView。
### TableView使用方法如下：

#### 不带HeaderFooterView
```
ZHTableView *tableView = ZHTableView.init(CGRectMake(0, 0, 0, 0), UITableViewStylePlain);
[tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
[tableView numberOfRowsInSection:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
	return 1;
} heightForRowAtIndexPath:^NSInteger(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
	return 40;
} cellForRowAtIndexPath:^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableView"];
	return cell;
} didSelectRowAtIndexPath:^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
	
}];
[self.view addSubview:tableView];
```
#### 带HeaderFooterView
```
ZHTableView *tableView = ZHTableView.init(CGRectMake(0, 0, 0, 0), UITableViewStyleGrouped);
[tableView numberOfSectionsIn:^NSInteger(UITableView * _Nonnull tableView) {
	return 1;
} numberOfRowsInSection:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
	return 1;
} headerFooter:^ZHTableViewHeaderFooterObject * _Nullable(UITableView * _Nonnull tableView, NSInteger section, BOOL isHeader) {
	ZHTableViewHeaderFooterObject *obj = [[ZHTableViewHeaderFooterObject alloc] init];
	obj.view = nil;
	obj.height = 0.f;
	return obj;
} heightForRowAtIndexPath:^NSInteger(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
	return 40;
} cellForRowAtIndexPath:^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableView"];
	return cell;
} didSelectRowAtIndexPath:^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        
}];
[self.view addSubview:tableView];
```
## ZHTCView 使用 MIT 许可证，详情见 LICENSE 文件。