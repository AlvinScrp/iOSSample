//
//  HttpResponseBean.h
//  test3
//
//  Created by canglong on 2025/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//https://jlgateway.daily.webuy.ai/rubik/gatherOrder/pitemList

@interface JLHttpResponseModel : NSObject
@property (nonatomic, assign) NSInteger responseCode;
@property(nonatomic,assign) NSInteger hasNext;
@property(nonatomic,assign) NSInteger count;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, assign) BOOL  status;
@property (nonatomic,strong) id entry;

- (instancetype) initWithDictionary:(NSDictionary *)dict;
- (nullable instancetype)initWithEntry:(id)entry ;
@end




NS_ASSUME_NONNULL_END
