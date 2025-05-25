//
//  HttpResponseBean.m
//  test3
//
//  Created by canglong on 2025/5/14.
//

#import "HttpResponseBean.h"
#import "ListItemBean.h"
#import  <YYModel/YYModel.h>
//@interface HttpResponseBean()
//@property (nonatomic, strong) Class resultClass;
//@end

@implementation HttpResponseBean{
    Class _resultClass; // 存储运行时类型
}

- (instancetype)initWithResultClass:(Class)resultClass{
    if(self =[super init]){
        _resultClass = resultClass;
    }
    return  self;
}
// YYModel 解析时动态转换
- (BOOL)yy_modelSetWithDictionary:(NSDictionary *)dic {
    _error_code = [dic[@"error_code"] integerValue];
    _reason = dic[@"reason"];
    
    // 动态解析为指定类型
    if (_resultClass) {
        _result = [_resultClass yy_modelWithDictionary:dic[@"result"]];
    } else {
        _result = dic[@"result"]; // 默认不转换
    }
    return YES;
}
@end

