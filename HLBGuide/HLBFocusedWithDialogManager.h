//
//  HLBFocusedWithDialogManager.h
//  GuideViewDemo
//
//  Created by HuangLibo on 2020/9/22.
//  Copyright © 2020 HuangLibo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HLBFocusedWithDialogViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^HLBShowGuideCompleteBlock)(void);

/// 管理多个引导页的 manager
@interface HLBFocusedWithDialogManager : NSObject

+ (instancetype)sharedInstance;

/// 指定蒙层 window 的级别
@property(nonatomic) UIWindowLevel windowLevel;

/// 引导结束后的回调
@property(nonatomic, copy) HLBShowGuideCompleteBlock showGuideCompleteBlock;

/// 向 manager 中添加一个引导页 controller
/// @param focusedWithDialogVC 引导页 controller
- (void)addFocusedWithDialogVC:(HLBFocusedWithDialogViewController *)focusedWithDialogVC;

/// 展示已添加的引导页
- (void)show;

// 以下方法不可用, 请使用单例
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
