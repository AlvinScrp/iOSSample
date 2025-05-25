//
//  RecommendViewController.m
//  test3
//
//  Created by canglong on 2025/5/10.
//

#import "RecommendViewController.h"

@interface RecommendViewController () <UIScrollViewDelegate>

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    CGFloat boundsWidth =self.view.bounds.size.width;
    CGFloat boundsHeight =self.view.bounds.size.height;
    scrollView.contentSize = CGSizeMake(boundsWidth*5, boundsHeight);
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
//    scrollView.contentOffset = CGPointMake(80, 30);
    //UIEdgeInsets
    scrollView.contentInset = UIEdgeInsetsMake(20, 30, 40, 50);

    
    NSArray *colors = @[UIColor.redColor,UIColor.blueColor,UIColor.greenColor,UIColor.systemPinkColor,UIColor.yellowColor];
        
    for (int i = 0; i<5; i++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(boundsWidth*i, 0, boundsWidth, boundsHeight)];
            view.backgroundColor = colors[i];
            view;
        })];
    }
    [self.view addSubview: scrollView];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll %@",@(scrollView.contentOffset.x));
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDragging %@",@(scrollView.contentOffset.x));
}
// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"scrollViewWillEndDragging %@",@(scrollView.contentOffset.x));
}
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging %@",@(scrollView.contentOffset.x));
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
