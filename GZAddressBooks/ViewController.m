//
//  ViewController.m
//  GZAddressBooks
//
//  Created by xinshijie on 16/7/26.
//  Copyright © 2016年 Mr.quan. All rights reserved.
//
/*
 *********************************************************************************
 *
 *  QQ    : 3139726292
 * 新浪微博 : 轻斟浅醉17
 * Email  : 3139726292@qq.com
 * GitHub : https://github.com/Gang679
 * 博客园  : http://www.cnblogs.com/Gang679/
 * 博客    : http://gang679.blog.163.com
 *********************************************************************************
 */
#import "ViewController.h"
#import "ZYPinYinSearch.h"
#import "ChineseString.h"
#import "FollwTableViewCell.h"


@interface ViewController ()<UISearchResultsUpdating>


@property (strong, nonatomic) UISearchController *searchController;
@property (nonatomic , strong)UITableView *tableView ;
@property (strong, nonatomic) NSArray *dataSource;/**<排序前的整个数据源*/
@property (strong, nonatomic) NSArray *allDataSource;/**<排序后的整个数据源*/
@property (strong, nonatomic) NSMutableArray *searchDataSource;/**<搜索结果数据源*/
@property (strong, nonatomic) NSArray *indexDataSource;/**<索引数据源*/

@property (nonatomic ,strong) NSArray *ArrayIm;

@end

@implementation ViewController

- (void)viewWillDisappear:(BOOL)animated{
    self.tableView.hidden = NO ;
    [super viewWillDisappear:YES];
    _searchController.active = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
    self.navigationItem.title = @"关注";
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    [self initData];
    
}

#pragma mark - Init
- (void)initData {
    _ArrayIm = @[@"01",@"02",@"03",@"04",@"05",@"02",@"03",@"04",@"05",@"02",@"03",@"04",@"05",@"02",@"03",@"04",@"05"];
    
    _dataSource = @[@"成龙",@"梁山伯",@"Angel",@"长江1号",@"星爷",@"911",@"520ok",@"ren",@"++family",@"中english9%+",@"武松",@"齐天大圣",@"曹操",@"林黛玉",@"Bob",@"夏勒特",@"神雕侠"];
    
    _searchDataSource = [NSMutableArray new];
    //获取索引的首字母
    _indexDataSource = [ChineseString IndexArray:_dataSource];
    //对原数据进行排序重新分组
    _allDataSource = [ChineseString LetterSortArray:_dataSource];
}

- (UISearchController *)searchController {
    if (!_searchController) {
        _searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        _searchController.dimsBackgroundDuringPresentation = NO;
        _searchController.hidesNavigationBarDuringPresentation = YES;
        _searchController.searchBar.placeholder = @"搜索";
        [_searchController.searchBar sizeToFit];
    }
    return _searchController;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (!self.searchController.active) {
        return _indexDataSource.count;
    }else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!self.searchController.active) {
        return [_allDataSource[section] count];
    }else {
        return _searchDataSource.count;
    }
}
//头部索引标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (!self.searchController.active) {
        return _indexDataSource[section];
    }else {
        return nil;
    }
}
//右侧索引列表
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    if (!self.searchController.active) {
        return _indexDataSource;
    }else {
        return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //系统自带
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    if (!self.searchController.active) {
        
        cell.textLabel.text = _allDataSource[indexPath.section][indexPath.row];
        
    }else{
        cell.textLabel.text = _searchDataSource[indexPath.row];
    }
    return cell;
    
}
//索引点击事件
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    return index;
}

#pragma mark - UISearchDelegate
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [_searchDataSource removeAllObjects];
    
    NSArray *ary = [ZYPinYinSearch searchWithOriginalArray:_dataSource andSearchText:searchController.searchBar.text andSearchByPropertyName:@"name"];
    if (searchController.searchBar.text.length == 0) {
        [_searchDataSource addObjectsFromArray:_dataSource];
    }else {
        [_searchDataSource addObjectsFromArray:ary];
    }
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@",cell.textLabel.text);
}
// 懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
        self.tableView.delegate = self ;
        self.tableView.dataSource = self ;
        [self.view addSubview:_tableView];
    }
    return _tableView ;
}

@end
