//
//  GoodsDetailViewModel.h
//  test7
//
//  Created by canglong on 2025/6/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GoodsDetailViewModelDelegate <NSObject>

@optional
-(void) onLoadFinish;

@end

@interface GoodsDetailViewModel : NSObject
@property (nonatomic,weak) id<GoodsDetailViewModelDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *items;

-(void) loadData;

@end

NS_ASSUME_NONNULL_END
