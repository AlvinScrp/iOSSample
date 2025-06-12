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

@interface GoodsListViewController ()<GoodsListViewModelDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) GoodsListViewModel * vm;
@property (nonatomic, strong) UICollectionView *collectionView;
//@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation GoodsListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.vm loadData];
    
//    self.dataArray = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5"];
        
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = CPT(12);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize;
//    layout.estimatedItemSize = CGSizeMake(SCREEN_WIDTH, CPT(154)); // 预估高度
        
    self.collectionView = [[UICollectionView alloc] initWithFrame: self.view.bounds collectionViewLayout:layout];
//    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor clearColor];  // 设置collectionView背景色为透明
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
        
    [self.collectionView registerClass:[GoodsListItemCell class] forCellWithReuseIdentifier:@"GoodsItemCell"];
    [self.view addSubview:self.collectionView];
    self.view.backgroundColor = UIColorFromRGB(0xF5F5F5);
}

-( GoodsListViewModel *) vm{
    if(!_vm){
        _vm = [[GoodsListViewModel alloc] init];
        _vm.delegate = self;
        
    }
    return  _vm;
}

- (void)onLoadFinish{
    NSLog(@"onLoadFinish");
    [self.collectionView reloadData];
//    self.vm.
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.vm.cells.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GoodsListItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsItemCell" forIndexPath:indexPath];
    NSLog(@"indexPath %@",indexPath);
    cell.model = [self.vm getModelByIndex:indexPath.item];
    
    
    [cell bindData];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    GoodsListItemCell  *selectedCell = [self.vm.cells objectAtIndex:indexPath.item];
    NSLog(@"点击了: %@ %@", indexPath,selectedCell.model.title);
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"点击了 %@", selectedCell.model.title] preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UICollectionViewDelegateFlowLayout

@end
