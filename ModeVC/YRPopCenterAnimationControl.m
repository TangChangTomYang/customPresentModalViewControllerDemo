//
//  YRPopCenterAnimationControl.m
//  ModeVC
//
//  Created by yangrui on 2018/1/9.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "YRPopCenterAnimationControl.h"

@implementation YRPopCenterAnimationControl




-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
  
        
        UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        
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
            
            CGAffineTransform oldTransform = toViewController.contentView.transform;
            
            
            
            toViewController.contentView.center =    toViewController.touchPoint;
            
            toViewController.contentView.transform = CGAffineTransformScale(oldTransform, 0.3, 0.3);
//            toViewController.contentView.center = containerView.center;
            
            [UIView animateWithDuration:duration animations:^{
                toViewController.blurView.alpha = 1;
                toViewController.contentView.center = containerView.center;
                toViewController.contentView.transform = oldTransform;
            } completion:^(BOOL finished) {
                if (finished == YES) {
                    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                }
                
            }];
        }
        else if (fromVC.isBeingDismissed) {
            
            YRPopViewController *fromViewController = (YRPopViewController *)fromVC;
        
            CGAffineTransform oldTransform = fromViewController.contentView.transform;
            
            [UIView animateWithDuration:duration animations:^{
                
                fromViewController.blurView.alpha = 0.0;
                fromViewController.contentView.transform = CGAffineTransformScale(oldTransform, 0.3, 0.3);
                fromViewController.contentView.center = fromViewController.touchPoint;
            } completion:^(BOOL finished) {
                if (finished == YES) {
                    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                }
                
            }];
            
            
            
            
            
            
            
//            //
//            // 3
//            [UIView animateWithDuration:duration animations:^{
//                fromVC.view.alpha = 0.0;
//            } completion:^(BOOL finished) {
//                if (finished == YES) {
//                    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//                }
//
//            }];
        }

    
  
}


@end
