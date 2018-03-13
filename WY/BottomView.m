//
//  BottomView.m
//  WY
//
//  Created by 张伟伟 on 2018/2/27.
//  Copyright © 2018年 张伟伟. All rights reserved.
//

#import "BottomView.h"
#import <AVFoundation/AVFoundation.h>

@interface BottomView ()<AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UISlider *musicSlider;
@property (weak, nonatomic) IBOutlet UILabel *progressTime;
@property (weak, nonatomic) IBOutlet UILabel *totalTime;

@property (nonatomic,strong) AVAudioPlayer *player;
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation BottomView

-(AVAudioPlayer *)player {
    if (!_player) {
        NSString *music = [[NSBundle mainBundle] pathForResource:@"001" ofType:@"mp3"];
        NSURL *url = [NSURL fileURLWithPath:music];
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [_player prepareToPlay];
    }
    return _player;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"BottomView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = frame;
        self.totalTime.text = [NSString stringWithFormat:@"%d:%d",(int)self.player.duration / 60 , (int)self.player.duration % 60];
        
        [self.musicSlider addTarget:self action:@selector(changeProgress:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

- (IBAction)playClick:(UIButton *)sender {
    if (sender.selected == NO) {
        self.playButton.selected = YES;
        [self.playButton setTitle:@"暂停" forState:UIControlStateSelected];
        [self playMusic];
    }else {
        sender.selected = NO;
        [self pauseMusic];
    }
}

-(void)changeProgress:(UISlider *)slider {
    self.player.currentTime = self.player.duration * slider.value;
}

-(void)playMusic {
    [self.player play];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}

-(void)pauseMusic {
    [self.player pause];
}

-(void)updateTimer {
    self.progressTime.text = [NSString stringWithFormat:@"%d:%d",(int)self.player.currentTime / 60 , (int)self.player.currentTime % 60];
    self.musicSlider.value = self.player.currentTime / self.player.duration;
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [self.timer invalidate];
}  

@end
