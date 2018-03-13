//
//  HomeViewController.m
//  WY
//
//  Created by 张伟伟 on 2018/2/26.
//  Copyright © 2018年 张伟伟. All rights reserved.
//

#import "HomeViewController.h"
#import "PlayViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 100, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(testBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
    
    
}

-(void)testBtn {

    PlayViewController *play = [[PlayViewController alloc] init];
    [self.navigationController pushViewController:play animated:YES];
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
