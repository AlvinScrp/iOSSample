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
@property (nonatomic, assign,nullable) NSNumber * activityGmtStart;
@property (nonatomic, assign,nullable) NSNumber *  activityGmtEnd;
@property (nonatomic, assign,nullable) NSNumber *  priceWithPromotion;
@property (nonatomic, copy, nullable) NSString *actionValue;
@property (nonatomic, copy, nullable) NSString *conditionValue;
@property (nonatomic, copy, nullable) NSString *prefix;
@property (nonatomic, copy, nullable) NSString *priceWithPromotionAfter;
@property (nonatomic, copy, nullable) NSString *promotionDescription;

@end

@interface HykPriceCommissionModel : NSObject
@property (nonatomic, strong,nullable) NSString * pitemId;
@property (nonatomic, strong, nullable) NSString *itemId;
@property (nonatomic, assign,nullable) NSNumber * originPrice;
@property (nonatomic, assign,nullable) NSNumber * price;
@property (nonatomic, assign,nullable) NSNumber * minPrice;
@property (nonatomic, assign,nullable) NSNumber * maxPrice;
@property (nonatomic, assign,nullable) NSNumber * minCommission;
@property (nonatomic, assign,nullable) NSNumber * maxCommission;
@property (nonatomic, assign,nullable) NSNumber * doubleCommission;
@property (nonatomic, assign, nullable) NSNumber *doubleWarmUp;
@property (nonatomic, assign, nullable) NSNumber *activityType;
@property (nonatomic, strong, nullable) PromotionDTOModel *promotionDTO;
@end



NS_ASSUME_NONNULL_END
