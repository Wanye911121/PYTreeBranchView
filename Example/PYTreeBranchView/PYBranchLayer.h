//
//  PYBranchLayer.h
//  PYTreeBranchView
//
//  Created by MikeZhangpy on 16/9/20.
//  Copyright © 2016年 MikeZhangpy. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "PYConst.h"

@class PYBranchLayer;
typedef void(^PYBranchLayerAnimationCompletion)(BOOL finished, PYBranchLayer *branchLayer);

@interface PYBranchLayer : CAShapeLayer

/**
 *  分支在动画中的朝向
 *
 *	默认是右边
 */
@property (nonatomic, assign) PYTreeBranchDirection direction;

/**
 *  分支在动画的起始位置
 *
 *	默认值 CGPointZero
 */
@property (nonatomic, assign) CGPoint startPoint;

/**
 *  分支在动画的中间位置
 *
 *	默认值 CGPointZero
 */
@property (nonatomic, assign) CGPoint midPoint;

/**
 *  分支在动画的结束位置
 *
 *	默认值 CGPointZero
 */
@property (nonatomic, assign) CGPoint endPoint;

/**
 *  分支动画末梢圆的半径
 *
 *	默认值 3.0
 */
@property (nonatomic, assign) CGFloat radius;

/**
 *  分支动画的结束值
 *
 *	默认值 0.57
 */
@property (nonatomic, assign) CGFloat toValue;

/**
 *	以秒为单位的动画时间.
 *
 *	默认值 0.55
 */
@property (nonatomic, assign) NSTimeInterval animationDuration;

- (void)animationDelay:(NSTimeInterval)delay
            completion:(PYBranchLayerAnimationCompletion)completion;

@end
