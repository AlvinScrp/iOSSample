//
//  GoodsListItemCell.m
//  test7
//
//  Created by canglong on 2025/6/4.
//

#import "GoodsListItemCell.h"
#import "CLUtilIndex.h"
#import "PaddingLabel.h"
#import "HykPriceCommissionUtil.h"
#import "PromotionTagView.h"
#import "UIView+Click.h"


@implementation GoodsItem

- (instancetype)initWithId:(NSString *)id model:(JLSearchResultPitemModel *)model{
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
    if (![(NSObject *)object isKindOfClass:[GoodsItem class]]) return NO;
    
    GoodsItem *other = (GoodsItem *)object;
    //    return false;
    return [self.model.pitemId isEqualToString:other.model.pitemId]; // 比较内容是否相同
}

@end

@interface GoodsItemSectionController()
@property (nonatomic,strong)  GoodsItem *goodsItem;
@end
@implementation GoodsItemSectionController {
    
}
#pragma mark - IGListSectionController Overrides

- (NSInteger)numberOfItems {
    return 1; // 每个 Section 只有一个 Cell
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    NSLog(@"cellForItemAtIndex - index: %@", @(index));
    GoodsListItemCell *cell = [self.collectionContext dequeueReusableCellOfClass:[GoodsListItemCell class ] forSectionController:self atIndex:index];
    cell.model =_goodsItem.model;
//    cell.delegate = _delegate;
    [cell bindData];
    [cell setupEvent:_delegate];
    
    return cell;
}

- (void)didUpdateToObject:(id)object {
    _goodsItem = object; // 绑定数据模型
}


@end

@interface GoodsListItemCell()
@property (nonatomic,strong) UIView * bgView;
@property (nonatomic,strong) UIImageView * photoIv;
@property (nonatomic,strong) UIImageView * soldoutIv;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic,strong) PaddingLabel * tag0Label;
@property (nonatomic,strong) PaddingLabel * tag1Label;

@property (nonatomic,strong) UILabel * priceLabel;
@property (nonatomic,strong) UILabel * commissionLabel;
@property (nonatomic,strong) PromotionTagView * promotionTagV;
@property (nonatomic,strong) UIButton * addCartBtn;
@property (nonatomic,strong) UIButton * shareBtn;

@end

