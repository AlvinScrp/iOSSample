//
//  VideoViewController.m
//  test3
//
//  Created by canglong on 2025/5/8.
//

#import "VideoViewController.h"

@interface VideoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout  * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    flowLayout.minimumLineSpacing= 20;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.itemSize =CGSizeMake((self.view.frame.size.width-10)/2, 300);
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  200;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor systemPinkColor];
    
    return  cell;
}


#pragma mark   - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didSelectItem:%@ %@ %@",@(indexPath.section),@(indexPath.row),@(indexPath.item));
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item%3 == 0) {
        return CGSizeMake(self.view.frame.size.width, 100);
    }
    return CGSizeMake((self.view.frame.size.width-10)/2, 300);
}




@end
