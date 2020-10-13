//
//  HLBFocusedWithDialogViewController.h
//  GuideViewDemo
//
//  Created by HuangLibo on 2020/9/22.
//  Copyright © 2020 HuangLibo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLBFocusedView.h"
#import "HLBDialogView.h"

NS_ASSUME_NONNULL_BEGIN

/// 通过此协议传入自定义 dialogView 的类
@protocol HLBFocusedWithDialogViewControllerDelegate <NSObject>
@required
- (Class)dialogViewClass;
@end

/// 引导页的 controller , 请创建子类来自定义
@interface HLBFocusedWithDialogViewController : UIViewController

@property (nonatomic, strong) HLBFocusedView *focusedView;

@property (nonatomic, strong) HLBDialogView *dialogView;

@property (nonatomic, weak) id<HLBFocusedWithDialogViewControllerDelegate> delegate;

/// 创建引导页 controller
/// @param overlayRect 蒙层的 rect , 一般设置为与屏幕 rect 相同
/// @param focusedRect 需镂空聚焦区域的 rect
/// @param focusedRectCornerRadius 镂空聚焦的区域的圆角值
/// @param overlayBackgroundColor 蒙层的颜色
/// @param arrowPeakPoint 三角形顶点的坐标 (以蒙层为参考坐标)
/// @param arrowSideLength 三角形的`底边`边长 (与会话框相邻的边)
/// @param arrowHeight 三角形的高
/// @param dialogSize 会话框的 size
/// @param dialogStartX 会话框的起始横坐标值
/// @param dialogBackgroundColor 会话框的背景颜色
- (instancetype)initWithOverlayRect:(CGRect)overlayRect
                        focusedRect:(CGRect)focusedRect
            focusedRectCornerRadius:(CGFloat)focusedRectCornerRadius
             overlayBackgroundColor:(UIColor *)overlayBackgroundColor
                     arrowPeakPoint:(CGPoint)arrowPeakPoint
                    arrowSideLength:(CGFloat)arrowSideLength
                        arrowHeight:(CGFloat)arrowHeight
                         dialogSize:(CGSize)dialogSize
                       dialogStartX:(CGFloat)dialogStartX
                    dialogBackgroundColor:(UIColor *)dialogBackgroundColor;

@end

NS_ASSUME_NONNULL_END
