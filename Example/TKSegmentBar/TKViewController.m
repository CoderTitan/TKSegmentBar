//
//  TKViewController.m
//  TKSegmentBar
//
//  Created by CoderTitan on 08/30/2018.
//  Copyright (c) 2018 CoderTitan. All rights reserved.
//

#import "TKViewController.h"
#import "TKSegmentBar.h"
#import "UIView+Layout.h"

// 屏幕尺寸相关
#define kScreenBounds [[UIScreen mainScreen] bounds]
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface TKViewController ()<UIScrollViewDelegate, TKSegmentBarDelegate>

@property (nonatomic, strong) TKSegmentBar *segmentBar;

@property (nonatomic, weak) UIScrollView *contentScrollView;

@end

@implementation TKViewController
@synthesize segmentBar = _segmentBar;

- (TKSegmentBar *)segmentBar {
    if (!_segmentBar) {
        _segmentBar = [TKSegmentBar segmentBarWithConfig:[TKSegmentConfig defaultConfig]];
        _segmentBar.delegate = self;
    }
    return _segmentBar;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 添加几个自控制器
    // 在contentView, 展示子控制器的视图内容
    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:vc1];
    
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:vc2];
    
    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:vc3];
    
    
    // 2. 添加内容视图
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64 + 20, kScreenWidth, kScreenHeight - (64 + 20 + 0))];
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    self.contentScrollView = scrollView;
    self.contentScrollView.contentSize = CGSizeMake(self.contentScrollView.frame.size.width * self.childViewControllers.count, 0);
    [self.view addSubview:scrollView];


    self.navigationItem.titleView = self.segmentBar;
    self.segmentBar.segmentModels = @[@"专辑", @"声音", @"下载中"];
    self.segmentBar.selectIndex = 0;
}


- (void)showControllerView:(NSInteger)index {
    
    UIView *view = self.childViewControllers[index].view;
    CGFloat contentViewW = self.contentScrollView.frame.size.width;
    view.frame = CGRectMake(contentViewW * index, 0, contentViewW, self.contentScrollView.frame.size.height);
    [self.contentScrollView addSubview:view];
    [self.contentScrollView setContentOffset:CGPointMake(contentViewW * index, 0) animated:YES];
    
    
}

- (void)segmentBarDidSelectIndex: (NSInteger)toIndex fromIndex: (NSInteger)fromIndex
{
    [self showControllerView:toIndex];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSInteger page = scrollView.contentOffset.x / scrollView.width;
    self.segmentBar.selectIndex = page;
    
}



@end
