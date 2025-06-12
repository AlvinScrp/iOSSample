//
//  PromotionTagView.m
//  test7
//
//  Created by canglong on 2025/6/9.
//

#import "PromotionTagView.h"
#import "CLUtilIndex.h"
@interface PromotionTagView()

@property UILabel *textLabel;
@property UIImageView * slashIv;
@property UIView *textBg;
@property CAGradientLayer *gradientLayer;

@end

@implementation PromotionTagView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void) createUI{
    
    self.textLabel = [UILabel new];
    self.slashIv =[UIImageView new];
    self.textBg =[UIView new];
    
    [self addSubview:self.textBg];
    [self addSubview:self.textLabel];
    [self addSubview:self.slashIv];
   
    
    [self.textBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self).inset(CPT(3));
        make.height.mas_equalTo(CPT(16));
    }];
    [self.slashIv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self);
        make.width.mas_equalTo(CPT(9));
        make.height.mas_equalTo(CPT(16));
    }];
    
    self.textLabel.font = [UIFont systemFontOfSize:CPT(10)];
    self.textLabel.textColor =UIColor.whiteColor;
//    self.textBg.backgroundColor=UIColor.systemPinkColor;
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.textBg).inset(CPT(9));
        make.right.mas_equalTo(self.textBg).inset(CPT(6));
        make.centerY.mas_equalTo(self.textBg);
    }];
}


- (void) setContentWithText:(NSString *)text Pre:(BOOL) pre{
    self.textLabel.text = text;
    [self.slashIv loadCdnUrl:promiotion_tag_slash.cdnString];
    
    CAGradientLayer * gradientLayer =[CAGradientLayer layer];

    // 设置渐变方向（从左到右）
    gradientLayer.startPoint = CGPointMake(0.0, 0.5);  // 左中点
    gradientLayer.endPoint = CGPointMake(1.0, 0.5);    // 右中点

    // 设置渐变色
    if (pre) {
        gradientLayer.colors = @[
            (id)UIColorFromRGB(0xFF19A924).CGColor,
            (id)UIColorFromRGB(0xFF19A96B).CGColor
        ];
    }else{
        gradientLayer.colors = @[
            (id)UIColorFromRGB(0xFFFE3720).CGColor,
            (id)UIColorFromRGB(0xFFFC077D).CGColor
        ];
    }
   
    gradientLayer.locations = @[@(0.0), @(1.0)];

    // 确保 frame 设置正确
    gradientLayer.frame = self.textBg.bounds;

    // 设置圆角
    gradientLayer.cornerRadius = 0;
    gradientLayer.masksToBounds = YES;  // 确保圆角生效

    // 添加到图层
    [self.textBg.layer insertSublayer:gradientLayer atIndex:0];
    
    self. gradientLayer = gradientLayer;
}

-(void) layoutSubviews{
    [super layoutSubviews];
    if(self.textBg){
    // 更新渐变层的 frame
        if (self.gradientLayer) {
            self.gradientLayer.frame = self.textBg.bounds;
        }
  
        // 创建圆角路径
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.textBg.bounds
                                                   byRoundingCorners:UIRectCornerTopRight|UIRectCornerBottomRight
                                                         cornerRadii:CGSizeMake(CPT(3), CPT(3))];

    //    // 创建形状遮罩
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.path = path.CGPath;
    self.textBg.layer.mask = maskLayer;
    }
    
}

@end
