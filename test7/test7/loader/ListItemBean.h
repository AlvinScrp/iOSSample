//
//  ListItemBean.h
//  test3
//
//  Created by canglong on 2025/5/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListItemBean : NSObject
@property (nonatomic, strong) NSString *uniquekey;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *author_name;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *thumbnail_pic_s;
@property (nonatomic, strong) NSString *thumbnail_pic_s02;
@property (nonatomic, strong) NSString *thumbnail_pic_s03;
@property (nonatomic, strong) NSString *is_content;
@end

@interface ListResultBean : NSObject
@property (nonatomic, strong) NSString * stat;
@property (nonatomic, strong) NSArray<ListItemBean *> * data;
@property (nonatomic, strong) NSString * page;
@property (nonatomic, strong) NSString * pageSize;

@end

NS_ASSUME_NONNULL_END
