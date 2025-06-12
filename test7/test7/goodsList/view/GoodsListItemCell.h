//
//  GoodsListItemCell.h
//  test7
//
//  Created by canglong on 2025/6/4.
//

#import <UIKit/UIKit.h>
#import "JLSearchResultPitemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GoodsListItemCell :UICollectionViewCell
@property (nonatomic,strong) JLSearchResultPitemModel * model;

-(void) createUI;
-(void) bindData;

@end

NS_ASSUME_NONNULL_END
