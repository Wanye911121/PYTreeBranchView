//
//  PYCenterLayer.h
//  PYTreeBranchView
//
//  Created by MikeZhangpy on 16/9/20.
//  Copyright © 2016年 MikeZhangpy. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface PYCenterLayer : CAReplicatorLayer

/**
 *  脉冲动画的重复次数
 *
 *	默认值 1.
 */
@property (nonatomic, assign) CGFloat repeatTimes;

/**
 *  缩放动画开始的半径值
 *
 *	默认值 0.0
 */
@property (nonatomic, assign) CGFloat fromValueForRadius;

/**
 *  透明动画开始的透明度值
 *
 *	默认值 0.45
 */
@property (nonatomic, assign) CGFloat fromValueForAlpha;

/**
 *	关键帧动画中，透明度的中间值
 *
 *	默认值 0.2
 */
@property (nonatomic, assign) CGFloat keyTimeForHalfOpacity;

/**
 *  圆形脉冲的半径
 *
 *	默认值 15pt.
 */
@property (nonatomic, assign) CGFloat radius;

/**
 *	以秒为单位的动画时间.
 *
 *	默认值 1.0
 */
@property (nonatomic, assign) NSTimeInterval animationDuration;

/**
 *  圆形脉冲的个数
 *
 *	默认值 1
 */
@property (nonatomic, assign) NSInteger focusLayerNumber;

- (void)startAnimation;
- (void)stopAnimation;

@end
