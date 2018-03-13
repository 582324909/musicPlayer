//
//  PlayViewController.m
//  WY
//
//  Created by 张伟伟 on 2018/2/26.
//  Copyright © 2018年 张伟伟. All rights reserved.
//

#import "PlayViewController.h"
#import "BottomView.h"

@interface PlayViewController ()

@property (strong,nonatomic) UIImageView *backgroundView;
@property (strong,nonatomic) UIImageView *musicView;
@property (strong,nonatomic) UIImageView *lyricView;

@end

@implementation PlayViewController

#pragma mark 懒加载背景
-(UIImageView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIImageView alloc] initWithFrame:self.view.frame];
        _backgroundView.image = [UIImage imageNamed:@"background.jpg"];
        [_backgroundView addSubview:self.musicView];
        
        _backgroundView.userInteractionEnabled = YES;
        
        //添加底部view
        BottomView *bottomView = [[BottomView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 80, self.view.frame.size.width, 80)];
        [_backgroundView addSubview:bottomView];
    }
    return _backgroundView;
}

-(UIImageView *)musicView {
    if (!_musicView) {
        _musicView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.backgroundView.frame.size.width * 0.8  , self.backgroundView.frame.size.width * 0.8  )];
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

-(UIImageView *)lyricView {
    if (!_lyricView) {
        
    }
    return _lyricView;
}

#pragma mark 创建分享item
-(void)createRightItem {
    //创建一个分享item
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:@selector(share)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    //设置导航栏字体颜色
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    //设置导航栏透明
    [self.navigationController.navigationBar setTranslucent:true];
    //把背景设为空
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //处理导航栏有条线的问题
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

#pragma mark 图片点击事件，切换歌词
-(void)clickMusicPicture {
    [self.musicView removeFromSuperview];
    [self clickAnimation];
    UITapGestureRecognizer *click = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBackground:)];
    [self.backgroundView addGestureRecognizer:click];
}

#pragma mark 点击切花歌词动画
-(void)clickAnimation {
    CATransition *transtion = [[CATransition alloc] init];
    transtion.type = @"rippleEffect";
    transtion.subtype = kCATransitionFromBottom;
    transtion.startProgress = 0.5;
    transtion.endProgress = 0.8;
    [self.backgroundView.layer addAnimation:transtion forKey:nil];
}

#pragma mark 切换歌词与专辑图片
-(void)clickBackground:(UITapGestureRecognizer *)click {
    [self.backgroundView addSubview:self.musicView];
    [self clickAnimation];
    [self.backgroundView removeGestureRecognizer:click];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载背景图片
    [self.view addSubview:self.backgroundView];
    
    //加载分享item
    [self createRightItem];
}

#pragma mark 分享
-(void)share {
    NSLog(@"分享");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
