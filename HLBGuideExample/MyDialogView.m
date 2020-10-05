//
//  MyDialogView.m
//  GuideViewDemo
//
//  Created by HuangLibo on 2020/9/22.
//  Copyright © 2020 HuangLibo. All rights reserved.
//

#import "MyDialogView.h"
#import <Masonry/Masonry.h>

const static CGFloat kBtnWidth = 68.f;
const static CGFloat kBtnHeight = 24.f;

@implementation MyDialogView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.layer.cornerRadius = 8.f;
        self.contentView.layer.masksToBounds = YES;
        
        _descLabel = [[UILabel alloc] init];
        _descLabel.numberOfLines = 0;
        _descLabel.textAlignment = NSTextAlignmentCenter;
        _descLabel.textColor = [UIColor grayColor];
        _descLabel.font = [UIFont systemFontOfSize:14.f];
        [self.contentView addSubview:_descLabel];
        
        _okBtn = [[UIButton alloc] init];
        [_okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _okBtn.titleLabel.font = [UIFont systemFontOfSize:16.f];
        _okBtn.backgroundColor = [UIColor orangeColor];
        _okBtn.layer.cornerRadius = kBtnHeight / 2.f;
        _okBtn.layer.masksToBounds = YES;
        [self.contentView addSubview:_okBtn];
        
        [_okBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-10.f);
            make.size.mas_equalTo(CGSizeMake(kBtnWidth, kBtnHeight));
        }];
        
        [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(5.f);
            make.right.equalTo(self.contentView).offset(-5.f);
            make.bottom.equalTo(self.okBtn.mas_top).offset(-8.f);
        }];
    }
    return self;
}

@end
