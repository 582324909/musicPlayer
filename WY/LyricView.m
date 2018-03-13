//
//  LyricView.m
//  WY
//
//  Created by 张伟伟 on 2018/2/27.
//  Copyright © 2018年 张伟伟. All rights reserved.
//

#import "LyricView.h"

@implementation LyricView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"LyricView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = frame;
    }
    return self;
}

@end
