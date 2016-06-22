//
//  ViewController.m
//  文明嘉兴
//
//  Created by dc003 on 16/6/4.
//  Copyright © 2016年 dc003. All rights reserved.
//


#import "MBProgressHUD.h"
#import "NewsViewController.h"
@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate,MBProgressHUDDelegate>{
    int num;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *newsArr;
@property(nonatomic,strong)NSArray *bannerArr;
@property(nonatomic,strong)UIRefreshControl *ctrl;
@property(nonatomic,strong)SDCycleScrollView *scrollView;
@property(nonatomic,strong)UIView *tableHeaderView;
@property(nonatomic,strong)MBProgressHUD *hub;

@end

@implementation NewsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _hub=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hub.label.text=@"数据加载中...";
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"Cell"];
    NSNotificationCenter *center=[NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(getDatabyNews:) name:@"notification" object:nil];
    [center addObserver:self selector:@selector(getDatabyBnaner:) name:@"bannerNotification" object:nil];

    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        num=1;
        [News refreshNewsWithNum:num];
    }];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        ++num;
        [News refreshNewsWithNum:num];
    }];
}
-(void)getDatabyNews:(NSNotification *)notification{
    [self.hub hideAnimated:YES];
    if (num==1) {
        self.newsArr=[NSMutableArray array];
    }
    if ([notification.object isKindOfClass:[NSArray class]]) {
        [self.newsArr addObjectsFromArray:notification.object];
    }
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}
-(void)getDatabyBnaner:(NSNotification *)notification{
    self.bannerArr=notification.object;
    NSMutableArray *images=[NSMutableArray array];
    NSMutableArray *titles=[NSMutableArray array];
    for (int i=0; i<5; i++) {
        News *banner=self.bannerArr[i];
        [images addObject:banner.imageurl];
        [titles addObject:banner.title];
    }
    self.tableView.tableHeaderView=self.tableHeaderView;
    self.scrollView.imageURLStringsGroup=images;
    self.scrollView.titlesGroup=titles;
}
-(UIView *)tableHeaderView{
    if(_tableHeaderView){
        return _tableHeaderView;
    }
    _tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 202)];
    return _tableHeaderView;
}
-(SDCycleScrollView *)scrollView{
    if (_scrollView==nil) {
        _scrollView=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(8, 0, 359, 202) delegate:self placeholderImage:[UIImage imageNamed:@"123"]];
    }
    _scrollView.pageControlAliment=SDCycleScrollViewPageContolAlimentRight;
    [self.tableHeaderView addSubview:_scrollView];
    return _scrollView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    self.tableView.rowHeight=80;
    return self.newsArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    News * news=self.newsArr[indexPath.row];
    [cell.newsImage setImageWithURL:[NSURL URLWithString:news.image] placeholderImage:[UIImage imageNamed:@"123"]];
    cell.title.text=news.title;
    cell.source.text=news.source;
    cell.zan.text=[NSString stringWithFormat:@"%@",news.praiseNum];
    cell.browseNum.text=[NSString stringWithFormat:@"%@",news.browseNum];
    return cell;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"notification" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"sa");
//    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController *one=[story instantiateViewControllerWithIdentifier:@"oneViewController"];
    [self performSegueWithIdentifier:@"oneViewController" sender:self];
    
//    [self.navigationController addChildViewController:oneViewController];
//    [self.navigationController pushViewController:one animated:YES];
}
@end
