//
//  PYTreeBranchView.h
//  PYTreeBranchView
//
//  Created by MikeZhangpy on 16/9/20.
//  Copyright © 2016年 MikeZhangpy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PYConst.h"

@interface PYTreeBranchView : UIView

@property (nonatomic, copy) NSString *branchText;

- (void)displayInPoint:(CGPoint)point branchDirection:(PYTreeBranchDirection)direction;

- (void)dismiss;

@end
