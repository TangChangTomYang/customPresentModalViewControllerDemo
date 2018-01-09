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
    KPopAnimationTypeCenterShow = 0,   // 从中间放大弹出
    KPopAnimationTypeUpDown,            // 从上往下掉
    KPopAnimationTypeDownUp            //
};


@interface YRPopViewController : UIViewController

@property (nonatomic, assign) KPopAnimationType animationType;
@property(nonatomic, strong)YRBlurView *blurView;
@property(nonatomic, strong)UIView *contentView;
@property(nonatomic, assign)CGPoint touchPoint;
@end