@implementation GoodsListItemCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void) createUI{
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    //    [self]
    
    [self.contentView addSubview:self.bgView];
    self.bgView.backgroundColor=UIColor.whiteColor;
    self.bgView.layer.cornerRadius = CPT(6);
    self.bgView.layer.masksToBounds = YES;
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.inset(CPT(12));
        make.top.mas_equalTo(self.contentView).inset(CPT(12));
        make.bottom.mas_equalTo(self.contentView);
        make.width.mas_equalTo(CPT(351));
        //                make.height.mas_greaterThanOrEqualTo(CPT(154));
    }];
    
    
    [self.bgView addSubview:self.photoIv];
    [self.bgView addSubview:self.soldoutIv];
    [self.bgView addSubview:self.titleLabel];
    [self.bgView addSubview:self.tag0Label];
    [self.bgView addSubview:self.tag1Label];
    [self.bgView addSubview:self.priceLabel];
    [self.bgView addSubview:self.commissionLabel];
    [self.bgView addSubview:self.promotionTagV];
    [self.bgView addSubview:self.addCartBtn];
    [self.bgView addSubview:self.shareBtn];
    
    
    
    
    self.photoIv.layer.cornerRadius = CPT(4);
    self.photoIv.layer.masksToBounds = YES;
    [self.photoIv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(CPT(9));
        make.top.offset(CPT(12));
        make.width.height.mas_equalTo(CPT(130));
    }];
    
    
    
    [self.soldoutIv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(CPT(80));
        make.center.mas_equalTo(self.photoIv);
    }];
    
    self.titleLabel.textColor =UIColor.blackColor;
    self.titleLabel.font = [UIFont systemFontOfSize:CPT(14)];
    self.titleLabel.numberOfLines = 2;
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([self.photoIv mas_right]).offset(CPT(9));
        make.top.mas_equalTo(self.photoIv);
        make.right.mas_equalTo(self.bgView).offset(-CPT(3));
    }];
    
    [ self.tag0Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([self.photoIv mas_right]).offset(CPT(9));
        make.top.mas_equalTo(self.photoIv).offset(CPT(42));
    }];
    
    [self.tag1Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([self.tag0Label mas_right]).offset(CPT(3));
        make.top.mas_equalTo([self.tag0Label mas_top]);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([self.photoIv mas_right]).offset(CPT(9));
        make.top.mas_equalTo(self.photoIv).offset(CPT(61));
    }];
    [self.commissionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([self.photoIv mas_right]).offset(CPT(9));
        make.top.mas_equalTo([self.priceLabel mas_bottom]).offset(CPT(3));
    }];
    
    [self.promotionTagV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([self.photoIv mas_right]).offset(CPT(9));
        make.top.mas_equalTo(self.commissionLabel.mas_bottom).offset(CPT(6));
        make.height.mas_equalTo(CPT(16));
        
    }];
    
    
    self.addCartBtn.backgroundColor = [UIColor whiteColor];
    //    self.addCartBtn.contentEdgeInsets = UIEdgeInsetsMake(CPT(7), CPT(15),CPT(7), CPT(15) );
    [self.addCartBtn setTitle:@"加购物车" forState:UIControlStateNormal];
    [self.addCartBtn setTitleColor:UIColorFromRGB(0xffFD4E18) forState:UIControlStateNormal];
    self.addCartBtn.titleLabel.font = [UIFont pingFangSCMediumFontWithSize:13] ;
    self.addCartBtn.layer.cornerRadius = CPT(13.5);
    //    self.addCartBtn.layer.masksToBounds=true;
    //设置边框
    self.addCartBtn.layer.borderWidth = CPT(1);
    self.addCartBtn.layer.borderColor = UIColorFromRGB(0xffFD4E18).CGColor;
    
    [self.addCartBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([self.photoIv mas_right]).offset(CPT(9));
        make.top.mas_equalTo([self.promotionTagV mas_bottom]).offset(CPT(9));
        make.height.mas_equalTo(CPT(27));
        make.width.mas_equalTo(CPT(83));
        make.bottom.mas_equalTo(self.bgView).inset(CPT(12));
    }];
    
    self.shareBtn.backgroundColor =UIColorFromRGB(0xffFD4E18)  ;
    //    self.shareBtn.contentEdgeInsets = UIEdgeInsetsMake(CPT(7), CPT(15),CPT(7), CPT(15) );
    [self.shareBtn setTitle:@"转发" forState:UIControlStateNormal];
    [self.shareBtn setTitleColor:[UIColor  whiteColor] forState:UIControlStateNormal];
    self.shareBtn.titleLabel.font = [UIFont pingFangSCMediumFontWithSize:13] ;
    self.shareBtn.layer.cornerRadius = CPT(13.5);
    //    self.addCartBtn.layer.masksToBounds=true;
    //设置边框
    self.shareBtn.layer.borderWidth = CPT(1);
    self.shareBtn.layer.borderColor = UIColorFromRGB(0xffFD4E18).CGColor;
    
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([self.addCartBtn mas_right]).offset(CPT(9));
        make.top.mas_equalTo(self.addCartBtn);
        make.height.mas_equalTo(CPT(27));
        make.width.mas_equalTo(CPT(83));
    }];
    
    
}
-(void) bindData{
    JLSearchResultPitemModel *  model =self.model;
    NSLog(@"%@",model);
    [self.photoIv loadCdnUrl:model.goodsUrl.cdnString];
    [self.soldoutIv loadCdnUrl:image_url_soldout];
    
    [self setTitleWithText:model.title imageURLs:model.titleLabelUrls imageHeight:CPT(14)  verticalOffset:CPT(2)];
//    self.titleLabel.text = model.title;
    
    [self setTag:self.tag0Label index:0 model:model];
    [self setTag:self.tag1Label index:1 model:model];
    
    [self setPriceText:model];
    
    [self setCommissionText:model];
    
    [self setPromotionTagContent:model];
    
    
    
    //    [self.addCartBtn mas_updateConstraints:^(MASConstraintMaker *make) {
    //        make.top.mas_equalTo([self.promotionTagV mas_bottom]).offset(self.promotionTagV.isHidden?-CPT(7):CPT(9));
    //
    //    }];
    //
    [self.addCartBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([self.photoIv mas_right]).offset(CPT(9));
        if (self.promotionTagV.isHidden) {
            make.top.mas_equalTo(self.commissionLabel.mas_bottom).offset(CPT(9));
        } else {
            make.top.mas_equalTo(self.promotionTagV.mas_bottom).offset(CPT(9));
        }
        make.height.mas_equalTo(CPT(27));
        make.width.mas_equalTo(CPT(83));
        make.bottom.mas_equalTo(self.bgView).inset(CPT(12));
    }];
    
}
/**
 * 将多张网络图片插入到文字左侧
 * @param text 文字内容
 * @param imageURLs 图片 URL 数组
 * @param height 图片显示高度
 * @param offset 图片垂直偏移（调整对齐）
 */
