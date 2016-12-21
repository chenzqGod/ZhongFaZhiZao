//
//  APImacros.h
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/11/9.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

//测试环境
#define HOST_URL    @"http://cectest.cecb2b.com/waps"

//正式环境
//#define HOST_URL  @"http://wap.cecb2b.com"

#define ALIPAY_URL  @"/apppay/toAli?orderIds=201312291707559XMZ"

#define SOURCE_URL  @"/cart/doSubmitOrde"




//登录注册
#define LOGIN_PW                   @"/api/login/member"
#define LOGIN_VF                   @"/api/getLoginDynamicCode"
#define LOGIN                      @"/api/login/dynamic"
#define REGIST_VF                  @"/api/getDynamicCode"
#define REGIST                     @"/api/register"



//首页
#define Electronic_API             @"/api/findData"
#define AD_API                     @"/api/adInfo/41,44"

#define SOLVE_LIST                 @"/made/solution/list"
#define SCIENCE_LIST               @"/made/science/list"
#define SUPPLY_LIST                @"/made/supplyChainList"
#define Intelligence_LIST          @"/made/intelligence/list"

//搜索
#define SEARCH_API                 @"/made/search?q=搜索关键字&isFirst=true&icNum=0&nicNum=0&icUsedNum=0&nicUsedNum=0"

//商品详情页
#define DETAIL_ICLIST              @"/corp/icInfo/商品id?corpId=店铺id"
#define DETAIL_NICLIST             @"/corp/nicInfo/商品id?corpId=店铺id"


#define BUYLIST_LIST               @"/waps/cart/list"

//#define HOST_URL                    @"http://test.neisha.cc"
// 登录注册
//#define LOGIN                       @"/api/login/dynamic"
//#define FOGET_PW                    @"/app/user/checkmobcode"
//#define SET_PW                      @"/app/user/findPwd"
//#define SEND_VF                     @"/app/user/sendcode"
