
* 项目仿照Timi记账，本 APP 仅用作学习

@[TOC](TIMI记账项目)
## 简单功能
### 对于tableview向上延伸部分采用了insertSubview形式：
  在tableview上用了insertSubview: atIndex:

```
 [self.tableView insertSubview:self.topInsertView atIndex:0];
```
  效果：下拉tableview可以看到延伸的topInsertView

###   添加特殊字体添加.ttf文件
        将.ttf文件拖入项目中
        在plist文件中添加Fonts provided by application数组
        在数组下添加一个item将拖入的文件名写入到value记得后缀.ttf（可以手动加.ttf）
###  获取plist文件数据
```
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"IconImgDic" ofType:@"plist"];
    NSMutableDictionary *IconDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
```
同样在使用时，利用了model进行处理：
```
    /**获取plist文件中的图片文字字典**/
    + (NSDictionary *)getIconDictionary;
    /**获取itemmodel数组 **/
    + (NSArray<ItemModel *> *)getItemDataSource;
```
从一个数组获取前20条数据组成一个新的数组：
```
    NSArray *data = [ItemModel getItemDataSource];
    self.dataArray = [data subarrayWithRange:NSMakeRange(0, 20)].mutableCopy;
```
## 计算器功能
   ### 说明
   计算器看似简单其实里面各种逻辑很是复杂我在点击自制键盘后根据点击的键位作了很多判断，具体可以查看项目中MyKeyBoardView的.m文件：
### 简单逻辑分析
    1.点击‘+’或‘-’让‘OK’变为‘=’
    2.点击‘OK’返回（这里的OK键就是OK键不能是=）
    3.点击清零将所有数值归零
    4.当进行了一次加减运算后点击‘=’号，计算出结果，这是如果再次点击数字键盘 相当于一次清零，但如果点击的是加减号，将继续保留上次计算结果在此基础上进行二次运算，直至点击清零或者OK。
    5.对于小数点的计算也比较复杂，我曾想过用数组的形式将点击的数字保留，以小数点为分割，小数点前为一个数字，后为一个数组，但考虑到当要进行计算时又会增加两个数组，这样定义的数组就会格外的多（虽然现在定义的变量也不少，介于计算后确实需要记录一些数值，但这个量也还是要比数组形式要少上许多），所以后面就没有尝试，而是将一些关键结果保存为字符串，计算时换算为CGFloat进行计算保留两位小数。

###    转场效果 
```
这里用了第三方控件：HHTransition
```
   
## 添加日历功能
### 说明
   日历功能与计算器差不多，都是看着简单其实都是逻辑别叫复杂，难点在于对NSCalendar的应用，只要能灵活使用NSCalendar想做什么样式的日历都是可以的，这里我使用单例的形式写了一个类，声明的属性是当前日期的一些信息，分别方法写了类方法和实例方法，用哪个都一样，主要获取的信息：
   
   ```
/**用作变量 这些是用作选择时做判断用**/
@property (nonatomic, assign) NSInteger selectYear;
@property (nonatomic, assign) NSInteger selectMonth;
@property (nonatomic, assign) NSInteger selectDay;
/**结束**/

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
/**当前年月**/
@property (nonatomic, strong) NSDateFormatter *formatter;

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
/**周几 周一：1 周日为：0**/
- (NSInteger)getWeekDayWithDate:(NSDate *)date;
/**获取该日期的月份的总天数**/
- (NSInteger)getMonthDaysWithDate:(NSDate *)date;

+ (NSInteger)getWeekDayWithDate:(NSDate *)date;
/**年-月**/
+ (NSString *)getDateFormatWithDate:(NSDate *)date;
/**日**/
+ (NSInteger)getDayWithDate:(NSDate *)date;
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
/**将字符串日期转换为date**/
+ (NSDate *)strToDateWithStr:(NSString *)str;
 
   ```
   写这些方法主要是根据TiMi这款记账软件，但主要的信息还是获取的差不多。另外提供一种获取日期信息的一种方案记录在QZCalendarModel里，根据achieveCalendarModelWithData获取信息数据，在这个文件里我获取了当月数组，上月数组，以及下月的数组，拼接组成了一个QZCalendarModel的数组（也是主要用作本项目）
   QZCalendarModel.m文件大体是这样的：
  ```
    @property (nonatomic, copy) NSString *day;
    /**是当前月**/
    @property (nonatomic, assign) BOOL isDateMonth;
    /**是否超过当前日期**/
    @property (nonatomic, assign) BOOL isOver;
    @property (nonatomic, assign) BOOL isToday;
    @property (nonatomic, assign) BOOL isSelected;
    /**根据日期信息获取日期数组 会有固定42条数据 **/
 + (NSArray<QZCalendarModel *> *)achieveCalendarModelWithData:(NSDate  *)date;
 ```
   利用collectionview展示出来，每次切换的时候直接给不同的date即可.
   ### 弹窗
   因为日历是以弹窗的形势存在，所以我将其放在了viewController上设置view.backgroundColor为透明，然后利用present做出了日历的弹窗，之后各位童鞋也可以尝试这种方法，感觉挺灵活的，但对于点击任意半透明区域设置隐藏视图还是碰到了一些问题，因为添加的手势会无差别执行，所以尝试了下面的操作：
```
- (BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    //这里试过这两种方法判断 但感觉都不能很好的达到目的所以尝试了下面的point
    //其一： isMemberOfClass
    //其二：isKindOfClass
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
```
暂时没做的功能：日历左右上下滑动的动画

