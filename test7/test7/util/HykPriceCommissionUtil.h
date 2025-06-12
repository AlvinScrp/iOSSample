//
//  HykPriceCommissionUtil.h
//  test7
//
//  Created by canglong on 2025/6/3.
//

#import <Foundation/Foundation.h>
#import "HykPriceCommissionModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HykPriceCommissionUtil : NSObject
+ (BOOL)showPromotionPrice:(HykPriceCommissionModel *)bean;
+ (NSDictionary *)getDisplayPriceAndPrefix:(HykPriceCommissionModel *)bean;

+ (BOOL)hasRangeAndNotOneNumNYuan:(HykPriceCommissionModel *)bean;

+ (NSNumber *)getTotalCommission:(HykPriceCommissionModel *)bean ;

+ (BOOL)isPromotionStart:(HykPriceCommissionModel *)bean;

@end

NS_ASSUME_NONNULL_END
