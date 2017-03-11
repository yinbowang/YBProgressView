//
//  ViewController.m
//  进度条
//
//  Created by wyb on 2017/3/11.
//  Copyright © 2017年 中天易观. All rights reserved.
//

#import "ViewController.h"
#import "YBProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YBProgressView *view = [[YBProgressView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    view.progressWidth = 6.0;
    view.bottomCircleColor = [UIColor yellowColor];
    view.topCircleColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
       
        view.progress += 0.01;
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
