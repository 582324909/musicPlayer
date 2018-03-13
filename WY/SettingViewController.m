//
//  SettingViewController.m
//  WY
//
//  Created by 张伟伟 on 2018/2/26.
//  Copyright © 2018年 张伟伟. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@property (strong,nonatomic) UIImageView *musicView;

@end

@implementation SettingViewController

-(UIImageView *)musicView {
    if (!_musicView) {
        _musicView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.8  , self.view.frame.size.width * 0.8  )];
        _musicView.center = self.view.center;
        _musicView.image = [UIImage imageNamed:@"music.jpeg"];
        _musicView.layer.cornerRadius = _musicView.frame.size.width / 2;
        _musicView.layer.masksToBounds = YES;
        
        //添加事件
        _musicView.userInteractionEnabled = YES;
        UITapGestureRecognizer *click = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickMusicPicture)];
        [_musicView addGestureRecognizer:click];
    }
    return _musicView;
}

-(void)clickMusicPicture {
    NSLog(@"点击");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.musicView];
    
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
