
项目仿照Timi记账，本 APP 仅用作学习

一：对于tableview向上延伸部分采用了insertSubview形式：
    1.1   在tableview上用了insertSubview: atIndex:
        ```
            [self.tableView insertSubview:self.topInsertView atIndex:0];
        ```
        效果：下拉tableview可以看到延伸的topInsertView
   添加特殊字体添加.ttf文件
    1.2.添加"Alimama Agile VF"字体
        1.1 将.ttf文件拖入项目中
        1.2 在plist文件中添加Fonts provided by application数组
        1.3 在数组下添加一个item将拖入的文件名写入到value记得后缀.ttf（可以手动加.ttf）
二：添加计算器功能
    2.1计算器看似简单其实里面各种逻辑很是复杂我在点击自制键盘后根据点击的键位作了很多判断
    具体可以看MyKeyBoardView的.m文件：
    简单说一下：
    1.点击‘+’或‘-’让‘OK’变为‘=’
    2.点击‘OK’返回（这里的OK键就是OK键不能是=）
    3.点击清零将所有数值归零
    4.当进行了一次加减运算后点击‘=’号，计算出结果，这是如果再次点击数字键盘 相当于一次清零，但如果点击的是加减号，将继续保留上次计算结果在此基础上进行二次运算，直至点击清零或者OK。
    5.对于小数点的计算也比较复杂，我曾想过用数组的形式将点击的数字保留，以小数点为分割，小数点前为一个数字，后为一个数组，但考虑到当要进行计算时又会增加两个数组，这样定义的数组就会格外的多（虽然现在定义的变量也不少，介于计算后确实需要记录一些数值，但这个量也还是要比数组形式要少上许多），所以后面就没有尝试，而是将一些关键结果保存为字符串，计算时换算为CGFloat进行计算保留两位小数。
    2.2新加转场效果 这里用了第三方控件：HHTransition
    
三：添加日历功能
    3.1:日历功能与计算器差不多，都是看着简单其实都是逻辑别叫复杂，难点在于对NSCalendar的应用，我使用单例的形式写了一个类，声明的属性是当前日期的一些信息，分别方法写了类方法和实例方法，用哪个都一样，主要获取的信息：
    /**年月日**/
    @property (nonatomic, copy) NSString *title;
    @property (nonatomic, assign) NSInteger year;
    @property (nonatomic, assign) NSInteger month;
    @property (nonatomic, assign) NSInteger day;
    /**周一是1 周日是0**/
    @property (nonatomic, assign) NSInteger weekDay;
    /** 当月的天数 */
    @property (nonatomic, assign) NSInteger days;
    /**上个月总天数**/
    @property (nonatomic, assign) NSInteger lastMonthDays;
    方法：
    /**获取date的下个月日期*/
    - (NSDate *)nextMonthDateWithDate:(NSDate *)date;
    /** 获取date的上个月日期*/
    - (NSDate *)previousMonthDateWithDate:(NSDate *)date;
    /**年**/
    - (NSInteger)getYearWithDate:(NSDate *)date;
    /**月**/
    - (NSInteger)getMonthWithDate:(NSDate *)date;
    /**日**/
    - (NSInteger)getDayWithDate:(NSDate *)date;
    /**本月第一天为周几 周一：1 周日为：0**/
    - (NSInteger)getWeekDayWithDate:(NSDate *)date;
    /**获取该日期的月份的总天数**/
    - (NSInteger)getMonthDaysWithDate:(NSDate *)date;


    /**月**/
    + (NSInteger)getMonthWithDate:(NSDate *)date;
    /**年**/
    + (NSInteger)getYearWithDate:(NSDate *)date;
    /**获取该日期的月份的总天数**/
    + (NSInteger)getMonthDaysWithDate:(NSDate *)date;
    /**获取date的下个月日期*/
    + (NSDate *)nextMonthDateWithDate:(NSDate *)date;
    /** 获取date的上个月日期*/
    + (NSDate *)previousMonthDateWithDate:(NSDate *)date;
    /** 获取date的上年日期*/
    + (NSDate *)previousYearDateWithDate:(NSDate *)date;
    /**获取date的下一年日期*/
    + (NSDate *)nextYearDateWithDate:(NSDate *)date;
    写这些方法主要是根据TiMi这款记账软件，但主要的信息还是获取的差不多的。另外提供一种获取日期信息的一种方案记录在QZCalendarModel里，根据achieveCalendarModelWithData获取信息数据
    /**根据日期信息获取日期数组 会有固定42条数据 **/
    + (NSArray<QZCalendarModel *> *)achieveCalendarModelWithData:(NSDate *)date;
    利用collectionview展示出来，每次切换的时候直接给不同的date即可
    3.2因为日历是以弹窗的形势存在，所以我将放在了viewController上设置view.backgroundColor为透明，然后利用present做出了日历的弹窗，之后各位童鞋也可以尝试这种方法，感觉挺灵活的，但对于点击任意半透明区域设置隐藏视图还是碰到了一些问题，添加的手势会无差别执行，所以尝试了下面的操作：

- (BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    这里试过这两种方法判断 但感觉都不能很好的达到目的所以尝试了下面的point
    //isMemberOfClass
    //if ([touch.view isKindOfClass:[UITextFieldclass]])
    //{
      // return NO;
    //}
    CGPoint point = [touch locationInView:self.view];
    if (point.y > self.view.height - 8 * 40 - SAFEBOTTOMHEIGHT) {
        return NO;
    } else {
        return YES;
    }
    
}

暂时没做的功能：日历左右上下滑动的动画
