//
//  GoodsListViewModel.m
//  test7
//
//  Created by canglong on 2025/6/3.
//

#import "GoodsListViewModel.h"
#import "JLHttpResponseModel.h"
#import "JLSearchResultPitemModel.h"
#import "GoodsListItemCell.h"
@import AFNetworking;
#import <YYModel/YYModel.h>
#import "CLUtilIndex.h"
#import "EXTScope.h" // 引入 libextobjc

@interface GoodsListViewModel()
@property (nonatomic,strong) NSMutableArray<JLSearchResultPitemModel *> *pitemModels;

@end

@implementation GoodsListViewModel
- (instancetype)init {
    self = [super init];
    if (self) {
        _pitemModels = [NSMutableArray array];
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
     GET:@request_url_pitemList
     parameters:nil
     headers:nil
     progress:^(NSProgress * _Nonnull downloadProgress) {
        //            NSLog(@"---> downloadProgress:%@",downloadProgress);
    }
     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        @strongify(self);
        NSLog(@"---> success:");
        JLHttpResponseModel * response = [[JLHttpResponseModel alloc] initWithDictionary:responseObject];
        NSArray<JLSearchResultPitemModel *> * models = [NSArray yy_modelArrayWithClass:JLSearchResultPitemModel.class json:response.entry[@"list"]];
        [self.pitemModels addObjectsFromArray:models];
        dispatch_group_leave(group);
        
    }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"---> failure:%@",error);
        dispatch_group_leave(group);
    }];
    
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        @strongify(self);
        [self.pitemModels enumerateObjectsUsingBlock:^(JLSearchResultPitemModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.items addObject:[[GoodsItem alloc] initWithId:[NSString stringWithFormat:@"GoodsListItemCell-%@",@(idx)] model:obj]];
            
        }];
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
