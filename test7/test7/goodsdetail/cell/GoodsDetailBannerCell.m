//
//  GoodsDetailBannerCell.m
//  test7
//
//  Created by canglong on 2025/6/16.
//

#import "GoodsDetailBannerCell.h"

@implementation GoodsDetailBannerItem

- (instancetype)initWithId:(NSString *)id model:(PitemDetailModel *)model{
    if (self = [super init]) {
        _id = [id copy];
        _model = model;
    }
    return self;
}

// IGListDiffable 协议方法
- (id<NSObject>)diffIdentifier {
    return self.id; // 唯一标识符
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    if (self == object) return YES;
    if (![(NSObject *)object isKindOfClass:[GoodsDetailBannerItem class]]) return NO;
    
    GoodsDetailBannerItem *other = (GoodsDetailBannerItem *)object;
    //    return false;
    return [self.model.simplePitemDTO.pitemId isEqualToNumber:other.model.simplePitemDTO.pitemId]; // 比较内容是否相同
}

@end


@implementation GoodsDetailBannerSectionController {
    
}
#pragma mark - IGListSectionController Overrides

- (NSInteger)numberOfItems {
    return 1; // 每个 Section 只有一个 Cell
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    NSLog(@"cellForItemAtIndex - index: %@", @(index));
    GoodsDetailBannerCell *cell = [self.collectionContext dequeueReusableCellOfClass:[GoodsDetailBannerCell class ] forSectionController:self atIndex:index];
    cell.model =_item.model;
//    cell.delegate = _delegate;
    [cell bindData];
    [cell setupEvent:_delegate];
    
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _item = object; // 绑定数据模型
}


@end

@interface GoodsDetailBannerCell()


@end

@implementation GoodsDetailBannerCell

-(void)bindData{
    
}
-(void) setupEvent:(id<IGoodsDetailBannerCellDelegate>)delegate{
    
}

@end
