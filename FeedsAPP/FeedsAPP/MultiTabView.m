
//
//  MultiTabView.m
//  FeedsAPP
//
//  Created by Yueyue on 2019/5/11.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "MultiTabView.h"
#import "MultiTabCell.h"
#import "UserModel.h"
#import "TableViewCell.h"

#define TABHEIGHT 50

@interface MultiTabView()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate> {
    NSMutableArray *tableData;  //tableView数据存放数组
}
//整个视图的大小
@property (assign) CGRect mViewFrame;
//顶部的整体view
@property (strong, nonatomic) UIView *topMainView;
//顶部的ScrollView
@property (strong, nonatomic) UIScrollView *topScrollView;
//顶部的按钮数组
@property (strong, nonatomic) NSMutableArray *topViews;
//顶部按钮的数据源
@property (strong, nonatomic) NSMutableArray *tabData;
//顶部滑动指示条
@property (strong, nonatomic) UIView *indicateView;
//下方的ScrollView
@property (strong, nonatomic) UIScrollView *scrollView;
//下方的表格数组
@property (strong, nonatomic) NSMutableArray *scrollTableViews;
//TableViews的数据源
@property (strong, nonatomic) NSMutableArray *dataSource;
//当前选中页数
@property (assign) NSInteger currentPage;

@end

@implementation MultiTabView

-(instancetype)initWithFrame:(CGRect)frame WithCount: (NSInteger) count{
    self = [super initWithFrame:frame];
    
    if (self) {
        _mViewFrame = frame;
        _numOfTabs = count;
        _topViews = [[NSMutableArray alloc] init];
        _scrollTableViews = [[NSMutableArray alloc] init];
        
        //[self initDataSource];
        
        [self createUserData];
        
        [self initScrollView];
        
        [self initTopTabs];
        
        [self initIndicateView];
        
        [self initDownTables];
        
        
    }
    
    return self;
}

#pragma mark -- 初始化表格的数据源
-(void) initDataSource{
    _dataSource = [[NSMutableArray alloc] initWithCapacity:_numOfTabs];
    
    for (int i = 1; i <= _numOfTabs; i ++) {
        
        NSMutableArray *tempArray  = [[NSMutableArray alloc] initWithCapacity:20];
        
        for (int j = 1; j <= 20; j ++) {
            
            NSString *tempStr = [NSString stringWithFormat:@"第%d个TableView的第%d条数据。", i, j];
            [tempArray addObject:tempStr];
        }
        
        [_dataSource addObject:tempArray];
    }
}

#pragma mark -- 实例化顶部的tab
-(void) initTopTabs{
    CGFloat width;
    
    if(self.numOfTabs <=6){
        width = _mViewFrame.size.width / self.numOfTabs;
    }
    else{
        width = _mViewFrame.size.width / 6;
    }
    
    _topMainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _mViewFrame.size.width, TABHEIGHT)];
    
    _topScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _mViewFrame.size.width, TABHEIGHT-3)];
    //显示水平滚动条
    _topScrollView.showsHorizontalScrollIndicator = NO;
    _topScrollView.showsVerticalScrollIndicator = YES;
    _topScrollView.bounces = NO;
    _topScrollView.delegate = self;
    //设置显示内容的宽度
    if (_numOfTabs >= 6) {
        _topScrollView.contentSize = CGSizeMake(width * _numOfTabs, TABHEIGHT);
        
    } else {
        _topScrollView.contentSize = CGSizeMake(_mViewFrame.size.width, TABHEIGHT);
    }
    
    [self addSubview:_topMainView];
    [_topMainView addSubview:_topScrollView];
    
    //设置多个Tab按钮
    _tabData = [[NSMutableArray alloc]init];
    [_tabData addObjectsFromArray:@[@"推荐", @"热点", @"社会", @"娱乐", @"科技", @"汽车"]];
    for (int i = 0; i < _numOfTabs; i ++) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * width, 0, width, TABHEIGHT)];
        
        view.backgroundColor = [UIColor whiteColor];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width, TABHEIGHT)];
        button.tag = i;
        [button setTitle:_tabData[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(tabButton:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
        
        
        [_topViews addObject:view];
        [_topScrollView addSubview:view];
    }
}

#pragma mark -- 初始化顶部的指示条View
-(void) initIndicateView{
    
    CGFloat width;
    
    if(self.numOfTabs <= 6){
        width = _mViewFrame.size.width / self.numOfTabs;
    }
    else {
        width = _mViewFrame.size.width / 6;
    }
    
    _indicateView = [[UIView alloc] initWithFrame:CGRectMake(width/4, TABHEIGHT - 3, width/2, 3)];
    [_indicateView setBackgroundColor:[UIColor redColor]];
    [_topMainView addSubview:_indicateView];
}

#pragma mark --点击顶部的按钮所触发的方法
-(void) tabButton: (id) sender{
    UIButton *button = sender;
    [_scrollView setContentOffset:CGPointMake(button.tag * _mViewFrame.size.width, 0) animated:YES];
}

#pragma mark -- 实例化下方的ScrollView
-(void) initScrollView{
    //设置起点和宽高
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _mViewFrame.origin.y, _mViewFrame.size.width, _mViewFrame.size.height - TABHEIGHT)];
    _scrollView.contentSize = CGSizeMake(_mViewFrame.size.width * _numOfTabs, _mViewFrame.size.height - 60);
    
    _scrollView.pagingEnabled = YES;
    
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
}

