//
//  SecondViewController.m
//  FeedsAPP
//
//  Created by Yueyue on 2019/5/11.
//  Copyright © 2019 iosGroup. All rights reserved.
//

#import "SecondViewController.h"
#import "UserModel.h"
#import "TableViewCell.h"

@interface SecondViewController (){
    NSMutableArray *tableData;  //tableView数据存放数组
}

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    tableData = [[NSMutableArray alloc] init];
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initTableView];
    [self createUserData];
    //[self initDataSource];
}

//初始化tableView;
-(void)initTableView{
    CGRect frame = self.view.frame;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    //代理类
    _tableView.delegate = self;
    //数据源
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
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
    
    [tableData addObject:user];
    [tableData addObject:user2];
    [tableData addObject:user3];
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableData count];
}

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
