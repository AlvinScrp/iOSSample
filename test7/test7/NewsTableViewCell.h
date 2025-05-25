//
//  NewsTableViewCell.h
//  test3
//
//  Created by canglong on 2025/5/11.
//

#import <UIKit/UIKit.h>
#import "loader/ListItemBean.h"
@class NewsTableViewCell;

@protocol NewsTableViewCellDelegate <NSObject>
- (void)newsTableViewCellDidClickDelete:(NewsTableViewCell *)cell item:(ListItemBean *) itemBean;
- (void)newsTableViewCellDidClickItem:(NewsTableViewCell *)cell item:(ListItemBean *) itemBean;
@end

@interface NewsTableViewCell : UITableViewCell
@property (nonatomic, weak) id<NewsTableViewCellDelegate> delegate;
-(void) setDataAndLayout:(ListItemBean *) itemBean;
@end


