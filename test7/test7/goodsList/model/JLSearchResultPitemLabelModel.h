//
//  JLSearchResultPitemLabelModel.h
//  test7
//
//  Created by canglong on 2025/6/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JLSearchResultPitemLabelModel : NSObject
@property (nonatomic, assign) NSInteger labelCode;
@property (nonatomic, copy) NSString *labelName;
@property (nonatomic, copy) NSString *labelImg;
@property (nonatomic, copy) NSString *borderColor;
@property (nonatomic, copy) NSString *textColor;
@property (nonatomic, copy) NSString *bgColor;
@end

NS_ASSUME_NONNULL_END