#pragma mark --初始化下方的TableViews
-(void) initDownTables{
    
    for (int i = 0; i < 2; i ++) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(i * _mViewFrame.size.width, 0, _mViewFrame.size.width, _mViewFrame.size.height - TABHEIGHT)];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tag = i;
        
        [_scrollTableViews addObject:tableView];
        [_scrollView addSubview:tableView];
    }
    
}


#pragma mark --根据scrollView的滚动位置复用tableView
-(void) updateTableWithPageNumber: (NSUInteger) pageNumber{
    
    [self changeTabColorWithPage:pageNumber];
    
    int tabviewTag = pageNumber % 2;
    
    CGRect tableNewFrame = CGRectMake(pageNumber * _mViewFrame.size.width, 0, _mViewFrame.size.width, _mViewFrame.size.height - TABHEIGHT);
    
    UITableView *reuseTableView = _scrollTableViews[tabviewTag];
    reuseTableView.frame = tableNewFrame;
    [reuseTableView reloadData];
}


- (void) changeTabColorWithPage: (NSInteger) currentPage {
    for (int i = 0; i < _topViews.count; i ++) {
        UIView *tempView = _topViews[i];
        
        UIButton *button = [tempView subviews][0];
        if (i == currentPage) {
            [button setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
        }
        else{
            [button setFont:[UIFont fontWithName:@"Helvetica-Normal" size:20]];
        }
    }
}


#pragma mark -- scrollView的代理方法

-(void) modifyTopScrollViewPositiong: (UIScrollView *) scrollView{
    if ([_topScrollView isEqual:scrollView]) {
        CGFloat contentOffsetX = _topScrollView.contentOffset.x;
        
        CGFloat width = _indicateView.frame.size.width;
        
        int count = (int)contentOffsetX/(int)width;
        
        CGFloat step = (int)contentOffsetX%(int)width;
        
        CGFloat sumStep = width * count;
        
        if (step > width/2) {
            
            sumStep = width * (count + 1);
            
        }
        
        [_topScrollView setContentOffset:CGPointMake(sumStep, 0) animated:YES];
        return;
    }
    
}

//拖拽后调用的方法
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //[self modifyTopScrollViewPositiong:scrollView];
}



-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self scrollViewDidEndDecelerating:scrollView];
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView

{
    if ([scrollView isEqual:_scrollView]) {
        _currentPage = _scrollView.contentOffset.x/_mViewFrame.size.width;
        
        //    UITableView *currentTable = _scrollTableViews[_currentPage];
        //    [currentTable reloadData];
        
        [self updateTableWithPageNumber:_currentPage];
        
        return;
    }
    [self modifyTopScrollViewPositiong:scrollView];
}

