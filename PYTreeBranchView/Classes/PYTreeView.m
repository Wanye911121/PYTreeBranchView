//
//  PYTreeView.m
//  PYTreeBranchView
//
//  Created by MikeZhangpy on 16/9/20.
//  Copyright © 2016年 MikeZhangpy. All rights reserved.
//

#import "PYTreeView.h"
#import "PYTreeBranchView.h"
#import "PYPointView.h"
#import "PYBranchLayer.h"
#import "PYBranchModel.h"

static const CGFloat kCenterPointWH = 12.f;

@interface PYTreeView()

@property (nonatomic,strong) NSArray *branchTextArray;

@property (nonatomic,assign) NSInteger branchCount;

@property (nonatomic,strong) PYTreeBranchView *firstBranchView;

@property (nonatomic,strong) PYTreeBranchView *secondBranchView;

@property (nonatomic,strong) PYTreeBranchView *thirdBranchView;

@property (nonatomic,strong) PYPointView *centerPointView;

@property (nonatomic,strong) PYBranchLayer *firstBranchLayer;

@property (nonatomic,strong) PYBranchLayer *secondBranchLayer;

@property (nonatomic,strong) PYBranchLayer *thirdBranchLayer;

@property (nonatomic,assign) PYTreeStyle treeStyle;

@property (nonatomic, strong) NSMutableArray *branchPoints;

@property (nonatomic,assign,readwrite) BOOL isShow;

@end

@implementation PYTreeView

#pragma mark - lazyinit

- (PYBranchLayer *)firstBranchLayer {
    if (!_firstBranchLayer) {
        _firstBranchLayer = [[PYBranchLayer alloc] init];
    }
    return _firstBranchLayer;
}

- (PYBranchLayer *)secondBranchLayer {
    if (!_secondBranchLayer) {
        _secondBranchLayer = [[PYBranchLayer alloc] init];
        _secondBranchLayer.toValue = 0.6f;
    }
    return _secondBranchLayer;
}

- (PYBranchLayer *)thirdBranchLayer {
    if (!_thirdBranchLayer) {
        _thirdBranchLayer = [[PYBranchLayer alloc] init];
    }
    return _thirdBranchLayer;
}

- (PYTreeBranchView *)firstBranchView {
    if (!_firstBranchView) {
        _firstBranchView = [[PYTreeBranchView alloc] initWithFrame:CGRectZero];
    }
    return _firstBranchView;
}

- (PYTreeBranchView *)secondBranchView {
    if (!_secondBranchView) {
        _secondBranchView = [[PYTreeBranchView alloc] initWithFrame:CGRectZero];
    }
    return _secondBranchView;
}

- (PYTreeBranchView *)thirdBranchView {
    if (!_thirdBranchView) {
        _thirdBranchView = [[PYTreeBranchView alloc] initWithFrame:CGRectZero];
    }
    return _thirdBranchView;
}

- (PYPointView *)centerPointView {
    if (!_centerPointView) {
        _centerPointView = [[PYPointView alloc] initWithFrame:CGRectMake(0, 0, kCenterPointWH, kCenterPointWH)];
        _centerPointView.alpha = 0;
        _centerPointView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    }
    return _centerPointView;
}

- (NSMutableArray *)branchPoints {
    if (!_branchPoints) {
        _branchPoints = [[NSMutableArray alloc] init];
        
        CGPoint center = CGPointMake(CGRectGetMidX(self.bounds),CGRectGetMidY(self.bounds));
        
        [_branchPoints addObject:[PYBranchModel initlizerStartPoint:center
                                                           midPoint:CGPointMake(center.x - 20, center.y + 35)
                                                           endPoint:CGPointMake(center.x - 40, center.y + 35)
                                                          direction:PYTreeBranchDirectionLeft]];
        [_branchPoints addObject:[PYBranchModel initlizerStartPoint:center
                                                           midPoint:CGPointMake(center.x - 10, center.y)
                                                           endPoint:CGPointMake(center.x - 30, center.y)
                                                          direction:PYTreeBranchDirectionLeft]];
        [_branchPoints addObject:[PYBranchModel initlizerStartPoint:center
                                                           midPoint:CGPointMake(center.x - 20, center.y - 35)
                                                           endPoint:CGPointMake(center.x - 40, center.y - 35)
                                                          direction:PYTreeBranchDirectionLeft]];
        
        [_branchPoints addObject:[PYBranchModel initlizerStartPoint:center
                                                           midPoint:CGPointMake(center.x + 20, center.y + 35)
                                                           endPoint:CGPointMake(center.x + 40, center.y + 35)
                                                          direction:PYTreeBranchDirectionRight]];
        [_branchPoints addObject:[PYBranchModel initlizerStartPoint:center
                                                           midPoint:CGPointMake(center.x + 10, center.y)
                                                           endPoint:CGPointMake(center.x + 30, center.y)
                                                          direction:PYTreeBranchDirectionRight]];
        [_branchPoints addObject:[PYBranchModel initlizerStartPoint:center
                                                           midPoint:CGPointMake(center.x + 20, center.y - 35)
                                                           endPoint:CGPointMake(center.x + 40, center.y - 35)
                                                          direction:PYTreeBranchDirectionRight]];
    }
    return _branchPoints;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    [self.layer addSublayer:self.firstBranchLayer];
    [self.layer addSublayer:self.secondBranchLayer];
    [self.layer addSublayer:self.thirdBranchLayer];
    [self addSubview:self.firstBranchView];
    [self addSubview:self.secondBranchView];
    [self addSubview:self.thirdBranchView];
    [self addSubview:self.centerPointView];
}

