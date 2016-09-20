//
//  PYBranchModel.m
//  PYTreeBranchView
//
//  Created by MikeZhangpy on 16/9/20.
//  Copyright © 2016年 MikeZhangpy. All rights reserved.
//

#import "PYBranchModel.h"

@implementation PYBranchModel

+ (instancetype)initlizerStartPoint:(CGPoint)startPoint
                           midPoint:(CGPoint)midPoint
                           endPoint:(CGPoint)endPoint
                          direction:(PYTreeBranchDirection)direction {
    PYBranchModel *branchPoint = [[PYBranchModel alloc] init];
    branchPoint.startPoint = startPoint;
    branchPoint.midPoint = midPoint;
    branchPoint.endPoint = endPoint;
    branchPoint.direction = direction;
    return branchPoint;
}

@end
