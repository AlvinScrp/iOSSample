//
//  HykPriceCommissionUtil.m
//  test7
//
//  Created by canglong on 2025/6/3.
//

#import "HykPriceCommissionUtil.h"
#import "HykPriceCommissionModel.h"

@implementation HykPriceCommissionUtil

+ (BOOL)showPromotionPrice:(HykPriceCommissionModel *)bean {
    return ![self showSalePrice:bean ];
}

+ (BOOL)showSalePrice:(HykPriceCommissionModel *)bean  {
    if (!bean || !bean.promotionDTO) {
        return YES;
    }
    
    HykPromotionActivityType type = bean.promotionDTO.activityType;
    if (!type) {
        return YES;
    }

    
    if (type == HykPromotionActivityType_Coupon) {
        return NO;
    }
    
    long long startTime = bean.promotionDTO.activityGmtStart.longLongValue;
    if (!startTime) {
        return YES;
    }
    
    BOOL isStart = startTime < [HykPriceCommissionUtil nowTime];

    
    return type == HykPromotionActivityType_NNumNYuan ||
    type == HykPromotionActivityType_NNumNDiscount ||
           (type == HykPromotionActivityType_OneNumNYuan && !isStart) ||
           (type == HykPromotionActivityType_OneNumNDiscount && !isStart) ||
           (type == HykPromotionActivityType_LimitTime && !isStart);
}


+ (NSDictionary *)getDisplayPriceAndPrefix:(HykPriceCommissionModel *)bean {
    if ([self showPromotionPrice:bean]) {
        return @{
            @"price":  bean.promotionDTO.priceWithPromotion,
            @"prefix": bean.promotionDTO.prefix ?: @""
        };
    }
    return @{
        @"price": bean.price ,
        @"prefix": @"零售价"
    };
}

+ (BOOL)isPromotionStart:(HykPriceCommissionModel *)bean {
    if (!bean || !bean.promotionDTO) {
        return YES;
    }
    
    HykPromotionActivityType type = bean.promotionDTO.activityType;
    if (!type) {
        return YES;
    }
    
    if (type== HykPromotionActivityType_Coupon) {
        return YES;
    }
    
    long long startTime = bean.promotionDTO.activityGmtStart.longLongValue;
    if (!startTime) {
        return YES;
    }
    
    return startTime < [HykPriceCommissionUtil nowTime];
}

+ (NSNumber *)getTotalCommission:(HykPriceCommissionModel *)bean {
    long long minCommission =bean.minCommission? [bean.minCommission longLongValue]:0L;
    long long doubleCommission = bean.doubleCommission?[bean.doubleCommission longLongValue]:0L;
    long long total = minCommission + doubleCommission;
    
    return total > 0 ? @(total) : nil;
}

+ (BOOL)hasRangeAndNotOneNumNYuan:(HykPriceCommissionModel *)bean {
    return [self hasRange:bean] && ![self isOneNumNYuan:bean];
}

+ (BOOL)hasRange:(HykPriceCommissionModel *)bean {
    NSNumber *maxPrice = bean.maxPrice;
    NSNumber *minPrice = bean.minPrice;
    
    if (!maxPrice || !minPrice) {
        return NO;
    }
    
    return [maxPrice longLongValue] > [minPrice longLongValue];
}

+(BOOL)isOneNumNYuan:(HykPriceCommissionModel *)bean {
    
    NSNumber * startTime = bean.promotionDTO.activityGmtStart;
    if (!startTime) {
        return NO;
    }
    
    HykPromotionActivityType type = bean.promotionDTO.activityType;
    return type == HykPromotionActivityType_OneNumNYuan && startTime.longLongValue  < [HykPriceCommissionUtil nowTime];
}
+ (long long) nowTime{
    return  (long long) ([[NSDate date] timeIntervalSince1970] * 1000);
}


@end
