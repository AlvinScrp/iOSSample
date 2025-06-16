//
//  PitemDetailModel.h
//  test7
//
//  Created by canglong on 2025/6/16.
//

#import <Foundation/Foundation.h>
#import "HykPriceCommissionModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface ExhibitionParkSimpleObjModel : NSObject
@property (nonatomic, strong) NSNumber *brandId;
@property (nonatomic, copy) NSString *brandLogo;
@property (nonatomic, copy) NSString *brandName;
@property (nonatomic, strong) NSNumber *exhibitionParkId;
@property (nonatomic, copy) NSString *exhibitionParkName;
@property (nonatomic, strong) NSNumber *exhibitionParkType;
@end

@interface Attr1InfoModel : NSObject
@property (nonatomic, copy) NSString *attributeName;
@property (nonatomic, copy) NSString *attributePic;
@property (nonatomic, strong) NSArray<NSString *> *attributePicList;
@property (nonatomic, copy) NSString *attributePicMax;
@property (nonatomic, strong) NSArray <NSString *> *attributePicMaxList;
@property (nonatomic, strong) NSNumber *inventory;
@property (nonatomic, strong) NSNumber *pitemId;
@property (nonatomic, strong) NSNumber *sort;
@end

@interface CornerTabVOModel : NSObject
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *icon;
@end

@interface PitemCommissionDetailDTO : NSObject
@property (nonatomic, strong) NSNumber *amount;
@property (nonatomic, copy) NSString *arriveCondition;
@property (nonatomic, copy) NSString *arriveConditionNew;
@property (nonatomic, copy) NSString *commissionType;
@property (nonatomic, copy) NSString *url;
@end

@interface PitemStyleDTO : NSObject
@property (nonatomic, copy) NSString *img;
@property (nonatomic, strong) NSNumber *pitemStyle;
@property (nonatomic, strong) NSNumber * selected;
@property (nonatomic, copy) NSString *text;
@end


@interface RankingListVO : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *linkUrl;
@property (nonatomic, strong) NSNumber *rank;
@property (nonatomic, copy) NSString *rankingListName;
@property (nonatomic, strong) NSNumber *type;
@end

@interface SecKillDTO : NSObject
@property (nonatomic, copy) NSString *currentLinkUrl;
@property (nonatomic, strong) NSNumber *gmtEnd;
@property (nonatomic, strong) NSNumber *gmtStart;
@property (nonatomic, copy) NSString *heat;
@property (nonatomic, copy) NSString *linkUrl;
@property (nonatomic, copy) NSString *publishTimeDesc;
@property (nonatomic, strong) NSNumber *rank;
@property (nonatomic, copy) NSString *rankingListName;
@end

@interface  CommissionRuleModel : NSObject
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString * desc;
@end

@interface CrossBorderModel : NSObject
@property (nonatomic, strong, nullable) NSNumber *crossBorderLabel; //1008, "保税" , 1009, "直邮"
@property (nonatomic, strong, nullable) NSNumber *taxesBearer;//1, "用户承担" , 2, "商家承担"
@property (nonatomic, strong, nullable) NSNumber *taxesAmount;//进口费用
@property (nonatomic, strong, nullable) NSNumber *taxesAmountToC;//c端展示金额（现在只有订单列表使用）
@property (nonatomic, copy, nullable) NSString *taxesRate;//税率
@property (nonatomic, copy, nullable) NSString *taxesRule;//计算规则
@end

@interface FullReductionLabelModel : NSObject
@property (nonatomic,copy)NSString *imgUrl;
@property (nonatomic,copy)NSString * name;
@property (nonatomic,copy)NSString * simpleName;
@end

@interface GoodsSpuAttrModel : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSArray<NSString *> * spuAttrList;
@end