- (void) setTitleWithText:(NSString *)text
                imageURLs:(NSArray<NSString *> *)imageURLs
              imageHeight:(CGFloat) height
           verticalOffset:(CGFloat)offset {
    
    // 1. 创建一个空的富文本
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    
    // 2. 使用 dispatch_group 管理多图下载
    dispatch_group_t group = dispatch_group_create();
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:imageURLs.count];
    
    for (NSString *urlString in imageURLs) {
        dispatch_group_enter(group);
        
        [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:[urlString cdnString]]
                                                    options:SDWebImageAvoidAutoSetImage
                                                   progress:nil
                                                  completed:^(UIImage *image, NSData *data, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            if (image) {
                [images addObject:image];
            } else {
                // 下载失败时使用占位图
                //                [images addObject:[UIImage imageNamed:@"placeholder"]];
            }
            dispatch_group_leave(group);
        }];
    }
    
    // 3. 所有图片下载完成后，插入到富文本
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        NSLog(@"dispatch_group_notify %@",images);
        for (UIImage *image in images) {
            NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
            attachment.image = image;
            CGFloat width = height*(image.size.width/image.size.height);
            attachment.bounds = CGRectMake(0, -offset, width, height);
            
            [attributedString appendAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
            
            // 图片之间加一个空格（可选）
            [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
        }
        
        // 4. 拼接文字
        [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:text]];
        
        // 5. 设置给 UILabel
        self.titleLabel.attributedText = attributedString;
    });
}

-(void) setPriceText:(JLSearchResultPitemModel*) model{
    // 1. 创建一个空的富文本
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    NSDictionary * info = [HykPriceCommissionUtil getDisplayPriceAndPrefix:model.priceCommissionResp];
    NSString * prefix = info[@"prefix"];
    NSNumber * price = info[@"price"];
    
    if(prefix.isNotNullOrEmpty){
        [attributedString appendAttributedString:[[NSAttributedString alloc]
                                                  initWithString: prefix
                                                  attributes:@{NSForegroundColorAttributeName: UIColorFromRGB(0x333333),NSFontAttributeName: [UIFont systemFontOfSize:CPT(12)]}]];
        
        UIImage *spaceImage = [UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(CPT(2), CPT(1))];
        NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
        attachment.image = spaceImage;
        NSAttributedString *space = [NSAttributedString attributedStringWithAttachment:attachment];
        
        [attributedString appendAttributedString:space];
    }
    if (price) {
        [attributedString appendAttributedString:[[NSAttributedString alloc]
                                                  initWithString: symbolString
                                                  attributes:@{NSForegroundColorAttributeName: UIColorFromRGB(0x333333),NSFontAttributeName: [UIFont systemFontOfSize:CPT(12)]}] ];
        [attributedString appendAttributedString:[[NSAttributedString alloc]
                                                  initWithString: price.formatMoney
                                                  attributes:@{NSForegroundColorAttributeName: UIColorFromRGB(0x333333),NSFontAttributeName: [UIFont systemFontOfSize:CPT(15)]}] ];
        
    }
    if([HykPriceCommissionUtil hasRangeAndNotOneNumNYuan:model.priceCommissionResp]){
        [attributedString appendAttributedString:[[NSAttributedString alloc]
                                                  initWithString: @"起"
                                                  attributes: @{NSForegroundColorAttributeName: UIColorFromRGB(0x333333),NSFontAttributeName: [UIFont systemFontOfSize:CPT(12)]}] ];
        
    }
    
    self.priceLabel.attributedText = attributedString;
}
-(void) setCommissionText:(JLSearchResultPitemModel*) model{
    // 1. 创建一个空的富文本
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    NSNumber * commission = [HykPriceCommissionUtil getTotalCommission:model.priceCommissionResp];
    
    if (commission) {
        [attributedString appendAttributedString:[[NSAttributedString alloc]
                                                  initWithString: @"最多省/赚"
                                                  attributes:@{NSForegroundColorAttributeName: [UIColor redColor],NSFontAttributeName: [UIFont systemFontOfSize:CPT(12)]}] ];
        
        [attributedString appendAttributedString:[[NSAttributedString alloc]
                                                  initWithString: commission.formatMoney
                                                  attributes:@{NSForegroundColorAttributeName: [UIColor redColor],NSFontAttributeName: [UIFont systemFontOfSize:CPT(12)]}] ];
        
    }
    
    self.commissionLabel.attributedText = attributedString;
}

