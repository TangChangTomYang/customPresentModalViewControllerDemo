//
//  YRBlurView.m
//  ModeVC
//
//  Created by yangrui on 2018/1/9.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "YRBlurView.h"
#import "UIView+SnapImage.h"
#import "UIImageView+LBBlurredImage.h"

@interface YRBlurView ()

@property(nonatomic, strong)UIImageView *blur;
@end

@implementation YRBlurView

-(UIImageView *)blur{
    if (!_blur) {
        _blur = [[UIImageView alloc]initWithFrame:self.bounds];
    }
    return _blur;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.blur];
    }
    return self;
}

-(void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
    
    UIImage *blurIamge = [newWindow snapShotImage];
    if (blurIamge) {
        [self.blur setImageToBlur:blurIamge blurRadius:5 completionBlock:^{ }];
        [self insertSubview:self.blur atIndex:0];
    }
    
}

@end
