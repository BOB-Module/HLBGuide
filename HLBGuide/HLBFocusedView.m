//
//  HLBFocusedView.m
//  GuideViewDemo
//
//  Created by HuangLibo on 2020/9/22.
//  Copyright © 2020 HuangLibo. All rights reserved.
//

#import "HLBFocusedView.h"

@implementation HLBFocusedView {
    CGRect _overlayRect;
    CGRect _focusedRect;
    CGFloat _focusedRectCornerRadius;
    UIColor *_overlayBackgroundColor;
}

- (instancetype)initWithOverlayRect:(CGRect)overlayRect
                        focusedRect:(CGRect)focusedRect
            focusedRectCornerRadius:(CGFloat)focusedRectCornerRadius
             overlayBackgroundColor:(UIColor *)overlayBackgroundColor {
    _overlayRect = overlayRect;
    _focusedRect = focusedRect;
    _focusedRectCornerRadius = focusedRectCornerRadius;
    _overlayBackgroundColor = overlayBackgroundColor;
    return [self initWithFrame:_overlayRect];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // iOS 11 中 UIView 的默认 backgroundColor 是黑色, 需要改为透明色
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // 贝塞尔曲线画一个矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:_overlayRect];
    // bezierPathByReversingPath 表示反向绘制
    [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:_focusedRect cornerRadius:_focusedRectCornerRadius] bezierPathByReversingPath]];
    // 创建一个 CAShapeLayer 图层
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = _overlayBackgroundColor.CGColor;
    shapeLayer.path = path.CGPath;
    [self.layer addSublayer:shapeLayer];
}

@end
