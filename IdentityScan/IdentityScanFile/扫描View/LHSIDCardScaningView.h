//
//  LHSIDCardScaningView.h
//  身份证识别
//
//  Created by huashan on 2017/2/17.
//  Copyright © 2017年 LiHuashan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "IDInfo.h"
#import "excards.h"
#import "UIImage+Extend.h"
#import "RectManager.h"
#import "UIAlertController+Extend.h"

@interface LHSIDCardScaningView : UIView

typedef void (^MZScanViewBlock)(IDInfo *iDInfo);

@property (nonatomic, copy, readonly) MZScanViewBlock scanViewBlock;

//扫描完成传值
- (void)qrScanViewStringValueBlock:(MZScanViewBlock)valueBlock;


@property (nonatomic,assign) CGRect facePathRect;

// 摄像头设备
@property (nonatomic,strong) AVCaptureDevice *device;
// AVCaptureSession对象来执行输入设备和输出设备之间的数据传递
@property (nonatomic,strong) AVCaptureSession *session;
@property (nonatomic,strong) AVCaptureConnection *connection;
// 输出格式
@property (nonatomic,strong) NSNumber *outPutSetting;
// 出流对象
@property (nonatomic,strong) AVCaptureVideoDataOutput *videoDataOutput;
// 元数据（用于人脸识别）
@property (nonatomic,strong) AVCaptureMetadataOutput *metadataOutput;
// 预览图层
@property (nonatomic,strong) AVCaptureVideoPreviewLayer *previewLayer;

// 队列
@property (nonatomic,strong) dispatch_queue_t queue;
// 是否打开手电筒
@property (nonatomic,assign,getter = isTorchOn) BOOL torchOn;


//初始化
- (void)EXCARDS_Init;

//检测摄像设备
-(void)checkAuthorizationStatus;

//停止扫描
-(void)stopSession;


@end
