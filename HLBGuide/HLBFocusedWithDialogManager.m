//
//  HLBFocusedWithDialogManager.m
//  GuideViewDemo
//
//  Created by HuangLibo on 2020/9/22.
//  Copyright © 2020 HuangLibo. All rights reserved.
//

#import "HLBFocusedWithDialogManager.h"

@interface HLBFocusedWithDialogManager ()

/// 容纳引导页的 window
@property (nonatomic, strong) UIWindow *window;

/// 所有的引导页 controller
@property (nonatomic, copy) NSMutableArray<HLBFocusedWithDialogViewController *> *focusedWithDialogVCs;

/// 当前展示的引导页的索引
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation HLBFocusedWithDialogManager

+ (instancetype)sharedInstance {
    static id sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _focusedWithDialogVCs = [NSMutableArray array];
        _currentIndex = 0;
    }
    return self;
}

- (void)addFocusedWithDialogVC:(HLBFocusedWithDialogViewController *)focusedWithDialogVC {
    [_focusedWithDialogVCs addObject:focusedWithDialogVC];
}

- (void)show {
    if (_currentIndex >= _focusedWithDialogVCs.count) { // 所有的引导页都展示之后, 关闭 window, 并重置内部变量
        [self dismiss];
        _currentIndex = 0;
        [_focusedWithDialogVCs removeAllObjects];
        return;
    }
    
    // 取出当前要展示的引导页
    HLBFocusedWithDialogViewController *focusedWithDialogVC = [_focusedWithDialogVCs objectAtIndex:_currentIndex++];
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:focusedWithDialogVC.view.frame];
    }
    _window.rootViewController = focusedWithDialogVC;
    [_window makeKeyAndVisible];
}

- (void)dismiss {
    _window.hidden = YES;
    _window.rootViewController = nil;
    _window = nil;
}

@end
