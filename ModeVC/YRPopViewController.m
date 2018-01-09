//
//  YRPopViewController.m
//  ModeVC
//
//  Created by yangrui on 2018/1/9.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "YRPopViewController.h"
#import "YRPopCenterAnimationControl.h"
#import "YRPopUpDownAnimationControl.h"
#import "YRPopDownUpAnimationControl.h"


@interface YRPopViewController ()<UIViewControllerTransitioningDelegate>


@end

@implementation YRPopViewController


-(instancetype)init{
   self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
        
    }
    return self;
}


-(UIView *)contentView{
    if (!_contentView) {
        
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, [UIScreen mainScreen].bounds.size.width - 200 , [UIScreen mainScreen].bounds.size.height - 200)];
        [self.view addSubview:_contentView];
        _contentView.backgroundColor = [UIColor lightGrayColor];
    }
    return _contentView;
    
}

-(YRBlurView *)blurView{
    if(!_blurView){
        _blurView = [[YRBlurView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:_blurView];
    }
    return _blurView;

}


-(void)viewDidLoad{

    [super viewDidLoad];
    [self blurView];
    
    [self contentView];
   
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
 
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
   
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -- UIViewControllerTransitioningDelegate 
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    switch (self.animationType) {
        case KPopAnimationTypeCenterShow:       // 从中间放大弹出
            return [[YRPopCenterAnimationControl alloc] init];
            break;
            
        case KPopAnimationTypeUpDown:           // 从上往下掉
            return [[YRPopUpDownAnimationControl alloc] init];
            break;
        case KPopAnimationTypeDownUp:           
            return [[YRPopDownUpAnimationControl alloc] init];
            break;
            
        default:
            break;
    }
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    switch (self.animationType) {
        case KPopAnimationTypeCenterShow:       // 从中间放大弹出
            return [[YRPopCenterAnimationControl alloc] init];
            break;
            
        case KPopAnimationTypeUpDown:           // 从上往下掉
            return [[YRPopUpDownAnimationControl alloc] init];
            break;
        case KPopAnimationTypeDownUp:
            return [[YRPopDownUpAnimationControl alloc] init];
            break;
            
        default:
            break;
    }
}

@end
