//
//  CustomAlertView.m
//  test3
//
//  Created by canglong on 2025/5/11.
//

#import "MyCustomAlertView.h"
@interface MyCustomAlertView()
    @property (nonatomic, strong) UILabel *titleLabel;
    @property (nonatomic, strong) UILabel *contentLabel;
    @property (nonatomic, strong) UIButton *cancelButton;
    @property (nonatomic, strong) UIButton *confirmButton;
@end

@implementation MyCustomAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype) initWithTitle:(NSString *) title
                    content:(NSString *) content
                cancelTitle:(NSString *) cancelTitle
                 confirmTitle:(NSString *) confirmTitle{
    self = [super initWithFrame:CGRectZero];
    if(self){
        [self setupUIWithTitle:title content:content cancelTitle:cancelTitle confirmTitle:confirmTitle];
      
    }
    return  self;
}
- (void)setupUIWithTitle:(NSString *)title
                content:(NSString *)content
            cancelTitle:(NSString *)cancelTitle
            confirmTitle:(NSString *)confirmTitle {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 10;
    self.clipsToBounds =YES;
    
    _titleLabel = [[UILabel alloc] init ];
    _titleLabel.text  = title;
    _titleLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:_titleLabel];
    
    _contentLabel = [[UILabel alloc] init ];
    _contentLabel.text  = title;
    _contentLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_contentLabel];
    
    _cancelButton = [[UIButton alloc] init ];
    [_cancelButton setTitle:cancelTitle forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
      
    [self addSubview:_cancelButton];
    
    _confirmButton = [[UIButton alloc] init ];
    [_confirmButton setTitle:confirmTitle forState:UIControlStateNormal];
    [_confirmButton addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchUpInside];
      
    [self addSubview:_confirmButton];
    
}

-(void)cancelAction{
    if(self.cancelBlock){
        self.cancelBlock();
    }
}

-(void) confirmAction{
    if(self.confirmBlock){
        self.confirmBlock();
    }
}


@end
