//
//  ExampleViewController.m
//  HLBGuideExample
//
//  Created by HuangLibo on 2020/10/5.
//

#import "ExampleViewController.h"
#import "MyFocusedWithDialogViewController.h"
#import "MyDialogView.h"
#import <HLBGuide/HLBGuide.h>
#import <Masonry.h>

@interface ExampleViewController () <HLBFocusedWithDialogViewControllerDelegate>

// 两个需要被聚焦展示的`示例控件`
@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, strong) UILabel *bannerLabel;

@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    /* 添加需要被聚焦展示的示例控件 */
    
    _bannerLabel = [[UILabel alloc] init];
    _bannerLabel.text = @"点击屏幕, 开始新功能引导";
    _bannerLabel.textAlignment = NSTextAlignmentCenter;
    _bannerLabel.font = [UIFont systemFontOfSize:18.f];
    [self.view addSubview:_bannerLabel];

    _addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:_addBtn];
    
    [_bannerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(200.f);
        make.left.equalTo(self.view).offset(12.f);
        make.right.equalTo(self.view).offset(-12.f);
        make.height.mas_equalTo(50.f);
    }];
    
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(44.f);
        make.right.equalTo(self.view).offset(-48.f);
        make.size.mas_equalTo(CGSizeMake(32.f, 32.f));
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addGuide];
    });
}

- (void)addGuide {
    /* 注: 本例展示简单的不含导航栏的情况, 如果含有导航栏, 计算 focusedRect 时需要考虑导航栏的高度. */
    
    { // 创建和添加第一个引导页
        CGRect focusedRect = _bannerLabel.frame;
        CGPoint arrowPeakPoint = CGPointMake(CGRectGetMidX(_bannerLabel.frame), CGRectGetMaxY(_bannerLabel.frame));
        CGSize dialogSize = CGSizeMake(150.f, 70.f);
        CGFloat dialogStartX = CGRectGetMidX(_bannerLabel.frame) - dialogSize.width / 2.f;
        NSString *descLabelText= @"第一个用户引导";
        [self addGuideWithFocusedRext:focusedRect arrowPeakPoint:arrowPeakPoint dialogSize:dialogSize dialogStartX:dialogStartX descLabelText:descLabelText];
    }
    { // 创建和添加第二个引导页
        CGRect focusedRect = _addBtn.frame;
        CGPoint arrowPeakPoint = CGPointMake(CGRectGetMidX(_addBtn.frame), CGRectGetMaxY(_addBtn.frame));
        CGSize dialogSize = CGSizeMake(200.f, 90);
        CGFloat dialogStartX = arrowPeakPoint.x - dialogSize.width * 0.8;
        NSString *descLabelText= @"文字数量较长的第二个用户引导。";
        [self addGuideWithFocusedRext:focusedRect arrowPeakPoint:arrowPeakPoint dialogSize:dialogSize dialogStartX:dialogStartX descLabelText:descLabelText];
    }
    // 开始展示引导页
    [[HLBFocusedWithDialogManager sharedInstance] show];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self addGuide];
}

- (void)addGuideWithFocusedRext:(CGRect)focusedRect arrowPeakPoint:(CGPoint)arrowPeakPoint dialogSize:(CGSize)dialogSize dialogStartX:(CGFloat)dialogStartX descLabelText:(NSString *)descLabelText {
    CGFloat focusedRectCornerRadius = 6.f;
    CGFloat arrowSideLength = 10.f;
    CGFloat arrowHeight = 8.f;
    CGRect overlayRect = [UIScreen mainScreen].bounds;
    UIColor *dialogBackgroundColor = [UIColor whiteColor];
    UIColor *overlayBackgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    // 创建引导页
    MyFocusedWithDialogViewController *focusedWithDialogVC = [[MyFocusedWithDialogViewController alloc] initWithOverlayRect:overlayRect focusedRect:focusedRect focusedRectCornerRadius:focusedRectCornerRadius overlayBackgroundColor:overlayBackgroundColor arrowPeakPoint:arrowPeakPoint arrowSideLength:arrowSideLength arrowHeight:arrowHeight dialogSize:dialogSize dialogStartX:dialogStartX dialogBackgroundColor:dialogBackgroundColor];
    
    focusedWithDialogVC.delegate = self;
    focusedWithDialogVC.descLabelText = descLabelText;
    // 将引导页添加到 HLBFocusedWithDialogManager 中
    [[HLBFocusedWithDialogManager sharedInstance] addFocusedWithDialogVC:focusedWithDialogVC];
    // 点击自定义页面中的按钮时, 展示下一个引导页
    focusedWithDialogVC.okBtnClickBlock = ^{
        [[HLBFocusedWithDialogManager sharedInstance] show];
    };
    
    // 点击蒙层, 也展示下一个引导
    focusedWithDialogVC.tapViewBlock = ^{
        [[HLBFocusedWithDialogManager sharedInstance] show];
    };
}

#pragma mark - HLBFocusedWithDialogViewControllerDelegate

- (Class)dialogViewClass {
    return [MyDialogView class];
}

@end
