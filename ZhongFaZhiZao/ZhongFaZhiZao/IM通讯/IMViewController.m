//
//  IMViewController.m
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/12/20.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

#import "IMViewController.h"
#import "IMDetailViewController.h"

@interface IMViewController ()

@end

@implementation IMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = BACK_COLOR;
    
//    [WKProgressHUD popMessage:@"即时通讯" inView:self.view duration:HUD_DURATION animated:YES];
    
//    是否显示网络状态
    self.isShowNetworkIndicatorView = YES;
//    是否显示连接状态
    self.showConnectingStatusOnNavigatorBar = YES;
//    设置默认的聊天列表类型
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE)]];
    
//    设置背景颜色
    self.cellBackgroundColor = BACK_COLOR;
    
//    设置置顶的cell背景颜色
    self.topCellBackgroundColor = TEXT_GREY_COLOR;


    [self setUI];
}



//高度
- (CGFloat)rcConversationListTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;

}


#pragma mark - 点击会话列表中的cell回调
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath{

    IMDetailViewController *vc = [[IMDetailViewController alloc]init];
    vc.conversationType = model.conversationType;
    vc.targetId = model.targetId;
    vc.title = model.conversationTitle;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)getRongToken{

    //登录融云服务器,开始阶段可以先从融云API调试网站获取，之后token需要通过服务器到融云服务器取。
    NSString*token=@"1Cv7TsY7T7wW4kksjL6p8UmcbyeYIrXSDa0nFvL2mH/U5nPXuaB+12S6/5HoVCjf2GXR/ibrED8=";
    [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
        //设置用户信息提供者,页面展现的用户头像及昵称都会从此代理取
        [[RCIM sharedRCIM] setUserInfoDataSource:self];
        NSLog(@"Login successfully with userId: %@.", userId);
        dispatch_async(dispatch_get_main_queue(), ^{
//            ChatListViewController *chatListViewController = [[ChatListViewController alloc]init];
//            [self.navigationController pushViewController:chatListViewController animated:YES];
        });
        
    } error:^(RCConnectErrorCode status) {
        NSLog(@"login error status: %ld.", (long)status);
    } tokenIncorrect:^{
        NSLog(@"token 无效 ，请确保生成token 使用的appkey 和初始化时的appkey 一致");
    }];
    
    //    [[ODLoginInterfaceService sharedInstance]loginGetRongCloudTokenWithRequest:nil serverSuccessResultHandler:^(id response) {
    //
    //        ODRongCloudTokenResponse *tempResponse = (ODRongCloudTokenResponse *)response;
    //        ODRongCloudTokenModel *rongCloudTokenModel = tempResponse.data;
    //
//            [[NSUserDefaults standardUserDefaults] setObject:rongCloudTokenModel.token forKey:RONGTOKEN];
    
//            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                /* 登陆融云 */
//                [[RCIM sharedRCIM] connectWithToken:rongCloudTokenModel.token success:^(NSString *userId) {
//                    NSLog(@"Login successfully with userId: %@.", userId);
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        // TODO
//                    });
//    
//                } error:^(RCConnectErrorCode status) {
//                    NSLog(@"login error status: %ld.", (long)status);
//                } tokenIncorrect:^{
//                    NSLog(@"token 无效 ，请确保生成token 使用的appkey 和初始化时的appkey 一致");
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        // TODO
//                        self.tokenNum += 1;
//                        if (self.tokenNum < 6) {
//                            [self getRongToken];
//                        }
//                    });
//                }];
//            });
//    
//    
//        } failedResultHandler:^(id response) {
//            
//        } requestErrorHandler:^(id error) {
//            
//        }];

    
}


/**
 *此方法中要提供给融云用户的信息，建议缓存到本地，然后改方法每次从您的缓存返回
 */
- (void)getUserInfoWithUserId:(NSString *)userId completion:(void(^)(RCUserInfo* userInfo))completion
{
    //此处为了演示写了一个用户信息
    if ([@"1" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"1";
        user.name = @"测试1";
        user.portraitUri = @"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1756054607,4047938258&fm=96&s=94D712D20AA1875519EB37BE0300C008";
        
        return completion(user);
    }else if([@"2" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"2";
        user.name = @"测试2";
        user.portraitUri = @"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1756054607,4047938258&fm=96&s=94D712D20AA1875519EB37BE0300C008";
        return completion(user);
    }
}

- (void)setUI {

    //新建一个聊天会话View Controller对象
    RCConversationViewController *chat = [[RCConversationViewController alloc]init];
    //设置会话的类型，如单聊、讨论组、群聊、聊天室、客服、公众服务会话等
    chat.conversationType = ConversationType_PRIVATE;
    //设置会话的目标会话ID。（单聊、客服、公众服务会话为对方的ID，讨论组、群聊、聊天室为会话的ID）
    chat.targetId = @"targetIdYouWillChatIn";
    //设置聊天会话界面要显示的标题
    chat.title = @"想显示的会话标题";
    //显示聊天会话界面
    [self.navigationController pushViewController:chat animated:YES];
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
