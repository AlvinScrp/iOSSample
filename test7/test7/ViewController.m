//
//  ViewController.m
//  test7
//
//  Created by canglong on 2025/5/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] init];
    label.frame =CGRectMake(100, 100, 200, 100);
    label.text=@"sdsdsdsdsd";
    [self.view addSubview:label];
}


@end
