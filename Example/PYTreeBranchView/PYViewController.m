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

@end

@implementation PYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    PYTreeView *treeView = [PYTreeView setupBranchTextWithArray:@[@"这是第一个标题",@"这是第二个标题",@"这是第三个标题"]];
    [self.view addSubview:treeView];
    [treeView displayInPoint:CGPointMake(100, 100)];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
