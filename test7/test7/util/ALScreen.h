//
//  ALScreen.h
//  test3
//
//  Created by canglong on 2025/5/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define IS_LANDSCAPE  (false)
#define SCREEN_WIDTH  (IS_LANDSCAPE?  [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT  (IS_LANDSCAPE?  [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define PT(x) UIAdapter(x)
#define CPT(x) UIAdapter(x)
#define UI(x) UIAdapter(x)
#define UIRect(x,y,width,height) UIRectAdapter(x,y,width,height)

static inline NSInteger UIAdapter(float x){
   
    CGFloat scale =375/SCREEN_WIDTH;
    return  (NSInteger)x/scale;
}

static inline CGRect UIRectAdapter(float x,float y,float width,float height){
    return  CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
}


@interface ALScreen : NSObject


@end

NS_ASSUME_NONNULL_END
