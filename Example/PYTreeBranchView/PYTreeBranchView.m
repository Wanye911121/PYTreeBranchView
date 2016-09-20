//
//  PYTreeBranchView.m
//  PYTreeBranchView
//
//  Created by MikeZhangpy on 16/9/20.
//  Copyright © 2016年 MikeZhangpy. All rights reserved.
//

#import "PYTreeBranchView.h"

static const CGFloat kBranchViewH = 25.f;
static const CGFloat kBranchPadding = 10.f;

@interface PYTreeBranchView()

@property (nonatomic,strong) UILabel *textLabel;
@property (nonatomic,strong) UIImageView *backgroundImageView;

@end

@implementation PYTreeBranchView

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.font = [UIFont systemFontOfSize:10];
    }
    return _textLabel;
}

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
    }
    return _backgroundImageView;
}

- (void)setBranchText:(NSString *)branchText {
    _branchText = branchText;
    self.textLabel.text= branchText;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backgroundImageView];
        [self addSubview:self.textLabel];
        
        [self dismiss];
    }
    return self;
}

- (void)displayInPoint:(CGPoint)point branchDirection:(PYTreeBranchDirection)direction {

    [self.textLabel sizeToFit];
    CGFloat width = CGRectGetWidth(self.textLabel.bounds) + kBranchPadding;
    
    CGRect frame = CGRectZero;
    
    if (direction == PYTreeBranchDirectionLeft) {
        frame = CGRectMake(point.x - width - 8, point.y - kBranchViewH / 2.0, width, kBranchViewH);
    }else {
        frame = CGRectMake(point.x + 8, point.y - kBranchViewH / 2.0, width, kBranchViewH);
    }
    
    if (!self.textLabel.text.length) {
        frame.size = CGSizeZero;
    }
    
    self.textLabel.center = CGPointMake(CGRectGetWidth(frame) / 2.0, CGRectGetHeight(frame) / 2.0);
    
    [self setupBackgroundImageWithDirection:direction];
    self.frame = frame;
    self.backgroundImageView.frame = self.bounds;
    
    
    self.alpha = 0.0;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1.0;
    } completion:^(BOOL finished) {
    }];
}

- (void)setupBackgroundImageWithDirection:(PYTreeBranchDirection)direction {
    
    if (direction == PYTreeBranchDirectionLeft) {
        [self.backgroundImageView setImage:[UIImage imageNamed:@"tag-background-left"]];
    }else {
        [self.backgroundImageView setImage:[UIImage imageNamed:@"tag-background-right"]];
    }
}

- (void)dismiss {
    self.alpha = 0.0;
}

@end
