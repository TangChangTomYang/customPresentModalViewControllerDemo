//
//  YRPopUpDownAnimationControl.m
//  ModeVC
//
//  Created by yangrui on 2018/1/9.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "YRPopUpDownAnimationControl.h"

@implementation YRPopUpDownAnimationControl


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (!toVC || !fromVC) {
        return;
    }
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    if (toVC.isBeingPresented) {
        
        YRPopViewController *toViewController = (YRPopViewController *)toVC;
        // 2
        [containerView addSubview:toViewController.view];
        toViewController.view.frame = CGRectMake(0.0, 0.0, containerView.frame.size.width, containerView.frame.size.height);
        toViewController.blurView.alpha = 0.0;
        toViewController.contentView.center = CGPointMake(containerView.center.x, 0);
        [UIView animateWithDuration:duration animations:^{
            toViewController.blurView.alpha = 0.3;
            toViewController.contentView.center = containerView.center;
        } completion:^(BOOL finished) {
            if (finished == YES) {
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }
  
        }];
    }
    else if (fromVC.isBeingDismissed) {
        
        YRPopViewController *fromViewController = (YRPopViewController *)fromVC;
        [UIView animateWithDuration:duration animations:^{
            fromViewController.blurView.alpha = 0;
            fromViewController.view.frame = CGRectMake(0.0, -containerView.frame.size.height, containerView.frame.size.width, containerView.frame.size.height);
        } completion:^(BOOL finished) {
            if (finished == YES) {
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }
            
        }];
        
   
    }
}
@end
