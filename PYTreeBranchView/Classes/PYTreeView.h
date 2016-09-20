//
//  PYTreeView.h
//  PYTreeBranchView
//
//  Created by MikeZhangpy on 16/9/20.
//  Copyright © 2016年 MikeZhangpy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PYConst.h"

@interface PYTreeView : UIView

@property (nonatomic,assign,readonly) BOOL isShow;

+ (instancetype)setupBranchTextWithArray:(NSArray *)textArray style:(PYTreeStyle)treeStyle;

- (void)displayInPoint:(CGPoint)point;

- (void)dismiss;

@end
