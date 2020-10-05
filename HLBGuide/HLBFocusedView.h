//
//  HLBFocusedView.h
//  GuideViewDemo
//
//  Created by HuangLibo on 2020/9/22.
//  Copyright © 2020 HuangLibo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 包含镂空聚焦的蒙层
@interface HLBFocusedView : UIView

- (instancetype)initWithOverlayRect:(CGRect)overlayRect
                        focusedRect:(CGRect)focusedRect
            focusedRectCornerRadius:(CGFloat)focusedRectCornerRadius
             overlayBackgroundColor:(UIColor *)overlayBackgroundColor;

@end

NS_ASSUME_NONNULL_END
