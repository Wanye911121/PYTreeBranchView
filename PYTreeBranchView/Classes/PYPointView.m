//
//  PYPointView.m
//  PYTreeBranchView
//
//  Created by MikeZhangpy on 16/9/20.
//  Copyright © 2016年 MikeZhangpy. All rights reserved.
//

#import "PYPointView.h"
#import "PYCenterLayer.h"

@interface PYPointView()

@property (nonatomic,strong) UIImageView *centerImageView;

@property (nonatomic,strong) PYCenterLayer *centerLayer;

@end

@implementation PYPointView

- (UIImageView *)centerImageView {
    if (!_centerImageView) {
        _centerImageView = [[UIImageView alloc] init];
        _centerImageView.image = [UIImage imageNamed:@"tag_center"];
    }
    return _centerImageView;
}

- (PYCenterLayer *)centerLayer {
    if (!_centerLayer) {
        _centerLayer = [[PYCenterLayer alloc] init];
        _centerLayer.fromValueForRadius = 0.35;
        _centerLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    }
    return _centerLayer;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.centerImageView];
        [self.layer addSublayer:self.centerLayer];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.centerImageView.frame = self.bounds;
}

- (void)show {
    self.alpha = 1.0;
}

- (void)dismiss {
    self.alpha = 0.0;
}

- (void)startAnimation {
    [self.centerLayer startAnimation];
}

- (void)stopAnimation {
    [self.centerLayer stopAnimation];
}

@end
