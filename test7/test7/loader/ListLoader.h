//
//  ListLoader.h
//  test3
//
//  Created by canglong on 2025/5/14.
//

#import <Foundation/Foundation.h>
#import "ListItemBean.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListLoader : NSObject

-(void) loadData:(nullable void (^)(NSArray<ListItemBean *>  * _Nullable items))onLoaded;

@end

NS_ASSUME_NONNULL_END
