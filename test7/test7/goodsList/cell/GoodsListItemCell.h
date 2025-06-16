//
//  GoodsListItemCell.h
//  test7
//
//  Created by canglong on 2025/6/4.
//

#import <UIKit/UIKit.h>
#import "JLSearchResultPitemModel.h"
#import <IGListDiffable.h>
#import <IGListSectionController.h>
NS_ASSUME_NONNULL_BEGIN
@class  GoodsListItemCell;

@interface GoodsItem : NSObject <IGListDiffable>

@property (nonatomic, copy, readonly) NSString *id;
@property (nonatomic,strong) JLSearchResultPitemModel * model;

- (instancetype)initWithId:(NSString *)id model:(JLSearchResultPitemModel *)model;

@end

@protocol IGoodsListItemCellDelegate

-(void) onClickGoodsListItemCellAddCart:(GoodsListItemCell *) cell model:(JLSearchResultPitemModel *) model;
-(void) onClickGoodsListItemCellShare:(GoodsListItemCell *) cell model:(JLSearchResultPitemModel *) model;
-(void) onClickGoodsListItemCellItem:(GoodsListItemCell *) cell model:(JLSearchResultPitemModel *) model;

@end

@interface GoodsItemSectionController : IGListSectionController
@property (nonatomic,weak) id<IGoodsListItemCellDelegate>  delegate;
@end


@interface GoodsListItemCell :UICollectionViewCell
@property (nonatomic,strong) JLSearchResultPitemModel * model;
//@property (nonatomic,weak) id<IGoodsListItemCellDelegate>  delegate;

-(void) bindData;
-(void) setupEvent:(id<IGoodsListItemCellDelegate> ) delegate;

@end





NS_ASSUME_NONNULL_END
