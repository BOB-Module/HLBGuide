//
//  HLBDialogView.m
//  GuideViewDemo
//
//  Created by HuangLibo on 2020/9/21.
//  Copyright © 2020 HuangLibo. All rights reserved.
//

#import "HLBDialogView.h"

@implementation HLBDialogView {
    // 三角形顶点的坐标 (以外部 view 为坐标系)
    CGPoint _arrowPeakPoint;
    // 三角形的边长
    CGFloat _arrowSideLength;
    // 会话框的大小 (不包括三角形)
    CGSize _dialogSize;
    // 会话框的起始横坐标
    CGFloat _dialogStartX;
    // 会话框的背景色
    UIColor *_dialogBackgroundColor;
    
    // 提示框等边三角形的高度(根据边长计算出来)
    CGFloat _arrowHeight;
    // 三角形顶点在此 view 内的坐标 (以当前 view 为坐标系)
    CGPoint _arrowPeakInnerPoint;
}

- (instancetype)initWithArrowPeakPoint:(CGPoint)arrowPeakPoint
                       arrowSideLength:(CGFloat)arrowSideLength
                            dialogSize:(CGSize)dialogSize
                          dialogStartX:(CGFloat)dialogStartX
                       dialogBackgroundColor:(UIColor *)dialogBackgroundColor {
    _arrowPeakPoint = arrowPeakPoint;
    _arrowSideLength = arrowSideLength;
    _dialogSize = dialogSize;
    _dialogStartX = dialogStartX;
    _dialogBackgroundColor = dialogBackgroundColor;
    
    // 计算三角形的高度
    _arrowHeight = (sqrt(3.f) / 2.f) * _arrowSideLength;
    _arrowPeakInnerPoint = CGPointMake(_arrowPeakPoint.x - _dialogStartX, 0);
    
    return [self initWithFrame:CGRectMake(_dialogStartX, _arrowPeakPoint.y, _dialogSize.width, _dialogSize.height + _arrowHeight)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // iOS 11 中 UIView 的默认 backgroundColor 是黑色, 需要改为透明色
        self.backgroundColor = [UIColor clearColor];
        
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, _arrowHeight, _dialogSize.width, _dialogSize.height)];
        _contentView.backgroundColor = _dialogBackgroundColor;
        [self addSubview:_contentView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGFloat arrowEndY = _arrowPeakInnerPoint.y + _arrowHeight;
    CGFloat arrowLeftX = _arrowPeakInnerPoint.x - _arrowSideLength / 2.f;
    CGFloat arrowRightX = _arrowPeakInnerPoint.x + _arrowSideLength / 2.f;
    
    // 三角形 path
    UIBezierPath *arrowPath = [UIBezierPath bezierPath];
    [arrowPath moveToPoint:_arrowPeakInnerPoint];
    [arrowPath addLineToPoint:CGPointMake(arrowLeftX, arrowEndY)];
    [arrowPath addLineToPoint:CGPointMake(arrowRightX, arrowEndY)];
    [arrowPath closePath];
    
    // 三角形 layer
    CAShapeLayer *arrowLayer = [[CAShapeLayer alloc]init];
    arrowLayer.path = arrowPath.CGPath;
    // 设置三角形`边`的颜色
    arrowLayer.lineWidth = 1;
    arrowLayer.strokeColor = _dialogBackgroundColor.CGColor;
    // 设置三角形的填充色
    arrowLayer.fillColor = _dialogBackgroundColor.CGColor;
    [self.layer addSublayer:arrowLayer];
}

@end
