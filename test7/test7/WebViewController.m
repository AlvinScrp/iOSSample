//
//  WebViewController.m
//  test3
//
//  Created by canglong on 2025/5/12.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()<WKNavigationDelegate>
@property (nonatomic,strong,readwrite) WKWebView *webView;
@property (nonatomic,strong,readwrite) UIProgressView *progressView;
@property (nonatomic,strong) NSString * urlString;

@end

@implementation WebViewController

-(instancetype) initWithNSUrlString:(NSString *) urlString{
    if(self = [super init]){
        self.urlString = urlString;
    }
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =UIColor.whiteColor;
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0,100,self.view.frame.size.width, 20)];
        self.progressView;
    })];
    [self.view addSubview:({
        self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0,120,self.view.frame.size.width, self.view.frame.size.height)];
        self.webView;
    })];
    self.webView.navigationDelegate = self;
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:(NSKeyValueObservingOptionNew) context:nil];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction preferences:(WKWebpagePreferences *)preferences decisionHandler:( void (^)(WKNavigationActionPolicy, WKWebpagePreferences *))decisionHandler {
    NSLog(@"--->webView decidePolicyForNavigationAction preferences decisionHandler");
    decisionHandler(WKNavigationActionPolicyAllow,preferences);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"--->webView didFinishNavigation %@",navigation);
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"--->webView observeValueForKeyPath %@ %@",keyPath,change);
    self.progressView.progress =self.webView.estimatedProgress;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)  dealloc{
//    [self.view removeObserver:self forKeyPath:@"estimatedProgress"];
}

@end
