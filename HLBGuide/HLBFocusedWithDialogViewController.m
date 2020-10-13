//
//  HLBFocusedWithDialogViewController.m
//  GuideViewDemo
//
//  Created by HuangLibo on 2020/9/22.
//  Copyright © 2020 HuangLibo. All rights reserved.
//

#import "HLBFocusedWithDialogViewController.h"

@implementation HLBFocusedWithDialogViewController {
    CGRect _overlayRect;
    CGRect _focusedRect;
    CGFloat _focusedRectCornerRadius;
    UIColor *_overlayBackgroundColor;
    CGPoint _arrowPeakPoint;
    CGFloat _arrowSideLength;
    CGFloat _arrowHeight;
    CGFloat _dialogStartX;
    CGSize _dialogSize;
    UIColor *_dialogBackgroundColor;
}

- (instancetype)initWithOverlayRect:(CGRect)overlayRect
                        focusedRect:(CGRect)focusedRect
            focusedRectCornerRadius:(CGFloat)focusedRectCornerRadius
             overlayBackgroundColor:(UIColor *)overlayBackgroundColor
                     arrowPeakPoint:(CGPoint)arrowPeakPoint
                    arrowSideLength:(CGFloat)arrowSideLength
                        arrowHeight:(CGFloat)arrowHeight
                         dialogSize:(CGSize)dialogSize
                       dialogStartX:(CGFloat)dialogStartX
                    dialogBackgroundColor:(UIColor *)dialogBackgroundColor {
    _overlayRect = overlayRect;
    _focusedRect = focusedRect;
    _focusedRectCornerRadius = focusedRectCornerRadius;
    _overlayBackgroundColor = overlayBackgroundColor;
    _arrowPeakPoint = arrowPeakPoint;
    _arrowSideLength = arrowSideLength;
    _arrowHeight = arrowHeight;
    _dialogSize = dialogSize;
    _dialogStartX = dialogStartX;
    _dialogBackgroundColor = dialogBackgroundColor;
    return [self init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    self.view.frame = _overlayRect;
    // 添加包含镂空聚焦的蒙层
    _focusedView = [[HLBFocusedView alloc] initWithOverlayRect:_overlayRect focusedRect:_focusedRect focusedRectCornerRadius:_focusedRectCornerRadius overlayBackgroundColor:_overlayBackgroundColor];
    [self.view addSubview:_focusedView];
    
    if (!self.delegate || ![self.delegate respondsToSelector:@selector(dialogViewClass)]) {
        NSAssert(NO, @"必须实现 `-dialogViewClass` 方法");
    } else {
        // 添加自定义的会话框
        Class cls = [self.delegate dialogViewClass];
        _dialogView = [[cls alloc] initWithArrowPeakPoint:_arrowPeakPoint arrowSideLength:_arrowSideLength arrowHeight:_arrowHeight dialogSize:_dialogSize dialogStartX:_dialogStartX dialogBackgroundColor:_dialogBackgroundColor];
        [self.view addSubview:_dialogView];        
    }
}

@end
