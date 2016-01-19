//
//  ViewController.m
//  myanimationtest
//
//  Created by fairy on 16/1/19.
//  Copyright © 2016年 fairy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageview.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:imageview];
    CGContextRef context = UIGraphicsGetCurrentContext();//获得上下文
    [UIView beginAnimations:nil context:context];        //开始动画
   
    
    [UIView setAnimationDuration:3];                    //设置动画持续时间
    CGPoint point = imageview.center;                   //使图片下移的同时左移
    point.y +=500;
    point.x +=100;
    [imageview setCenter:point];
     [UIView commitAnimations];                         //提交动画
    
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:3];
    [imageview setAlpha:0.0];                           //改变图片透明度
    [UIView commitAnimations];
    
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 100, 100)];
    image.backgroundColor = [UIColor greenColor];
    [self.view addSubview:image];
    [UIView animateWithDuration:3                       //动画持续时间
                          delay:0.0                     //动画延迟时间
         usingSpringWithDamping:0.3                     //回弹程度 它的范围为 0.0f 到 1.0f ，数值越小「弹簧」的振动效果越明显
          initialSpringVelocity:5.0                     //初始速度
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGPoint point = image.center;
        point.y+= 500;
        [image setCenter:point];
    } completion:^(BOOL finished) {
        [image setAlpha:1];                             //动画完成后执行
    }];
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(200, 0, 100, 100)];
    [self.view addSubview:img];
    void (^keyFrameBlock)()=^(){
        NSArray *arrayColors = @[[UIColor orangeColor],[UIColor yellowColor],[UIColor greenColor],[UIColor blueColor],[UIColor purpleColor],[UIColor redColor]];
        NSInteger colorCount = [arrayColors count];
        for (NSInteger i = 0; i<colorCount; i++) {
            
            /**
             *  添加关键帧
             *
             *  @param frameStartTime 动画相对开始时间
             *  @param frameDuration  动画相对持续时间
             *  @param animations     动画执行代码
             */
            
            [UIView addKeyframeWithRelativeStartTime:i/(CGFloat)colorCount relativeDuration:1/(CGFloat)colorCount animations:^{
                [img setBackgroundColor:arrayColors[i]];
            }];
        }
    };
    
    /**
     *  添加关键帧方法
     *
     *  @param duration   动画时长
     *  @param delay      动画延迟
     *  @param options    动画效果选项
     *  @param animations 动画执行代码
     *  @param completion 动画结束执行代码
     */
    
    [UIView animateKeyframesWithDuration:4.0 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeCubic|UIViewAnimationOptionCurveLinear animations:keyFrameBlock completion:^(BOOL finished) {
        nil;
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
