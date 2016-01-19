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
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
   
    
    [UIView setAnimationDuration:3];
    CGPoint point = imageview.center;
    point.y +=500;
    point.x +=100;
    [imageview setCenter:point];
     [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:3];
    [imageview setAlpha:0.0];
    [UIView commitAnimations];
    
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 100, 100)];
    image.backgroundColor = [UIColor greenColor];
    [self.view addSubview:image];
    [UIView animateWithDuration:3 delay:0.0 usingSpringWithDamping:0.3 initialSpringVelocity:5.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGPoint point = image.center;
        point.y+= 500;
        [image setCenter:point];
    } completion:^(BOOL finished) {
        [image setAlpha:1];
    }];
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(200, 0, 100, 100)];
    [self.view addSubview:img];
    void (^keyFrameBlock)()=^(){
        NSArray *arrayColors = @[[UIColor orangeColor],[UIColor yellowColor],[UIColor greenColor],[UIColor blueColor],[UIColor purpleColor],[UIColor redColor]];
        NSInteger colorCount = [arrayColors count];
        for (NSInteger i = 0; i<colorCount; i++) {
            [UIView addKeyframeWithRelativeStartTime:i/(CGFloat)colorCount relativeDuration:1/(CGFloat)colorCount animations:^{
                [img setBackgroundColor:arrayColors[i]];
            }];
        }
    };
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
