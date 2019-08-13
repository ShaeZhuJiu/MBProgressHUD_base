//
//  ViewController.m
//  加载进度动画MBProgressHUD
//
//  Created by 谢鑫 on 2019/8/13.
//  Copyright © 2019 Shae. All rights reserved.
//

#import "ViewController.h"
#import <MBProgressHUD.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//默认样式,菊花加载MBProgressHUDModeIndeterminate样式
- (IBAction)indeterminateMode:(UIButton *)sender {
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.bezelView.color=[UIColor greenColor];
    hud.bezelView.alpha=0.5;
    hud.label.text=@"绿色的bezelView";
    //显示三秒后隐藏
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(3.0*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
    });
}
//MBProgressHUDModeDeterminate样式
- (IBAction)determinateMode:(UIButton *)sender {
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode=MBProgressHUDModeDeterminate;
    hud.label.text=@"正在加载。。。";
    hud.detailsLabel.textColor=[UIColor redColor];
    hud.detailsLabel.text=@"红色的副标题";
    //显示三秒后隐藏
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(3.0*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
    });
}
// MBProgressHUDModeAnnularDeterminate样式
- (IBAction)annularDeterminateMode:(UIButton *)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.label.text = @"正在加载...";
    hud.detailsLabel.text = @"黄色的backgroundView";
    hud.backgroundView.backgroundColor = [UIColor yellowColor];
    //显示3秒后隐藏
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
    });
}
//MBProgressHUDModeDeterminateHorizontalBar样式
- (IBAction)determinateHorizontalBarMode:(UIButton *)sender {
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode=MBProgressHUDModeDeterminateHorizontalBar;
    hud.label.text=@"正在加载...";
    hud.detailsLabel.text=@"添加了一个按钮";
    NSProgress *progressObject=[NSProgress progressWithTotalUnitCount:100];
    hud.progressObject=progressObject;
    [hud.button setTitle:@"取消加载" forState:UIControlStateNormal];
    [hud.button addTarget:progressObject action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    hud.button.backgroundColor=[UIColor blueColor];
    //显示3秒后隐藏
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [hud hideAnimated:YES];
    });
}
- (IBAction)customViewMode:(UIButton *)sender {
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode=MBProgressHUDModeCustomView;
    UIImage *image=[[UIImage imageNamed:@"1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    imageView.image=image;
    hud.customView=imageView;
    hud.detailsLabel.text=@"IOS开发进阶之路";
    [hud hideAnimated:YES afterDelay:3.f];
}


@end
