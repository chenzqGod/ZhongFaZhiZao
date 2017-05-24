//
//  APImacros.h
//  ZhongFaZhiZao
//
//  Created by chenzhiqiang on 2016/11/9.
//  Copyright © 2016年 chenzhiqiang. All rights reserved.
//

//测试环境
//#define HOST_URL    @"http://cectest.cecb2b.com/waps"

//正式环境
#define HOST_URL  @"http://wap.cecb2b.com"


#define ALIPAY_URL  @"/apppay/toAli?orderIds=201312291707559XMZ"

#define SOURCE_URL  @"/cart/doSubmitOrde"


//推送
//保存消息推送用户token
#define JPUSH_SAVE                @"/api/pushUserToken/save"

//登录注册
#define LOGIN_PW                   @"/api/login/member"
#define LOGIN_VF                   @"/api/getLoginDynamicCode"
#define LOGIN                      @"/api/login/dynamic"
#define REGIST_VF                  @"/api/getDynamicCode"
#define REGIST                     @"/api/register"

//会员中心
#define MEMBER_CENTER              @"/api/member"
#define MY_ORDER                   @"/order/myOrder"
#define MEMBER_PENDING             @"/order/myOrder?orderDataType=10"
#define MEMBER_DELIVERY            @"/order/myOrder?orderDataType=30"
#define MEMBER_RECEIVING           @"/order/myOrder?orderDataType=50"
#define MEMBER_REFUND              @"/order/myOrder?orderDataType=40"

#define MEMBER_SAFECOUNT           @"/user/safe"
#define MEMBER_RECEIVEADDRESS      @"/express/list"
#define MEMBER_COLLECT_JAN         @"/favorites/good/myFavorites"
#define MEMBER_COLLECT_TEN         @"/favorites/shop/myFavorites"

//交互
#define USER_CENTER                @"/member/home"
#define LoginURL                   @"/member/login"
#define HOME_WAPS                  @"/made/index"

//融云  
#define GETRONG_TOKEN              @"/api/getRongToken"
#define GETRONG_NAME               @"/corp/{corpId}/getCorpName"

#define RongTextToken             @"yTXK4Qh7VoK62uCyTsv6RXCq3wKvv+SHceNoxR7WTCWBiseR6gmMY/sGMdQUSmrtniLnJLSgtDl91xYI2kTlmg=="

//金融服务
#define FINANCE_INNOVATE           @"/api/innovateFinance/list"             //创新金融
#define FINANCE_SUPPLY             @"/api/supplyChainFinance/list"          //供应链金融
#define FINANCE_LOAN               @"/api/smallLoanFinance/list"            //小额贷金融
#define FINANCE_DETAIL             @"/api/finance/detail"                   //金融详情
#define FINANCE_APPLY              @"/api/finance/apply"                    //金融申请

//知识产权
#define PATENT_LIST                @"/api/patent/list"
#define PATENT_DOMAINLIST          @"/api/patent/domainList"
#define PATENT_APPLY               @"/api/patent/apply"

//首页
#define Electronic_API             @"/api/getMarkets"
#define AD_API                     @"/api/adInfo/41,44"

#define SOLVE_LIST                 @"/made/solution/list"
#define SCIENCE_LIST               @"/made/science/list"
#define SUPPLY_LIST                @"/made/supplyChainList"
#define Intelligence_LIST          @"/made/intelligence/list"

//搜索
#define SEARCH_API                 @"/made/search?q=&isFirst=true&icNum=0&nicNum=0&icUsedNum=0&nicUsedNum=0"

//商品详情页
#define DETAIL_ICLIST              @"/corp/icInfo/商品id?corpId=店铺id"
#define DETAIL_NICLIST             @"/corp/nicInfo/商品id?corpId=店铺id"


#define BUYLIST_LIST               @"/waps/cart/list"

//采购料单
#define PURCHASE_LIST              @"/cart/list"

