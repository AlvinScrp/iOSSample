//
//  GoodsListViewController.m
//  test7
//
//  Created by canglong on 2025/6/3.
//

#import "GoodsListViewController.h"
#import "GoodsListViewModel.h"
#import "GoodsListItemCell.h"
#import "ALScreen.h"
#import "UIColor+CLCategory.h"
#import <Toast/Toast.h>
#import "MJRefresh.h"
#import "CLUtilIndex.h"

@interface GoodsListViewController ()<GoodsListViewModelDelegate, UICollectionViewDelegateFlowLayout,IGoodsListItemCellDelegate>
@property (nonatomic,strong) GoodsListViewModel * vm;
@property (nonatomic,strong) UIView * titleBar;
@property (nonatomic, strong) UICollectionView *collectionView;
//@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) IGListAdapter *adapter;
@end

@implementation GoodsListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTitleBar];
    self.view.backgroundColor =UIColorFromRGB(0xF5F5F5);
        
    // 1. 初始化 CollectionView
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        layout.minimumLineSpacing = CPT(12);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor =[UIColor clearColor];
        [self.view addSubview:_collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleBar.mas_bottom);
            make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        }];
        
        // 2. 创建 IGListAdapter
        IGListAdapterUpdater *updater = [[IGListAdapterUpdater alloc] init];
        _adapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self];
        _adapter.collectionView = _collectionView;
        _adapter.dataSource = self;
    
    // 设置下拉刷新
    @weakify(self);
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
         [self.vm loadData];
     }];
     
     // 设置上拉加载
     self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
         @strongify(self);
         [self.vm loadData];
     }];
    
    // 首次进入自动刷新
        [self.collectionView.mj_header beginRefreshing];
        
      
    
}
-(void) initTitleBar{
    // 添加标题栏
        UIView *titleBar = [[UIView alloc] init];
        titleBar.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:titleBar];
        
        // 设置标题栏约束
        [titleBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.view);
            make.height.mas_equalTo(CPT(44) + [UIApplication sharedApplication].statusBarFrame.size.height);
        }];
        
        // 添加标题标签
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"列表";
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont systemFontOfSize:CPT(17)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [titleBar addSubview:titleLabel];
        
        // 设置标题标签约束
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(titleBar);
            make.bottom.equalTo(titleBar).offset(-CPT(12));
        }];
    self.titleBar  =titleBar;
}

-( GoodsListViewModel *) vm{
    if(!_vm){
        _vm = [[GoodsListViewModel alloc] init];
        _vm.delegate = self;
        
    }
    return  _vm;
}

- (void)onLoadFinish{
    NSLog(@"onLoadFinish, items count: %lu", (unsigned long)self.vm.items.count);
    [self.collectionView.mj_header endRefreshing];
//    self.collectionView.mj_header.hidden=YES;
    [self.collectionView.mj_footer endRefreshing];
//    [self.collectionView reloadData];
    [self.adapter performUpdatesAnimated:YES completion:nil];
//    self.vm.
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSLog(@"items count: %lu", (unsigned long)self.vm.items.count);  // 添加日志
    
    return self.vm.items; // 返回数据数组
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    NSLog(@"sectionControllerForObject %@", object);  // 添加日志
    GoodsItemSectionController * controller = [GoodsItemSectionController new]; // 创建对应的 Section Controller
    controller.delegate  = self;
    return  controller;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil; // 空数据时显示的视图
}

//#pragma mark - UICollectionViewDataSource
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return self.vm.cells.count;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    GoodsListItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsItemCell" forIndexPath:indexPath];
//    NSLog(@"indexPath %@",indexPath);
//    cell.model = [self.vm getModelByIndex:indexPath.item];
//    
//    
//    [cell bindData];
//    return cell;
//}
//
//#pragma mark - UICollectionViewDelegate
//
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    GoodsListItemCell  *selectedCell = [self.vm.cells objectAtIndex:indexPath.item];
//    NSLog(@"点击了: %@ %@", indexPath,selectedCell.model.title);
//    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"点击了 %@", selectedCell.model.title] preferredStyle:UIAlertControllerStyleAlert];
//    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
//    [self presentViewController:alert animated:YES completion:nil];
//}
//
//#pragma mark - UICollectionViewDelegateFlowLayout
    
    
#pragma mark - IGoodsListItemCellDelegate
    - (void)onClickGoodsListItemCellAddCart:(GoodsListItemCell *)cell model:(JLSearchResultPitemModel *)model{
        [self logAndToast: [NSString stringWithFormat: @"点击了 加购物车:  %@", model.title ]];
    }
    - (void)onClickGoodsListItemCellShare:(GoodsListItemCell *)cell model:(JLSearchResultPitemModel *)model{
        [self logAndToast: [NSString stringWithFormat: @"点击了 分享:  %@", model.title ]];
        
    }
    - (void)onClickGoodsListItemCellItem:(GoodsListItemCell *)cell model:(JLSearchResultPitemModel *)model{
        [self logAndToast: [NSString stringWithFormat: @"点击了 进入详情:  %@", model.title ]];
    }
    
    -(void) logAndToast:(NSString *)message{
        NSLog(@"%@",message);
        [self.view makeToast:message];
    }

@end
