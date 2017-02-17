//
//  QRcodeViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2017/2/7.
//  Copyright © 2017年 chenzhiqiang. All rights reserved.
//

#import "QRcodeViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "NavigationControllerView.h"

@interface QRcodeViewController ()<AVCaptureMetadataOutputObjectsDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) AVCaptureDeviceInput *input;
@property (nonatomic,strong) AVCaptureMetadataOutput *output;
@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic,strong) AVCaptureVideoPreviewLayer *layerView;
@property (nonatomic,assign) CGSize layerViewSize;
@property (nonatomic,assign) CGSize showSize;

@end

@implementation QRcodeViewController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    
    self.tabBarController.tabBar.hidden=YES;
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:YES];
    
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NavigationControllerView *navView = [[NavigationControllerView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64) andLeftBtn:@"扫一扫"];
    navView.viewController = self;
    [self.view addSubview:navView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatScanQR];
    //添加拍摄图层
    [self.view.layer addSublayer:self.layerView];
    //开始二维码
    [self.session startRunning];
}

-(void)creatScanQR{
    
    /** 创建输入数据源 */
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];  //获取摄像设备
    self.input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];  //创建输出流
    
    /** 创建输出数据源 */
    self.output = [[AVCaptureMetadataOutput alloc] init];
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];  //设置代理 在主线程里刷新
    
    /** Session设置 */
    self.session = [[AVCaptureSession alloc] init];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];   //高质量采集
    [self.session addInput:self.input];
    [self.session addOutput:self.output];
    //设置扫码支持的编码格式
    self.output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode,
                                        AVMetadataObjectTypeEAN13Code,
                                        AVMetadataObjectTypeEAN8Code,
                                        AVMetadataObjectTypeCode128Code];
    /** 扫码视图 */
    //扫描框的位置和大小
    self.layerView = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    self.layerView.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.layerView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    // 将扫描框大小定义为属行, 下面会有调用
    self.layerViewSize = CGSizeMake(_layerView.frame.size.width, _layerView.frame.size.height);
    
}

#pragma mark - 实现代理方法, 完成二维码扫描
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    if (metadataObjects.count > 0) {
        
        // 停止动画, 看完全篇记得打开注释, 不然扫描条会一直有动画效果
        //[self.shadowView stopTimer];
        
        //停止扫描
        [self.session stopRunning];
        
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        //输出扫描字符串
        NSLog(@"%@",metadataObject.stringValue);
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"%@", metadataObject.stringValue] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
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
