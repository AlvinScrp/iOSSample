//
//  ListLoader.m
//  test3
//
//  Created by canglong on 2025/5/14.
//

#import "ListLoader.h"
#import "HttpResponseBean.h"
#import "ListItemBean.h"
#import  <YYModel/YYModel.h>
//#import <AFNetworking/AFNetworking.h>
@import AFNetworking;

@implementation ListLoader

-(void) loadData:(nullable void (^)(NSArray<ListItemBean *>  * _Nullable items))onLoaded{
   
//    NSString * urlString = @"https://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
//    [[AFHTTPSessionManager manager]
//     GET:urlString
//        
//        parameters:nil
//        headers:nil
//        progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"---> downloadProgress:%@",downloadProgress);
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"---> success:");
//            // 指定 result 为 User 类型
//            HttpResponseBean *response = [[HttpResponseBean alloc] initWithResultClass:[ListResultBean class]];
//            [response yy_modelSetWithDictionary:responseObject];
//            [self save2File:response];
//            NSLog(@"%@",response.result);
//            ListResultBean *resultBean = (ListResultBean *)response.result;
//            if ([resultBean isKindOfClass:[ListResultBean class]]) {
//                onLoaded(resultBean.data);
//            }else{
//                onLoaded(nil);
//            }
//            
//         
//        }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"---> failure:%@",error);
//        }];
     
     
    
//        HttpResponseBean *responseFromFile  = [self getFromFile];
//    [self save2UserDefaults:responseFromFile];
    
    HttpResponseBean *responseUserDefaults =  [self getFromUserDefaults];
    ListResultBean *resultBean = (ListResultBean *)responseUserDefaults.result;
    if ([resultBean isKindOfClass:[ListResultBean class]]) {
        onLoaded(resultBean.data);
    }else{
        onLoaded(nil);
    }
    
    NSLog(@"www");
}



-(void) save2File:(HttpResponseBean *)response{
    NSData *responseData = [response yy_modelToJSONData];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentPath = paths[0];
    NSString *responsePath = [documentPath stringByAppendingPathComponent:@"listResponse2.txt"];
    
    [[NSFileManager defaultManager] createFileAtPath:responsePath contents:responseData attributes:nil];
}
-(HttpResponseBean *) getFromFile{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentPath = paths[0];
    NSString *responsePath = [documentPath stringByAppendingPathComponent:@"listResponse2.txt"];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSData * responseJsonData =[fileManager contentsAtPath: responsePath];
    
    HttpResponseBean *response = [[HttpResponseBean alloc] initWithResultClass:[ListResultBean class]];
    [response yy_modelSetWithJSON:responseJsonData];
    return  response;
}
-(void) save2UserDefaults:(HttpResponseBean *)response{
    [[NSUserDefaults standardUserDefaults] setObject:[response yy_modelToJSONData] forKey:@"key_listResponse"];
}
-(HttpResponseBean *) getFromUserDefaults{
    
    NSData * responseJsonData =  [[NSUserDefaults standardUserDefaults] objectForKey:@"key_listResponse"];
    
    HttpResponseBean *response = [[HttpResponseBean alloc] initWithResultClass:[ListResultBean class]];
    [response yy_modelSetWithJSON:responseJsonData];
    return  response;
}

@end
