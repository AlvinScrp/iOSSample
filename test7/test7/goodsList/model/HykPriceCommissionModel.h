//
//  HykPriceCommissionModel.h
//  test7
//
//  Created by canglong on 2025/6/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, HykPromotionActivityType) {
       HykPromotionActivityType_OneNumNYuan = 1,      // 1件n元
       HykPromotionActivityType_NNumNYuan = 2,        // n件n元
       HykPromotionActivityType_OneNumNDiscount = 3,  // 1件n折
       HykPromotionActivityType_NNumNDiscount = 4,    // n件n折
       HykPromotionActivityType_LimitTime = 5,        // 限时直降
       HykPromotionActivityType_Coupon = 6            // 券后价
};

@interface PromotionDTOModel : NSObject

@property (nonatomic, assign) HykPromotionActivityType activityType;
@property (nonatomic, assign) NSNumber * activityGmtStart;
@property (nonatomic, assign) NSNumber *  activityGmtEnd;
@property (nonatomic, assign) NSNumber *  priceWithPromotion;
@property (nonatomic, copy) NSString *actionValue;
@property (nonatomic, copy) NSString *conditionValue;
@property (nonatomic, copy) NSString *prefix;
@property (nonatomic, copy) NSString *priceWithPromotionAfter;
@property (nonatomic, copy) NSString *promotionDescription;

@end

@interface HykPriceCommissionModel : NSObject
@property (nonatomic, strong) NSString * pitemId;
@property (nonatomic, strong) NSString *itemId;
@property (nonatomic, assign) NSNumber * originPrice;
@property (nonatomic, assign) NSNumber * price;
@property (nonatomic, assign) NSNumber * minPrice;
@property (nonatomic, assign) NSNumber * maxPrice;
@property (nonatomic, assign) NSNumber * minCommission;
@property (nonatomic, assign) NSNumber * maxCommission;
@property (nonatomic, assign) NSNumber * doubleCommission;
@property (nonatomic, assign) NSNumber *doubleWarmUp;
@property (nonatomic, assign) NSNumber *activityType;
@property (nonatomic, strong) PromotionDTOModel *promotionDTO;
@end



NS_ASSUME_NONNULL_END
