//
//  AppDelegate.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/11/3.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "AppDelegate.h"
#import "ZFZZTabBarController.h"
#import "ZFZZViewController.h"
#import "MainWebViewController.h"

#import <AlipaySDK/AlipaySDK.h>

//友盟统计
#import "UMMobClick/MobClick.h"

#import "LaunchIntroductionView.h"

//Bugly
#import <Bugly/Bugly.h>

// 引入JPush功能所需头文件
#import "JPUSHService.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

#define URLStr     @"http://wap.cecb2b.com"


@interface AppDelegate ()<JPUSHRegisterDelegate>{
    
    MainWebViewController *rootVC;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    

    [NSThread sleepForTimeInterval:1.0];//设置启动页面时间
    
    //  修改状态栏颜色
//     [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
//    [[UIApplication sharedApplication]setStatusBarStyle:YES];
//


    
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    

//    ZFZZViewController *rootVC = [[ZFZZViewController alloc]init];
    
    
//    ZFZZTabBarController *rootVC = [[ZFZZTabBarController alloc]init];
    
    
    rootVC = [[MainWebViewController alloc]init];
    
    UINavigationController *rootNav = [[UINavigationController alloc]initWithRootViewController:rootVC];

    rootVC.urlStr = URLStr;
    
    
    
    self.window.rootViewController = rootNav;
    
    [self.window makeKeyAndVisible];
    
    
    
//    引导页 放在makeKeyAndVisible后
    
//    非点击引导页，右滑进入调用
//    [LaunchIntroductionView sharedWithImages:@[@"guid01.jpg",@"guid02.jpg",@"guid03.jpg",@"guid04.jpg"]];

    
//    点击引导页  设置小圆点颜色等
   [LaunchIntroductionView sharedWithImages:@[@"guid01.jpg",@"guid02.jpg",@"guid03.jpg",@"guid04.jpg"] buttonImage:@"login" buttonFrame:CGRectMake(0,  0, screenWidth, screenHeight)];
//    launch.currentColor = [UIColor redColor];
//    launch.nomalColor = [UIColor greenColor];
    
    
#pragma mark - to do 初始化APNs
    
    //Required
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
        entity.types = UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound;
        [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    }
    else if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    }
    else {
        //categories 必须为nil
        [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                          UIRemoteNotificationTypeSound |
                                                          UIRemoteNotificationTypeAlert)
                                              categories:nil];
    }
    
    
    
#pragma mark - to do初始化JPush
    
    // Optional
    // 获取IDFA
    // 如需使用IDFA功能请添加此代码并在初始化方法的advertisingIdentifier参数中填写对应值
//    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    NSString *advertisingId = nil;
    
    // Required
    // init Push
    // notice: 2.1.5版本的SDK新增的注册方法，改成可上报IDFA，如果没有使用IDFA直接传nil
    // 如需继续使用pushConfig.plist文件声明appKey等配置内容，请依旧使用[JPUSHService setupWithOption:launchOptions]方式初始化。
    [JPUSHService setupWithOption:launchOptions appKey:@"cc8b5670fefb1a425851c61d"
                          channel:@"App Store"
                 apsForProduction:0
            advertisingIdentifier:advertisingId];
    
    
    
//    设置别名和标签
//    JPUSHService setTags:<#(NSSet *)#> alias:<#(NSString *)#> callbackSelector:<#(SEL)#> object:<#(id)#>
    
    
    
#pragma mark - umeng统计设置
/**************************umeng统计*************************/
    UMConfigInstance.appKey = @"583920d2f43e480ef6000267";
    UMConfigInstance.channelId = @"App Store";
//    UMConfigInstance.eSType = E_UM_GAME; //仅适用于游戏场景，应用统计不用设置

    [MobClick startWithConfigure:UMConfigInstance];
    
//    集成测试前打开
    
//    [MobClick setLogEnabled:YES];
    
    
/*****************************Bugly***************************/
   
    [Bugly startWithAppId:@"cbecd6df67"];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [JPUSHService resetBadge];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.

    [JPUSHService resetBadge];

    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    
    }


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - to do注册APNs成功并上报DeviceToken
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}

#pragma mark - to do实现注册APNs失败接口（可选）
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

