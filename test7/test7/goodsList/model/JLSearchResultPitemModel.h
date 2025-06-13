//
//  JLSearchResultPitemModel.h
//  test7
//
//  Created by canglong on 2025/6/3.
//

#import <Foundation/Foundation.h>
#import "JLSearchResultPitemLabelModel.h"
#import "HykPriceCommissionModel.h"
#import <YYModel/YYModel.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JLSearchResultPitemButtonStatus) {
    JLSearchResultPitemButtonStatusAddCartUnknown = 0,      /**< 未知 */
    JLSearchResultPitemButtonStatusAddCart = 1,             /**< 加购 */
    JLSearchResultPitemButtonStatusApplied = 2,             /**< 已申请 */
    JLSearchResultPitemButtonStatusApply = 3,               /**< 申请加库存 */
    JLSearchResultPitemButtonStatusNoInventory = 4,         /**< 暂时无货 */
};

@interface JLSearchResultPitemModel : NSObject
@property (nonatomic, copy) NSString *pitemId;
@property (nonatomic, copy) NSString *exhibitionId;
@property (nonatomic, copy) NSString *goodsUrl;
@property (nonatomic, copy) NSString *title;
///商品标题前的标签列表
@property (nonatomic, strong) NSArray<NSString *> *titleLabelUrls;
/// 商品标签
@property (nonatomic, strong) NSArray<JLSearchResultPitemLabelModel *> *labelList;

///商品库存
@property (nonatomic, assign) NSInteger inventory;
///商品货号
@property (nonatomic, copy) NSString *supplierSpuCode;
///商品上架时间
@property (nonatomic, assign) long long onlineTime;

///是否预告商品
@property (nonatomic, assign) BOOL goodsPre;
///是否是今日神货
@property (nonatomic, assign) BOOL todayExcellent;

///能够在搜索列表直接加仓，false去加购界面加仓
@property (nonatomic, assign) BOOL addInventoryFlag;
///按钮状态
@property (nonatomic, assign) JLSearchResultPitemButtonStatus pitemButtonStatus;
/// 剩余尺码
@property (nonatomic, copy) NSString *remainingQuantity;

@property (nonatomic,strong) HykPriceCommissionModel * priceCommissionResp;
@end

NS_ASSUME_NONNULL_END
