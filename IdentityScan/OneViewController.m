//
//  OneViewController.m
//  IdentityScan
//
//  Created by MCEJ on 2017/10/31.
//  Copyright © 2017年 MCEJ. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"
#import "LHSIDCardScaningView.h"

@interface OneViewController () <AVCaptureVideoDataOutputSampleBufferDelegate>

@property (nonatomic,retain)LHSIDCardScaningView *IDCardScaningView;

@end

@implementation OneViewController

#pragma mark - view即将出现时
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    // 每次展现AVCaptureViewController的界面时，都检查摄像头使用权限
    [self.IDCardScaningView checkAuthorizationStatus];
    
    //初始化
    [self.IDCardScaningView EXCARDS_Init];
    
    self.IDCardScaningView.torchOn = NO;
}

#pragma mark - view即将消失时
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.IDCardScaningView stopSession];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"扫描身份证";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.IDCardScaningView = [[LHSIDCardScaningView alloc] initWithFrame:self.scanView.bounds];
    // 添加预览图层
    [self.scanView.layer addSublayer:self.IDCardScaningView.previewLayer];
    
    [self.IDCardScaningView qrScanViewStringValueBlock:^(IDInfo *iDInfo) {
        // 推出IDInfoVC（展示身份证信息的控制器）
        TwoViewController *IDInfoVC = [[TwoViewController alloc] init];
        IDInfoVC.iDInfo = iDInfo;// 身份证信息
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.navigationController pushViewController:IDInfoVC animated:YES];
        });
    }];
    [self.scanView addSubview:self.IDCardScaningView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

