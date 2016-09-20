//
//  PYBranchModel.h
//  PYTreeBranchView
//
//  Created by MikeZhangpy on 16/9/20.
//  Copyright © 2016年 MikeZhangpy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PYConst.h"

@interface PYBranchModel : NSObject

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

+ (instancetype)initlizerStartPoint:(CGPoint)startPoint
                           midPoint:(CGPoint)midPoint
                           endPoint:(CGPoint)endPoint
                          direction:(PYTreeBranchDirection)direction;


@end
