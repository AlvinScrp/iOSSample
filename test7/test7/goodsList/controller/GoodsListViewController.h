//
//  GoodsListViewController.h
//  test7
//
//  Created by canglong on 2025/6/3.
//

#import <UIKit/UIKit.h>
#import <IGListKit.h>
#import "GoodsListViewModel.h"


NS_ASSUME_NONNULL_BEGIN

/*@interface GoodsListViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>*/
@interface GoodsListViewController : UIViewController<IGListAdapterDataSource>


@end

NS_ASSUME_NONNULL_END
