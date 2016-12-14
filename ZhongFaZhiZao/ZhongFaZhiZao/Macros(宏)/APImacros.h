//
//  APImacros.h
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/11/9.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

//测试环境
#define HOST_URL    @"http://cectest.cecb2b.com/waps/api"
//#define HOST_URL                    @"http://test.neisha.cc"

//正式环境
//#define HOST_URL  @"http://wap.cecb2b.com"

#define ALIPAY_URL  @"/apppay/toAli?orderIds=201312291707559XMZ"

#define SOURCE_URL  @"/cart/doSubmitOrde"

// 登录注册
//#define LOGIN                       @"/app/user/login"
//#define FOGET_PW                    @"/app/user/checkmobcode"
//#define SET_PW                      @"/app/user/findPwd"
//#define SEND_VF                     @"/app/user/sendcode"

// 登录注册
#define LOGIN                       @"/api/login/dynamic"
#define FOGET_PW                    @"/app/user/checkmobcode"
#define SET_PW                      @"/app/user/findPwd"
#define SEND_VF                     @"/app/user/sendcode"

#define LOGIN_VF                   @"/getLoginDynamicCode"
#define REGIST_VF                  @"/getDynamicCode"
#define REGIST                     @"/api/register"


