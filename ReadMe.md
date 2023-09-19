
项目仿照Timi记账，本 APP 仅用作学习

一：首页
    1.1   在tableview上用了insertSubview: atIndex:
        ```
            [self.tableView insertSubview:self.topInsertView atIndex:0];
        ```
        效果：下拉tableview可以看到延伸的topInsertView

    1.2.添加"Alimama Agile VF"字体
        1.1 将.ttf文件拖入项目中
        1.2 在plist文件中添加Fonts provided by application数组
        1.3 在数组下添加一个item将拖入的文件名写入到value记得后缀.ttf

解决手势冲突：
要遵循手势代理
- (BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UITextFieldclass]])

    {

       return NO;

    }
}
