# PYTreeBranchView

[![CI Status](http://img.shields.io/travis/MikeZhangpy/PYTreeBranchView.svg?style=flat)](https://travis-ci.org/MikeZhangpy/PYTreeBranchView)
[![Version](https://img.shields.io/cocoapods/v/PYTreeBranchView.svg?style=flat)](http://cocoapods.org/pods/PYTreeBranchView)
[![License](https://img.shields.io/cocoapods/l/PYTreeBranchView.svg?style=flat)](http://cocoapods.org/pods/PYTreeBranchView)
[![Platform](https://img.shields.io/cocoapods/p/PYTreeBranchView.svg?style=flat)](http://cocoapods.org/pods/PYTreeBranchView)

## Using

initalize：

```
[PYTreeView setupBranchTextWithArray:@[@"这是第一个标题",@"这是第二个标题",@"这是第三个标题"] style:PYTreeStyleDoubleLeft];
[self.view addSubview:self.treeView];
```

display：

```
[self.treeView displayInPoint:CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds))];

```

## Effect

four style for tree

![image](https://github.com/MikeZhangpy/PYTreeBranchView/blob/master/sample1.png)  

![image](https://github.com/MikeZhangpy/PYTreeBranchView/blob/master/sample2.png) 


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PYTreeBranchView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PYTreeBranchView"
```

## Author

MikeZhangpy, zhangpy1991@126.com

## License

PYTreeBranchView is available under the MIT license. See the LICENSE file for more info.


