//
//  GoodsListViewModel.h
//  test7
//
//  Created by canglong on 2025/6/3.
//

#import <Foundation/Foundation.h>
#import "JLSearchResultPitemModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol GoodsListViewModelDelegate <NSObject>

@optional
-(void) onLoadFinish;

@end

@interface GoodsListViewModel : NSObject
@property (nonatomic,weak) id<GoodsListViewModelDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *items;

-(void) loadData;

@end

NS_ASSUME_NONNULL_END
