//
//  HttpResponseBean.h
//  test3
//
//  Created by canglong on 2025/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface HttpResponseBean : NSObject
@property (nonatomic, assign) NSInteger error_code;
@property (nonatomic, strong) NSString * reason;
@property (nonatomic, strong) NSObject * result;

- (instancetype)initWithResultClass:(Class)resultClass;
@end




NS_ASSUME_NONNULL_END
