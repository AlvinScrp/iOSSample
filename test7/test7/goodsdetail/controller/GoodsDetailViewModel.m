//
//  GoodsDetailViewModel.m
//  test7
//
//  Created by canglong on 2025/6/12.
//

#import "GoodsDetailViewModel.h"
#import "JLHttpResponseModel.h"
@import AFNetworking;
#import <YYModel/YYModel.h>
#import "CLUtilIndex.h"
#import "PitemDetailModel.h"
#import "EXTScope.h" // 引入 libextobjc

@interface GoodsDetailViewModel()
@property (nonatomic,strong) PitemDetailModel *pitemModel;

@end

@implementation GoodsDetailViewModel
- (instancetype)init {
    self = [super init];
    if (self) {
        _items = [NSMutableArray array];
    }
    return self;
}

- (void)loadData{
    
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    @weakify(self);
    
    // Configure AFNetworking to allow invalid certificates (for development only)
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy.validatesDomainName = NO;
    
    [manager
     GET:@request_url_pitemDetail
     parameters:nil
     headers:nil
     progress:^(NSProgress * _Nonnull downloadProgress) {
        //            NSLog(@"---> downloadProgress:%@",downloadProgress);
    }
     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        @strongify(self);
        NSLog(@"---> success:");
        JLHttpResponseModel * response = [[JLHttpResponseModel alloc] initWithDictionary:responseObject];
        self.pitemModel = [PitemDetailModel yy_modelWithDictionary:response.entry];
        dispatch_group_leave(group);
        
    }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"---> failure:%@",error);
        dispatch_group_leave(group);
    }];
    
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        @strongify(self);
        [self.delegate onLoadFinish];
        
    });
}

- (NSMutableArray *)items {
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

@end