-(void) setTag:(PaddingLabel *)label index:(NSInteger) index model:(JLSearchResultPitemModel*) model{
    if (index >= model.labelList.count) {
        label.hidden = YES;
        return;
    }
    
    JLSearchResultPitemLabelModel *labelModel = [model.labelList objectAtIndex:index];
    if (!labelModel) {
        label.hidden = YES;
        return;
    }
    
    if (labelModel.labelName.isNSStringAndNotEmpty) {
        //        [label mas_remakeConstraints:^(MASConstraintMaker *make) {
        //           //设置上下左右间距
        //            make.edges.insets(UIEdgeInsetsMake(CPT(2), CPT(3), CPT(2), CPT(3)));
        //        }];
        label.textPadding = UIEdgeInsetsMake(CPT(2), CPT(3), CPT(2), CPT(3));
        label.font = [UIFont systemFontOfSize:CPT(10)];
        label.textColor =[UIColor colorWithHexString:labelModel.textColor] ?: UIColorFromRGB(0xFD3D04);
        label.layer.cornerRadius =CPT(2);
        label.layer.masksToBounds=true;
        //设置边框
        label.layer.borderWidth = CPT(1);
        label.layer.borderColor =([UIColor colorWithHexString:labelModel.textColor] ?: UIColorFromRGB(0xFD3D04)).CGColor;
        label.text = labelModel.labelName;
        label.hidden = NO;
    } else {
        label.hidden = YES;
    }
}
-(void) setPromotionTagContent:(JLSearchResultPitemModel*) model{
    
    NSString * promotionText =model.priceCommissionResp.promotionDTO.promotionDescription;
    BOOL isStart = [HykPriceCommissionUtil isPromotionStart:model.priceCommissionResp];
    if(promotionText.isNotNullOrEmpty){
        [self.promotionTagV setContentWithText: promotionText Pre:!isStart ];
        self.promotionTagV.hidden = NO;
    }else{
        self.promotionTagV.hidden =YES;
    }
}

-(UIView * ) bgView {
    if(!_bgView){
        _bgView =[UIView new];
    }
    return  _bgView;
}

-(UIImageView * ) photoIv {
    if(!_photoIv){
        _photoIv =[UIImageView new];
    }
    return  _photoIv;
}
-(UIImageView * ) soldoutIv {
    if(!_soldoutIv){
        _soldoutIv =[UIImageView new];
    }
    return  _soldoutIv;
}


-(UILabel * ) titleLabel {
    if(!_titleLabel){
        _titleLabel =[UILabel new];
    }
    return  _titleLabel;
}
-(PaddingLabel * ) tag0Label {
    if(!_tag0Label){
        _tag0Label =[PaddingLabel new];
    }
    return  _tag0Label;
}
-(PaddingLabel * ) tag1Label {
    if(!_tag1Label){
        _tag1Label =[PaddingLabel new];
    }
    return  _tag1Label;
}
-(UILabel * ) priceLabel {
    if(!_priceLabel){
        _priceLabel =[UILabel new];
    }
    return  _priceLabel;
}
-(UILabel * ) commissionLabel {
    if(!_commissionLabel){
        _commissionLabel =[UILabel new];
    }
    return  _commissionLabel;
}
-(PromotionTagView * ) promotionTagV {
    if(!_promotionTagV){
        _promotionTagV =[PromotionTagView new];
    }
    return  _promotionTagV;
}
-(UIButton * ) addCartBtn {
    if(!_addCartBtn){
        _addCartBtn =[UIButton new];
    }
    return  _addCartBtn;
}


-(UIButton * ) shareBtn {
    if(!_shareBtn){
        _shareBtn =[UIButton new];
    }
    return  _shareBtn;
}

-(void) setupEvent:(id<IGoodsListItemCellDelegate> ) delegate{
    
    if(delegate){
        @weakify(self);
        [self.contentView addClickAction:^{
            @strongify(self);
            [delegate onClickGoodsListItemCellItem:self model:self.model];
        }];
        [self.addCartBtn addClickAction:^{
            @strongify(self);
            [delegate onClickGoodsListItemCellAddCart:self model:self.model];
        }];
        [self.shareBtn addClickAction:^{
            @strongify(self);
            [delegate onClickGoodsListItemCellShare:self model:self.model];
        }];
    }
}


@end
