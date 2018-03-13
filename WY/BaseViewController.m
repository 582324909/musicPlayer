//
//  BaseViewController.m
//  WY
//
//  Created by 张伟伟 on 2018/2/26.
//  Copyright © 2018年 张伟伟. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

/**************隐藏与现实bar******************/
- (void)viewDidAppear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = YES;
}

-(void)viewDidDisappear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = NO;
}
/*******************************************/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