@interface SimplePitemDTO : NSObject
@property (nonatomic, strong) NSNumber * activityGmtEnd;
@property (nonatomic, strong) NSNumber * activityGmtStart;
@property (nonatomic, strong) NSNumber * addInventoryFlag;
@property (nonatomic, strong) NSArray<Attr1InfoModel *> *attr1Info;
@property (nonatomic, copy) NSString *attribute1;
@property (nonatomic, copy) NSString *attribute1Value;
@property (nonatomic, copy) NSString *attribute2;
@property (nonatomic, strong) NSArray<NSString *> *attribute2Value;
@property (nonatomic, strong) NSString *  brandAuthorization;
@property (nonatomic, strong) NSNumber * brandAuthorizationShow;
@property (nonatomic, copy) NSString *brandCompanyName;
@property (nonatomic, copy) NSString *brandIcon;
@property (nonatomic, copy) NSString *brandLabelImage;
@property (nonatomic, strong) NSArray<NSString *>  *brandLabelImageList;
@property (nonatomic, copy) NSString *brandName;
@property (nonatomic, strong) NSNumber *brandQuality;
@property (nonatomic, strong) NSNumber *  broadcast;
@property (nonatomic, strong) NSNumber * canSaleTime;
@property (nonatomic, strong) NSNumber *channel;
@property (nonatomic, strong) CommissionRuleModel * commissionRule;
@property (nonatomic, copy) NSString *consumerManualImg;
@property (nonatomic, strong) CornerTabVOModel *cornerTabVO;
@property (nonatomic, strong) CrossBorderModel * crossBorder;
@property (nonatomic, copy) NSString *deliveryReportMessage;
@property (nonatomic, strong) NSNumber *exhibitionParkId;
@property (nonatomic, copy) NSString *exhibitionParkName;
@property (nonatomic, strong) NSNumber *exhibitionParkType;
@property (nonatomic, strong) NSNumber * fewStock;
@property (nonatomic, copy) NSString *fullGiftDesc;
@property (nonatomic, strong) FullReductionLabelModel * fullReductionLabel;
@property (nonatomic, strong) NSNumber * giveaway;
@property (nonatomic, strong) NSNumber *gmtEnd;
@property (nonatomic, strong) NSArray<NSString *> *headNewPictures;
@property (nonatomic, strong) NSArray<NSString *> *headNewPicturesMax;
@property (nonatomic, strong) NSArray<NSString *> *headPictures;
@property (nonatomic, strong) NSArray<NSString *> *headPicturesMax;
@property (nonatomic, copy) NSString *identificationInstructionImg;
@property (nonatomic, strong) NSNumber *inventory;
@property (nonatomic, strong) NSNumber * isStartSell;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *nonsupportPurchaseDesc;
@property (nonatomic, strong) NSNumber *optimization;
@property (nonatomic, strong) NSNumber *pitemButtonStatus;
@property (nonatomic, strong) NSArray<PitemCommissionDetailDTO *> *pitemCommissionDetailDTOList;
@property (nonatomic, copy) NSString *pitemCouponDesc;
@property (nonatomic, strong) NSArray <NSString *> *pitemHeadPictures;
@property (nonatomic, strong) NSNumber *pitemId;
@property (nonatomic, copy) NSString *pitemShipDesc;
@property (nonatomic, strong) NSNumber *pitemStatus;
@property (nonatomic, strong) NSNumber *pitemStyle;
@property (nonatomic, strong) NSArray<PitemStyleDTO *> *pitemStyleDTOList;
@property (nonatomic, strong) NSNumber  *preSale;
@property (nonatomic, strong) NSNumber * preSaleForActivity;
@property (nonatomic, strong) HykPriceCommissionModel *priceCommissionResp;
@property (nonatomic, strong) RankingListVO *rankingListVO;
@property (nonatomic, copy) NSString *remainingQuantity;
@property (nonatomic, copy) NSString *restrictAddress;
@property (nonatomic, copy) NSString *routeUrl;
@property (nonatomic, strong) NSNumber *saleActivityType;
@property (nonatomic, strong) SecKillDTO *secKillDTO;
@property (nonatomic, copy) NSString *secKillDesc;
@property (nonatomic, copy) NSString *sevenNoReasonText;
@property (nonatomic, copy) NSString *sizePictureUrl;
@property (nonatomic, strong) NSNumber *skuPanelType;
@property (nonatomic, strong) NSArray <NSString *> *skuSize;
@property (nonatomic, copy) NSString *sprintText;
@property (nonatomic, strong) NSArray<GoodsSpuAttrModel *> *spuAttrDTOS;
@property (nonatomic, strong) NSNumber *spuId;
@property (nonatomic, strong) NSNumber *spuType;
@property (nonatomic, strong) NSNumber *startSaleTime;
@property (nonatomic, strong) NSNumber * startSell;
@property (nonatomic, copy) NSString *supplierSpuCode;
@property (nonatomic, strong) NSNumber *  supportPurchase;
@property (nonatomic, strong) NSArray<NSString *> *videos;
@property (nonatomic, strong) NSNumber *  virtualPitem;
@property (nonatomic, strong) NSNumber *wxhcCategoryId;
@end

@interface PitemDetailModel : NSObject
@property (nonatomic, strong) ExhibitionParkSimpleObjModel *exhibitionParkSimpleObj;
@property (nonatomic, strong) SimplePitemDTO *simplePitemDTO;
@end

NS_ASSUME_NONNULL_END
