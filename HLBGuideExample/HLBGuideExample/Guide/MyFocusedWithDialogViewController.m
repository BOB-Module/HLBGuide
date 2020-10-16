//
//  MyFocusedWithDialogViewController.m
//  GuideViewDemo
//
//  Created by HuangLibo on 2020/9/22.
//  Copyright © 2020 HuangLibo. All rights reserved.
//

#import "MyFocusedWithDialogViewController.h"
#import "MyDialogView.h"

@interface MyFocusedWithDialogViewController ()

@end

@implementation MyFocusedWithDialogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyDialogView *myDialogView = (MyDialogView *)self.dialogView;
    myDialogView.descLabel.text = self.descLabelText;
    [myDialogView.okBtn setTitle:@"知道了" forState:UIControlStateNormal];
    [myDialogView.okBtn addTarget:self action:@selector(okBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
    [self.view addGestureRecognizer:gesture];
}

- (void)okBtnClick:(UIButton *)sender {
    if (self.okBtnClickBlock) {
        self.okBtnClickBlock();
    }
}

- (void)tapView:(UIGestureRecognizer *)gesture {
    if (self.tapViewBlock) {
        self.tapViewBlock();
    }
}

@end
