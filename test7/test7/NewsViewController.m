//
//  ViewController.m
//  test3
//
//  Created by canglong on 2025/5/7.
//

#import "NewsViewController.h"
#import "MyCustomAlertView.h"
#import "loader/ListLoader.h"
#import "loader/ListItemBean.h"
#import "util/ALScreen.h"

@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate,NewsTableViewCellDelegate>
@property (nonatomic,strong,readwrite) UITableView *tableView;
@property (nonatomic,strong,readwrite) NSMutableArray<ListItemBean *> *dataArray;
@property (nonatomic,strong,readwrite) ListLoader    *listLoader;



@end

@implementation NewsViewController

-(instancetype) init{
    self =[super init];
    if(self){
        _dataArray =@[].mutableCopy;
    }
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView * uiTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    uiTableView.dataSource = self;
    uiTableView.delegate = self;
    self.tableView = uiTableView;
    [self.view addSubview:uiTableView];
    self.listLoader = [[ListLoader alloc] init];
    [self.listLoader loadData:^(NSArray<ListItemBean *> * _Nullable items) {
        self.dataArray = [items mutableCopy];
        [self.tableView reloadData];
    }];
    
    NSString  *directory = NSHomeDirectory();
    NSLog(@"directory:%@",directory);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"paths.count:%ld",paths.count);
    for (NSInteger i =0; i<paths.count; i++) {
        NSLog(@"path:%@",paths[i]);
    }
    
    NSString * documentPath = paths[0];
    NSString *testPath = [documentPath stringByAppendingPathComponent:@"test"];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    NSString *testFilePath = [testPath stringByAppendingPathComponent:@"testFile.txt"];
    
    NSLog(@"%d , %f , %f --- %ld",IS_LANDSCAPE,SCREEN_WIDTH,SCREEN_HEIGHT,UI(100));

    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:@"id"];
        cell.delegate = self;
//        NSLog(@"new cell:%@ %@ ",@(indexPath.section),@(indexPath.row));
    }
    long i  = indexPath.row;
    ListItemBean *itemBean =  self.dataArray[i];
    [cell setDataAndLayout:itemBean];

    return  cell;
}

#pragma mark - UITableViewDelegate
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UILabel * label  = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
//    label.text =@"section header";
    return  nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didSelectRowAtIndexPath:%@ %@ ",@(indexPath.section),@(indexPath.row));
    [self pushController];
}

-(void) pushController{
    NSLog(@"pushController ");
    WebViewController * detail = [[WebViewController alloc] init];
    detail.navigationItem.title=@"second";
    [self.navigationController pushViewController:detail animated:YES];
    
}
-(void) viewClick{
    NSLog(@"view click");
}

#pragma mark - NewsTableViewCellDelegate
- (void)newsTableViewCellDidClickDelete:(NewsTableViewCell *)cell item:(ListItemBean *) itemBean{
    NSLog(@"onclick del %@",itemBean.title);
}
- (void)newsTableViewCellDidClickItem:(NewsTableViewCell *)cell item:(ListItemBean *) itemBean{
    NSLog(@"onclick item %@",itemBean.title);
    WebViewController * detail = [[WebViewController alloc] initWithNSUrlString:itemBean.url];
    detail.navigationItem.title=itemBean.title;
    [self.navigationController pushViewController:detail animated:YES];
    
}
@end



