//
//  YRPopAnimationControl.m
//  ModeVC
//
//  Created by yangrui on 2018/1/9.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "YRPopAnimationControl.h"

@implementation YRPopAnimationControl

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    // 1
    YRPopViewController *toVC = (YRPopViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (toVC.isBeingPresented) {
        return 0.3;
    }
    else if (fromVC.isBeingDismissed) {
        return 0.3;
    }
    
    return 0.3;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
}
@end
