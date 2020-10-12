//
//  MyFocusedWithDialogViewController.h
//  GuideViewDemo
//
//  Created by HuangLibo on 2020/9/22.
//  Copyright © 2020 HuangLibo. All rights reserved.
//

#import <HLBFocusedWithDialogViewController.h>

NS_ASSUME_NONNULL_BEGIN

/// 自定义的控制器, 用来管理 MyDialogView 中的控件
@interface MyFocusedWithDialogViewController : HLBFocusedWithDialogViewController

@property (nonatomic, copy) NSString *descLabelText;

@property (nonatomic, copy) NSString *okBtnText;

@property (nonatomic, copy) void(^okBtnClickBlock)(void);

/// 点击蒙层的事件回调
@property (nonatomic, copy) void(^tapViewBlock)(void);

@end

NS_ASSUME_NONNULL_END
