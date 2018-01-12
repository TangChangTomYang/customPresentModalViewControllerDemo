//
//  YRPopViewController.h
//  ModeVC
//
//  Created by yangrui on 2018/1/9.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YRBlurView.h"
typedef NS_ENUM(NSUInteger, KPopAnimationType){
    KPopAnimationType_none,
    KPopAnimationTypeCenterShow = 1,   // 从中间放大弹出
    
};


@interface YRPopViewController : UIViewController

@property(nonatomic, assign) KPopAnimationType animationType;
// 可以不设置
@property(nonatomic, assign)CGPoint touchPoint;

@property(nonatomic, strong)YRBlurView *blurView;
@property(nonatomic, strong)UIView *contentView;

@end