#pragma mark - to do添加处理APNs通知回调方法
#pragma mark- JPUSHRegisterDelegate

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
//    UNNotificationRequest *request = notification.request; // 收到推送的请求
//    UNNotificationContent *content = request.content; // 收到推送的消息内容
    
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        
//        if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive) {
//            //程序运行时收到通知，先弹出消息框
//            
//            [self getPushMessageAtStateActive:userInfo];
//            
//        }
//        
//        else{
//
            [self pushToViewControllerWhenClickPushMessageWith:userInfo];
//        }
    
        
    }
    else{
    
//        本地通知
    }
    completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert);

//    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        
//        NSLog(@"推送数据为================%@",userInfo);
//        
//  
//        self.pushDic = [[NSMutableDictionary alloc]initWithDictionary:userInfo];
//        
//        NSLog(@"pushDic == %@",self.pushDic);
//        
//        NSLog(@"URL======= %@",self.pushDic[@"URL"]);
        
//        if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive) {
            //程序运行时收到通知，先弹出消息框
//            [self getPushMessageAtStateActive:userInfo];
//            
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"ApplicationState" object:@"0"];
            
//        }
//        
//        else{
        
            [self pushToViewControllerWhenClickPushMessageWith:userInfo];
//        }

        
    }
    else{
    
//        本地通知
    }
    completionHandler();  // 系统要求执行这个方法
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
    
//    if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive) {
//        //程序运行时收到通知，先弹出消息框
//        
//        [self getPushMessageAtStateActive:userInfo];
//        
//    }
//    
//    else{
        //程序已经关闭或者在后台运行
        [self pushToViewControllerWhenClickPushMessageWith:userInfo];
        
//    }
    
    [application setApplicationIconBadgeNumber:0];
    
    [JPUSHService handleRemoteNotification:userInfo];
    
    
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // 取得 APNs 标准信息内容
    NSDictionary *aps = [userInfo valueForKey:@"aps"];
    NSString *content = [aps valueForKey:@"alert"]; //推送显示的内容
    NSInteger badge = [[aps valueForKey:@"badge"] integerValue]; //badge数量
    NSString *sound = [aps valueForKey:@"sound"]; //播放的声音
    
    // 取得Extras字段内容
    NSString *customizeField1 = [userInfo valueForKey:@"customizeExtras"]; //服务端中Extras字段，key是自己定义的
    NSLog(@"content =[%@], badge=[%ld], sound=[%@], customize field  =[%@]",content,badge,sound,customizeField1);
    
    
    // Required,For systems with less than or equal to iOS6
    [JPUSHService handleRemoteNotification:userInfo];
}


//jpush跳转方法
- (void)pushToViewControllerWhenClickPushMessageWith:(NSDictionary *)msgDic{

    self.pushDic = [[NSMutableDictionary alloc]initWithDictionary:msgDic];

//    
//    MainWebViewController *vc = [[MainWebViewController alloc]init];
//    
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];

    
    if ([msgDic objectForKey:@"URL"]) {
        
        rootVC.urlStr = msgDic[@"URL"];
        
//        [self.window.rootViewController presentViewController:nav animated:YES completion:nil];
        
    }
    
    
}

#pragma mark -- 程序运行时收到通知
-(void)getPushMessageAtStateActive:(NSDictionary *)pushMessageDic{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@""
                                                                             message:[[pushMessageDic objectForKey:@"aps"]objectForKey:@"alert"]
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"查看"
                                                            style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                                
                                                                [self pushToViewControllerWhenClickPushMessageWith:pushMessageDic];
                                                            }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                           style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                                                               
                                                           }];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancelAction];
    [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
    
    
}


//判断状态 后台、前台、未打开


#pragma mark - to do Alipay
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    //如果极简开发包不可用，会跳转支付宝钱包进行支付，需要将支付宝钱包的支付结果回传给开发包
    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
            NSLog(@"result = %@",resultDic);
        }];
    }
    if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回authCode
        
        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
            NSLog(@"result = %@",resultDic);
        }];
    }
    return YES;
}

#pragma mark - to do 与上面二选一
// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    if ([url.host isEqualToString:@"safepay"]) {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
        
        // 授权跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            // 解析 auth code
            NSString *result = resultDic[@"result"];
            NSString *authCode = nil;
            if (result.length>0) {
                NSArray *resultArr = [result componentsSeparatedByString:@"&"];
                for (NSString *subResult in resultArr) {
                    if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
                        authCode = [subResult substringFromIndex:10];
                        break;
                    }
                }
            }
            NSLog(@"授权结果 authCode = %@", authCode?:@"");
        }];
    }
    return YES;
}





@end
