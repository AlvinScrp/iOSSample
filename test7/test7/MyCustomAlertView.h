//
//  CustomAlertView.h
//  test3
//
//  Created by canglong on 2025/5/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCustomAlertView : UIView

-(instancetype) initWithTitle:(NSString *) title
                    content:(NSString *) content
                cancelTitle:(NSString *) cancelTitle
                 confirmTitle:(NSString *) confirmTitle;

@property (nonatomic, copy) void (^cancelBlock)(void);
@property (nonatomic, copy) void (^confirmBlock)(void);
@end

NS_ASSUME_NONNULL_END