#pragma mark -- 滑动时改变指示器的位置
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([_scrollView isEqual:scrollView]) {
        CGRect frame = _indicateView.frame;
        CGFloat width;
        
        if (self.numOfTabs <= 6) {
            width = _mViewFrame.size.width / self.numOfTabs;
            frame.origin.x = scrollView.contentOffset.x/_numOfTabs + width/4;
        } else {
            width = _mViewFrame.size.width / 6;
            frame.origin.x = scrollView.contentOffset.x/6 + width/4;
            
        }
        
        _indicateView.frame = frame;
    }
    
}


#pragma mark -- tableView的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableData count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

/*-(UITableViewCell *)tableView:tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 注册MultiTabCell.xib
    BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib=[UINib nibWithNibName:@"MultiTabCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:@"MultiTabCell"];
        nibsRegistered=YES;
    }
    
    //设置数据
    MultiTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MultiTabCell"];
    if ([tableView isEqual:_scrollTableViews[_currentPage%2]]) {
        cell.title.text = _dataSource[_currentPage][indexPath.row];
    }
    
    return cell;
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //指定cellIdentifier为自定义的cell
    static NSString *CellIdentifier = @"Cell";
    //自定义cell类
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithReuseIdentifier:CellIdentifier];
    }
    UserModel *user = [tableData objectAtIndex:indexPath.row];
    cell.name.text = user.username;
    [cell.userImage setImage:[UIImage imageNamed:user.imagePath]];
    [cell setIntroductionText:user.introduction];
    return cell;
}

//测试数据
-(void)createUserData{
    tableData = [[NSMutableArray alloc] init];
    UserModel *user = [[UserModel alloc] init];
    [user setUsername:@"多啦A梦"];
    [user setIntroduction:@"我是多啦A梦!!\n我是大雄的好盆友！\n"];
    [user setImagePath:@"1@2x.png"];
    
    UserModel *user2 = [[UserModel alloc] init];
    [user2 setUsername:@"野比大雄"];
    [user2 setIntroduction:@"野比大雄，简称大雄。\n\n大雄性子懦弱，胆小怕事，丢三落四。优点是有责任心，善良正直。是一个“为别人的不幸而伤心，会祈求别人幸福的人”。哆啦A梦即是由野比大雄的玄孙野比世修派来帮助他、挖掘他的潜质，扭转他不幸的命运的。"];
    [user2 setImagePath:@"2.jpg"];
    //[user2 setImagePath:@"duolaameng.jpg"];
    
    UserModel *user3 = [[UserModel alloc] init];
    [user3 setUsername:@"胖虎"];
    [user3 setIntroduction:@"我看你就是想为难我胖虎！！"];
    [user3 setImagePath:@"3.jpg"];
    //[user3 setImagePath:@"daxiong.jpg"];
    
    UserModel *user4 = [[UserModel alloc] init];
    [user4 setUsername:@"小猪佩奇"];
    [user4 setIntroduction:@"小猪佩奇是一个可爱的小猪。她已经四岁了，与她的妈妈、爸爸和弟弟乔治生活在一起。佩奇最喜欢做的事情是玩游戏，把自己打扮得漂漂亮亮的，去度假，以及在泥坑里快乐的跳上跳下。"];
    [user4 setImagePath:@"4.jpg"];
    
    UserModel *user5 = [[UserModel alloc] init];
    [user5 setUsername:@"木之本樱"];
    [user5 setIntroduction:@"4月1日出生，A型，喜欢的科目是音乐和体育，不喜欢的科目是算数。是个元气满满的女孩。在封印之兽——小可的引导下，成为了收复牌的“魔卡捕获者”。"];
    [user5 setImagePath:@"5.jpg"];
    
    UserModel *user6 = [[UserModel alloc] init];
    [user6 setUsername:@"小可（可鲁贝洛斯）"];
    [user6 setIntroduction:@"守护库洛牌之书的“封印之兽”。由于魔力不足的关系，成为了一个玩偶的模样。说话是大阪腔，非常喜欢甜食。"];
    [user6 setImagePath:@"6.jpg"];
    
    
    [tableData addObject:user];
    [tableData addObject:user2];
    [tableData addObject:user3];
    //[tableData addObject:text1];
    [tableData addObject:user4];
    [tableData addObject:user5];
    [tableData addObject:user6];
}


- (void)didReceiveMemoryWarning
{
    //[super didReceiveMemoryWarning];
}


@end
