//
//  ViewController.m
//  ModeVC
//
//  Created by yangrui on 2018/1/9.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "ViewController.h"
#import "YRPopViewController.h"
@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController





- (void)viewDidLoad {
    [super viewDidLoad];
  
   
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    YRPopViewController *popVC = [[YRPopViewController alloc] init];
    popVC.animationType =  KPopAnimationTypeCenterShow;
//    popVC.animationType =  KPopAnimationTypeDownUp;
//    popVC.animationType =  KPopAnimationTypeUpDown;
    
    CGPoint touchPoint = [[touches anyObject] locationInView:[UIApplication sharedApplication].keyWindow];
    
    popVC.touchPoint = touchPoint;
    
    [self presentViewController:popVC animated:YES completion:nil];
    
}


@end
