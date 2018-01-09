//
//  YRPopAnimationControl.h
//  ModeVC
//
//  Created by yangrui on 2018/1/9.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YRPopViewController.h"

@interface YRPopAnimationControl : NSObject<UIViewControllerAnimatedTransitioning>

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext;

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext;
@end
