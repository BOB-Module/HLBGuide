//
//  HLBDialogView.h
//  GuideViewDemo
//
//  Created by HuangLibo on 2020/9/21.
//  Copyright © 2020 HuangLibo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 包含三角形角标的提示框 view , 请创建子类来实现自定义.
@interface HLBDialogView : UIView

/// 在子类中, 请将控件添加到 contentView 里.
@property (nonatomic, strong) UIView *contentView;

- (instancetype)initWithArrowPeakPoint:(CGPoint)arrowPeakPoint
                       arrowSideLength:(CGFloat)arrowSideLength
                           arrowHeight:(CGFloat)arrowHeight
                            dialogSize:(CGSize)dialogSize
                          dialogStartX:(CGFloat)dialogStartX
                       dialogBackgroundColor:(UIColor *)dialogBackgroundColor;

@end

NS_ASSUME_NONNULL_END
