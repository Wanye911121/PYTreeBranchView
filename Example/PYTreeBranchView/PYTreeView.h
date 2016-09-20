//
//  PYTreeView.h
//  PYTreeBranchView
//
//  Created by MikeZhangpy on 16/9/20.
//  Copyright © 2016年 MikeZhangpy. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PYTreeView : UIView

+ (instancetype)setupBranchTextWithArray:(NSArray *)textArray;

- (void)displayInPoint:(CGPoint)point;

- (void)dismiss;

@end
