//
//  PYViewController.m
//  PYTreeBranchView
//
//  Created by MikeZhangpy on 09/20/2016.
//  Copyright (c) 2016 MikeZhangpy. All rights reserved.
//

#import "PYViewController.h"
#import "PYTreeView.h"

@interface PYViewController ()
@property (nonatomic,strong) PYTreeView *treeView;
@end

@implementation PYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.treeView = [PYTreeView setupBranchTextWithArray:@[@"美丽款",@"追星必备",@"addidas"] style:PYTreeStyleDoubleRight];
    [self.view addSubview:self.treeView];
    [self.treeView displayInPoint:CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds))];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEvent:)];
    [self.view addGestureRecognizer:tapGesture];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)tapEvent:(UITapGestureRecognizer *)gesture {
    CGPoint point = [gesture locationInView:gesture.view];
    if (self.treeView.isShow) {
        [self.treeView dismiss];
    }else {
        [self.treeView displayInPoint:point];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
