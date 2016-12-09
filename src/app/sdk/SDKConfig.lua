local SDKConfig = {}
    --是否开启SDK
    isOpenSDK = false
    SDKConfig.forumUrl = "http://m.cafe.naver.com/sjzp/18"   
    SDKConfig.strategyUrl = "http://m.cafe.naver.com/ArticleList.nhn?search.clubid=28313460&search.menuid=3&search.boardtype=L"
    SDKConfig.faqUrl = "https://game.nanoo.so/sjzp/customer/faq"
    SDKConfig.oneToOneUrl = "https://game.nanoo.so/sjzp/customer/inquiry_post"
    SDKConfig.eulaOneUrl = "https://game.nanoo.so/sjzp/customer/faq/1024"
    SDKConfig.eulaTwoUrl = "https://game.nanoo.so/sjzp/customer/faq/1025"
    SDKConfig.facebookUrl = "https://www.facebook.com/%E4%B8%BB%E5%85%AC%E4%B8%8D%E5%8F%AF%E4%BB%A5-649044225273901/"
    SDKConfig.popUpKey= {"start","lobby","fighting","ladder","seven_star",
						 "hero_train","blood_fight","recruit","society","hero","upgrade",
						 "embattle","equipment","package","combining","task","store","achievement",
						 "buy_gold","reward","sign_in","vip","gift",}
    SDKConfig.fbShareTitle = "主公不可以"
    SDKConfig.fbDescription = "主公真的不可以"
    SDKConfig.fbUrl = "http://developers.facebook.com/android"
    SDKConfig.packageName={
        [1]= "com.dstamp.sjzb.aos.nstore",
        [2]= "com.dstamp.sjzb.aos.ostore",
        [3]= "com.dstamp.sjzb.aos.cstore",
        [4]= "com.dstamp.sjzb.aos.gplay",
        [5]= "com.dyhy.hjby.ios",
        [6]= "com.tanyu.hjby.uc",
        [7]= "com.dyhy.hjby.gplay",
    }
    SDKConfig.AppMarket={
        [1] = "Nstore",
        [2] = "Onestore",
        [3] = "Cstore",
        [4] = "Gplay",
        [5] = "Astore",
        [6] = "anysdk",
        [7] = "Qstore"
    }
function SDKConfig:init()
	
end
return SDKConfig