+ (instancetype)setupBranchTextWithArray:(NSArray *)textArray style:(PYTreeStyle)treeStyle {
    
    PYTreeView * treeView = [[PYTreeView alloc] init];
    treeView.branchCount = textArray.count;
    treeView.branchTextArray = [textArray copy];
    treeView.firstBranchView.branchText = textArray[0];
    treeView.secondBranchView.branchText = textArray[1];
    treeView.thirdBranchView.branchText = textArray[2];
    treeView.treeStyle = treeStyle;
    return treeView;
}

- (void)displayInPoint:(CGPoint)point {
    self.alpha = 1;
    self.center = point;
    
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    [self.centerPointView show];
    self.centerPointView.alpha = 1.0;
    self.centerPointView.center = center;
    
    [self animation];
    
    self.isShow = YES;
}

- (void)animation {
    switch (self.treeStyle) {
        case PYTreeStyleAllLeft: {
            [self setupBranchLayer:self.firstBranchLayer branchPoint:self.branchPoints[2]];
            [self setupBranchLayer:self.secondBranchLayer branchPoint:self.branchPoints[1]];
            [self setupBranchLayer:self.thirdBranchLayer branchPoint:self.branchPoints[0]];
            break;
        }
        case PYTreeStyleAllRight: {
            [self setupBranchLayer:self.firstBranchLayer branchPoint:self.branchPoints[5]];
            [self setupBranchLayer:self.secondBranchLayer branchPoint:self.branchPoints[4]];
            [self setupBranchLayer:self.thirdBranchLayer branchPoint:self.branchPoints[3]];
            break;
        }
        case PYTreeStyleDoubleLeft: {
            [self setupBranchLayer:self.firstBranchLayer branchPoint:self.branchPoints[2]];
            [self setupBranchLayer:self.secondBranchLayer branchPoint:self.branchPoints[4]];
            [self setupBranchLayer:self.thirdBranchLayer branchPoint:self.branchPoints[0]];
            break;
        }
        case PYTreeStyleDoubleRight: {
            [self setupBranchLayer:self.firstBranchLayer branchPoint:self.branchPoints[5]];
            [self setupBranchLayer:self.secondBranchLayer branchPoint:self.branchPoints[1]];
            [self setupBranchLayer:self.thirdBranchLayer branchPoint:self.branchPoints[3]];
            break;
        }
        default:
            break;
    }
    
    [self.centerPointView stopAnimation];
    [self.firstBranchView dismiss];
    [self.secondBranchView dismiss];
    [self.thirdBranchView dismiss];
    
    __weak typeof(self) weakSelf = self;
    [self.firstBranchLayer animationDelay:0.0 completion:^(BOOL finished, PYBranchLayer *branchLayer) {
        if (finished) {
            [weakSelf.firstBranchView displayInPoint:branchLayer.endPoint branchDirection:branchLayer.direction];
            [weakSelf.centerPointView startAnimation];
        }
    }];
    [self.secondBranchLayer animationDelay:0.0 completion:^(BOOL finished, PYBranchLayer *branchLayer) {
        if (finished) {
            [weakSelf.secondBranchView displayInPoint:branchLayer.endPoint branchDirection:branchLayer.direction];
        }
    }];
    [self.thirdBranchLayer animationDelay:0.0 completion:^(BOOL finished, PYBranchLayer *branchLayer) {
        if (finished) {
            [weakSelf.thirdBranchView displayInPoint:branchLayer.endPoint branchDirection:branchLayer.direction];
        }
    }];
}

- (void)setupBranchLayer:(PYBranchLayer *)branchLayer branchPoint:(PYBranchModel *)branchPoint {
    [self setupBranchLayer:branchLayer
                startPoint:branchPoint.startPoint
                  midPoint:branchPoint.midPoint
                  endPoint:branchPoint.endPoint
                 direction:branchPoint.direction];
}

- (void)setupBranchLayer:(PYBranchLayer *)branchLayer startPoint:(CGPoint)startPoint midPoint:(CGPoint)midPoint endPoint:(CGPoint)endPoint direction:(PYTreeBranchDirection)direction {
    branchLayer.startPoint = startPoint;
    branchLayer.direction = direction;
    branchLayer.midPoint = midPoint;
    branchLayer.endPoint = endPoint;
    branchLayer.radius = 3;
}

- (void)dismiss {
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.isShow = NO;
    }];
}

@end
