//
//  GoodsDetailBannerCell.h
//  test7
//
//  Created by canglong on 2025/6/16.
//

#import <UIKit/UIKit.h>
#import "PitemDetailModel.h"
#import <IGListDiffable.h>
#import <IGListSectionController.h>

NS_ASSUME_NONNULL_BEGIN

@class GoodsDetailBannerCell;

@interface GoodsDetailBannerItem : NSObject <IGListDiffable>
@property (nonatomic, copy, readonly) NSString *id;
@property (nonatomic,strong) PitemDetailModel * model;


- (instancetype)initWithId:(NSString *)id model:(PitemDetailModel *)model;

@end


@protocol IGoodsDetailBannerCellDelegate

-(void) onBannerImageIndexChange:(GoodsDetailBannerCell *) cell model:(PitemDetailModel *) model  oldIndex:(NSInteger) oldIndex  newIndex:(NSInteger) newIndex;

@end

@interface GoodsDetailBannerSectionController : IGListSectionController
@property (nonatomic,strong)  GoodsDetailBannerItem *item;
@property (nonatomic,weak) id<IGoodsDetailBannerCellDelegate>  delegate;
@end

@interface GoodsDetailBannerCell  :UICollectionViewCell
@property (nonatomic,strong) PitemDetailModel * model;

-(void) bindData;
-(void) setupEvent:(id<IGoodsDetailBannerCellDelegate> ) delegate;


@end

NS_ASSUME_NONNULL_END
