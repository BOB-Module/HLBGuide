//
//  MyDialogView.h
//  GuideViewDemo
//
//  Created by HuangLibo on 2020/9/22.
//  Copyright © 2020 HuangLibo. All rights reserved.
//

#import <HLBDialogView.h>

NS_ASSUME_NONNULL_BEGIN

/// 自定义的会话框 view
@interface MyDialogView : HLBDialogView

@property (nonatomic, strong) UILabel *descLabel;

@property (nonatomic, strong) UIButton *okBtn;

@end

NS_ASSUME_NONNULL_END
