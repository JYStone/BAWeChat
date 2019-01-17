////
////  ShareManage.m
////  yrapp
////
////  Created by 博爱 on 16/2/3.
////  Copyright © 2016年 有人科技. All rights reserved.
////  友盟分享工具类
//
//#import "BAShareManage.h"
//
//#import "UMSocial.h"
//#import "UMSocialWechatHandler.h"
//#import "WXApi.h"
//#import "BAShareAnimationView.h"
//#import "UMSocialQQHandler.h"
//#import "UMSocialSinaSSOHandler.h"
//
//@implementation BAShareManage {
//    UIViewController *_viewC;
//}
//
////static BAShareManage *shareManage;
//
//+ (BAShareManage *)ba_shareManage
//{
//    static BAShareManage *ba_shareManage;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        ba_shareManage = [[BAShareManage alloc] init];
//    });
//    return ba_shareManage;
//}
//
//- (void)setShareManageType:(BAShareManageType)shareManageType
//{
//    _shareManageType = shareManageType;
//}
//
//#pragma mark - 友盟分享
//#pragma mark 注册友盟分享微信
//- (void)ba_setupShareConfig
//{
//    // ************* 友盟分享 *************
//    [UMSocialData setAppKey:BA_Umeng_Appkey];
//    // 打开调试log的开关
//    [UMSocialData openLog:NO];
//    
//    // 如果你要支持不同的屏幕方向，需要这样设置，否则在iPhone只支持一个竖屏方向
//    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskPortrait];
//    
//    /*苹果审核要求,隐藏未安装的应用 的分享选项 */
//    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToSina, UMShareToQQ, UMShareToQzone, UMShareToWechatSession, UMShareToWechatTimeline]];
//    
//    // 打开新浪微博的SSO开关
//    // 将在新浪微博注册的应用appkey、redirectURL替换下面参数，并在info.plist的URL Scheme中相应添加wb+appkey，如"wb3112175844"，详情请参考官方文档。
////    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:BA_Sina_AppKey
////                                         RedirectURL:@"http://sns.whalecloud.com/sin"];
//    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:BA_Sina_AppKey
//                                              secret:BA_SinaAppSecret
//                                         RedirectURL:@"http://sns.whalecloud.com/sin"];
//    //  添加微信分享授权
//    // 设置微信AppId、appSecret，分享url
//    [UMSocialWechatHandler setWXAppId:BA_WX_APPKEY appSecret:BA_WX_APPSECRET url:@"https://www.baidu.com"];
//    
//    // 设置分享到QQ空间的应用Id，和分享url 链接
//    [UMSocialQQHandler setQQWithAppId:BA_QQAppID appKey:BA_QQKey url:@"https://www.baidu.com"];
//    // 设置支持没有客户端情况下使用SSO授权
//    [UMSocialQQHandler setSupportWebView:YES];
//    
//    /*! 这段代码是用友盟自带的自定义分享的时候打开！ */
////    UMSocialSnsPlatform *copyPlatform = [[UMSocialSnsPlatform alloc] initWithPlatformName:@"copy"];
////    copyPlatform.displayName = @"复制";
////    copyPlatform.smallImageName = @"icon"; //用于tableView样式的分享列表
////    copyPlatform.bigImageName = @"icon"; //用于actionsheet样式的分享列表
////    copyPlatform.snsClickHandler = ^(UIViewController *presentingController, UMSocialControllerService * socialControllerService, BOOL isPresentInController){ NSLog(@"copy!"); };                                                                                                                                                                                                          [UMSocialConfig addSocialSnsPlatform:@[copyPlatform]];                                                                                                                                                                                                        [UMSocialConfig setSnsPlatformNames:@[UMShareToSina, UMShareToWechatSession, UMShareToWechatTimeline, UMShareToQQ, UMShareToQzone]];
//}
//
//#pragma mark 微信分享
//- (void)ba_wxShareWithViewControll:(UIViewController *)viewC
//                             title:(NSString *)shareTitle
//                      shareContent:(NSString *)shareContent
//                             image:(UIImage *)shareImage
//                               url:(NSString *)shareURLString
//{
//    _viewC = viewC;
//    
//    if (self.shareManageType == BAShareManageTypeImage)
//    {
//        [UMSocialData defaultData].extConfig.wechatSessionData.wxMessageType = UMSocialWXMessageTypeImage;
//        [[UMSocialControllerService defaultControllerService] setShareText:shareContent shareImage:shareImage socialUIDelegate:nil];
//    }
//    else
//    {
//        [UMSocialData defaultData].extConfig.wechatSessionData.title = shareTitle;
//        [UMSocialData defaultData].extConfig.wechatSessionData.url = shareURLString;
//        [[UMSocialControllerService defaultControllerService] setShareText:shareContent shareImage:shareImage socialUIDelegate:nil];
//    }
//
//    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession].snsClickHandler(viewC,[UMSocialControllerService defaultControllerService],YES);
//}
//
//#pragma mark 新浪微博分享
//- (void)ba_wbShareWithViewControll:(UIViewController *)viewC
//                             title:(NSString *)shareTitle
//                      shareContent:(NSString *)shareContent
//                             image:(UIImage *)shareImage
//                               url:(NSString *)shareURLString
//{
//    _viewC = viewC;
//    if (self.shareManageType == BAShareManageTypeImage)
//    {
//        [[UMSocialControllerService defaultControllerService] setShareText:nil shareImage:shareImage socialUIDelegate:nil];
//    }
//    else
//    {
//        [[UMSocialControllerService defaultControllerService] setShareText:shareContent shareImage:shareImage socialUIDelegate:nil];
//    }
//    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].snsClickHandler(viewC,[UMSocialControllerService defaultControllerService],YES);
//}
//
//#pragma mark 微信朋友圈分享
//- (void)ba_wxpyqShareWithViewControll:(UIViewController *)viewC
//                                title:(NSString *)shareTitle
//                         shareContent:(NSString *)shareContent
//                                image:(UIImage *)shareImage
//                                  url:(NSString *)shareURLString
//{
//    _viewC = viewC;
//    if (self.shareManageType == BAShareManageTypeImage)
//    {
//        [UMSocialData defaultData].extConfig.wechatTimelineData.wxMessageType = UMSocialWXMessageTypeImage;
//        [UMSocialData defaultData].extConfig.wechatTimelineData.title = nil;
//        [[UMSocialControllerService defaultControllerService] setShareText:shareContent shareImage:shareImage socialUIDelegate:nil];
//    }
//    else
//    {
//        [UMSocialData defaultData].extConfig.wechatTimelineData.title = shareTitle;
//        [UMSocialData defaultData].extConfig.wechatTimelineData.url = shareURLString;
//        [[UMSocialControllerService defaultControllerService] setShareText:shareContent shareImage:shareImage socialUIDelegate:nil];
//    }
//
//    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatTimeline].snsClickHandler(viewC,[UMSocialControllerService defaultControllerService],YES);
//}
//
//#pragma mark qq分享
//- (void)ba_qqShareWithViewControll:(UIViewController *)viewC
//                             title:(NSString *)shareTitle
//                      shareContent:(NSString *)shareContent
//                             image:(UIImage *)shareImage
//                               url:(NSString *)shareURLString
//{
//    _viewC = viewC;
//    if (self.shareManageType == BAShareManageTypeImage)
//    {
//        [UMSocialData defaultData].extConfig.qqData.qqMessageType = UMSocialQQMessageTypeImage;
//        [[UMSocialControllerService defaultControllerService] setShareText:nil shareImage:shareImage socialUIDelegate:nil];
//    }
//    else if (self.shareManageType == BAShareManageTypeScreenShots)
//    {
//        [UMSocialData defaultData].extConfig.qqData.qqMessageType = UMSocialQQMessageTypeImage;
//        [[UMSocialControllerService defaultControllerService] setShareText:nil shareImage:shareImage socialUIDelegate:nil];
//    }
//    else
//    {
//        [UMSocialData defaultData].extConfig.qqData.url = shareURLString;
//        [UMSocialData defaultData].extConfig.qqData.title = shareTitle;
//        [[UMSocialControllerService defaultControllerService] setShareText:shareContent shareImage:shareImage socialUIDelegate:nil];
//    }
//
//    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ].snsClickHandler(viewC,[UMSocialControllerService defaultControllerService],YES);
//}
//
//#pragma mark qqzone分享
//- (void)ba_qqzoneShareWithViewControll:(UIViewController *)viewC
//                                 title:(NSString *)shareTitle
//                          shareContent:(NSString *)shareContent
//                                 image:(UIImage *)shareImage
//                                   url:(NSString *)shareURLString
//{
//    _viewC = viewC;
//    [[UMSocialControllerService defaultControllerService] setShareText:shareContent shareImage:shareImage socialUIDelegate:nil];
//    [UMSocialData defaultData].extConfig.qzoneData.title = shareTitle;
//    [UMSocialData defaultData].extConfig.qzoneData.url = shareURLString;
//    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQzone].snsClickHandler(viewC,[UMSocialControllerService defaultControllerService],YES);
//}
//
//#pragma mark 短信分享
//- (void)ba_smsShareWithViewControll:(UIViewController *)viewC
//                              title:(NSString *)shareTitle
//                       shareContent:(NSString *)shareContent
//                              image:(UIImage *)shareImage
//                                url:(NSString *)shareURLString
//{
//    _viewC = viewC;
//    Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));
//    if (messageClass != nil) {
//        if ([messageClass canSendText]) {
//            [self displaySMSComposerSheetWithShareText:(NSString *)shareContent];
//        }
//        else {
//            //@"设备没有短信功能"
//        }
//    }
//    else {
//        //@"iOS版本过低,iOS4.0以上才支持程序内发送短信"
//    }
//}
//
//#pragma mark 短信的代理方法
//- (void)ba_messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
//    [_viewC dismissViewControllerAnimated:YES completion:nil];
//    switch (result)
//    {
//        case MessageComposeResultCancelled:
//            
//            break;
//        case MessageComposeResultSent:
//            //@"感谢您的分享!"
//            break;
//        case MessageComposeResultFailed:
//            
//            break;
//        default:
//            break;
//    }
//}
//
//#pragma mark 分享列表
//- (void)ba_UMshareListWithViewControll:(UIViewController *)viewC
//                                 title:(NSString *)shareTitle
//                          shareContent:(NSString *)shareContent
//                                 image:(UIImage *)shareImage
//                                   url:(NSString *)shareURLString
//{
//    if (shareImage == nil)
//    {
//        shareImage = [UIImage imageNamed:@"樱花瓣2"];
//    }
//    
//    NSArray *titarray = nil;
//    NSArray *picarray = nil;
//    
//    if ([WXApi isWXAppInstalled] && [TencentOAuth iphoneQQInstalled])
//    {
//        titarray = @[@"微信",@"朋友圈",@"微博", @"QQ",@"空间"];
//        picarray = @[@"BASharManager.bundle/微信好友",@"BASharManager.bundle/朋友圈",@"BASharManager.bundle/新浪微博", @"BASharManager.bundle/qq好友", @"BASharManager.bundle/qq空间"];
//    }
//    else if (![WXApi isWXAppInstalled] && [TencentOAuth iphoneQQInstalled])
//    {
//        titarray = @[@"微博", @"QQ",@"空间"];
//        picarray = @[@"BASharManager.bundle/新浪微博", @"BASharManager.bundle/qq好友", @"BASharManager.bundle/qq空间"];
//    }
//    else if ([WXApi isWXAppInstalled] && ![TencentOAuth iphoneQQInstalled])
//    {
//        titarray = @[@"微信",@"朋友圈",@"微博",];
//        picarray = @[@"BASharManager.bundle/微信好友",@"BASharManager.bundle/朋友圈", @"BASharManager.bundle/新浪微博"];
//    }
//    else if (![WXApi isWXAppInstalled] && ![TencentOAuth iphoneQQInstalled])
//    {
//        titarray = @[@"微博",];
//        picarray = @[@"BASharManager.bundle/新浪微博"];
//    }
//    
//    BAShareAnimationView *animationView = [[BAShareAnimationView alloc]initWithTitleArray:titarray picarray:picarray title:@"第三方分享"];
//    BA_WEAKSELF;
//    [animationView selectedWithIndex:^(NSInteger index,id shareType) {
//        BALog(@"你选择的index ＝＝ %ld",(long)index);
//        BALog(@"要分享到的平台");
//
//        if ([WXApi isWXAppInstalled] && [TencentOAuth iphoneQQInstalled])
//        {
//            switch (index)
//            {
//                    case 1:
//                    [weakSelf ba_wxShareWithViewControll:viewC title:shareTitle shareContent:shareContent image:shareImage url:shareURLString];
//                    break;
//                    case 2:
//                    [weakSelf ba_wxpyqShareWithViewControll:viewC title:shareTitle shareContent:shareContent image:shareImage url:shareURLString];
//                    break;
//                    case 3:
//                    [weakSelf ba_wbShareWithViewControll:viewC title:shareTitle shareContent:shareContent image:shareImage url:shareURLString];
//                    break;
//                    case 4:
//                    [weakSelf ba_qqShareWithViewControll:viewC title:shareTitle shareContent:shareContent image:shareImage url:shareURLString];
//                    break;
//                    case 5:
//                    [weakSelf ba_qqzoneShareWithViewControll:viewC title:shareTitle shareContent:shareContent image:shareImage url:shareURLString];
//                    break;
//                    
//                default:
//                    break;
//            }
//        }
//        else if (![WXApi isWXAppInstalled] && [TencentOAuth iphoneQQInstalled])
//        {
//            switch (index)
//            {
//                    case 1:
//                    [weakSelf ba_wbShareWithViewControll:viewC title:shareTitle shareContent:shareContent image:shareImage url:shareURLString];
//                    break;
//                    case 2:
//                    [weakSelf ba_qqShareWithViewControll:viewC title:shareTitle shareContent:shareContent image:shareImage url:shareURLString];
//                    break;
//                    case 3:
//                    [weakSelf ba_qqzoneShareWithViewControll:viewC title:shareTitle shareContent:shareContent image:shareImage url:shareURLString];
//                    break;
//                    
//                default:
//                    break;
//            }
//        }
//        else if ([WXApi isWXAppInstalled] && ![TencentOAuth iphoneQQInstalled])
//        {
//            switch (index)
//            {
//                    case 1:
//                    [weakSelf ba_wxShareWithViewControll:viewC title:shareTitle shareContent:shareContent image:shareImage url:shareURLString];
//                    break;
//                    case 2:
//                    [weakSelf ba_wxpyqShareWithViewControll:viewC title:shareTitle shareContent:shareContent image:shareImage url:shareURLString];
//                    break;
//                    case 3:
//                    [weakSelf ba_wbShareWithViewControll:viewC title:shareTitle shareContent:shareContent image:shareImage url:shareURLString];
//                    break;
//                    
//                default:
//                    break;
//            }
//        }
//        else if (![WXApi isWXAppInstalled] && ![TencentOAuth iphoneQQInstalled])
//        {
//            switch (index)
//            {
//                    case 1:
//                    [weakSelf ba_wbShareWithViewControll:viewC title:shareTitle shareContent:shareContent image:shareImage url:shareURLString];
//                    break;
//                    
//                default:
//                    break;
//            }
//        }
//    }];
//    [animationView CLBtnBlock:^(UIButton *btn) {
//        
//        BALog(@"你点了选择/取消按钮");
//    }];
//    [animationView show];
//}
//
//- (void)displaySMSComposerSheetWithShareText:(NSString *)shareText
//{
//    MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
//    picker.messageComposeDelegate = self;
//    picker.navigationBar.tintColor = [UIColor blackColor];
//    //    picker.recipients = [NSArray arrayWithObject:@"10086"];
//    picker.body = shareText;
//    [_viewC presentViewController:picker animated:YES completion:nil];
//}
//
//// 实现回调方法（可选）：
//-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
//{
//    // 根据`responseCode`得到发送结果,如果分享成功
//    if(response.responseCode == UMSResponseCodeSuccess)
//    {
//        // 得到分享到的微博平台名
//        BALog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
//    }
//}
//
//#pragma mark - 友盟登录
///**友盟 QQ 登录**/
//- (void)ba_QQLogin:(UIViewController *)viewController
//{
//    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
//    
//    BA_WEAKSELF;
//    snsPlatform.loginClickHandler(viewController,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
//        
//        //          获取微博用户名、uid、token等
//        
//        if (response.responseCode == UMSResponseCodeSuccess) {
//            
//            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQQ];
//            
//            NSDictionary *dict = [NSDictionary dictionary];
//            dict = @{
//                     @"userName" : snsAccount.userName,
//                     @"usid" : snsAccount.usid,
//                     @"accessToken" : snsAccount.accessToken,
//                     @"iconURL" : snsAccount.iconURL
//                     };
//            // delegate
//            [weakSelf.delegate getUserData:dict];
//
//            BALog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
//        }});
//}
//
///**友盟 Qzone 登录**/
//- (void)ba_QzoneLogin:(UIViewController *)viewController
//{
//    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQzone];
//    BA_WEAKSELF;
//    snsPlatform.loginClickHandler(viewController,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
//        
//        // 获取微博用户名、uid、token等
//        if (response.responseCode == UMSResponseCodeSuccess) {
//            
//            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQzone];
//            
//            NSDictionary *dict = [NSDictionary dictionary];
//            dict = @{
//                     @"userName" : snsAccount.userName,
//                     @"usid" : snsAccount.usid,
//                     @"accessToken" : snsAccount.accessToken,
//                     @"iconURL" : snsAccount.iconURL
//                     };
//            // delegate
//            [weakSelf.delegate getUserData:dict];
//
//            BALog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
//            
//        }});
//}
//
///**友盟 新浪微博 登录**/
//- (void)ba_SinaLogin:(UIViewController *)viewController
//{
//    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
//    BA_WEAKSELF;
//    snsPlatform.loginClickHandler(viewController,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
//        
//        // 获取微博用户名、uid、token等
//        if (response.responseCode == UMSResponseCodeSuccess) {
//            
//            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
//            
//            NSDictionary *dict = [NSDictionary dictionary];
//            dict = @{
//                     @"userName" : snsAccount.userName,
//                     @"usid" : snsAccount.usid,
//                     @"accessToken" : snsAccount.accessToken,
//                     @"iconURL" : snsAccount.iconURL
//                     };
//            // delegate
//            [weakSelf.delegate getUserData:dict];
//
//            BALog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
//            
//        }});
//}
//
///**删除新浪微博登陆授权调用下面的方法**/
//- (void)deleteSinaLogin
//{
//    [[UMSocialDataService defaultDataService] requestUnOauthWithType:UMShareToSina  completion:^(UMSocialResponseEntity *response){
//        BALog(@"response is %@",response);
//    }];
//}
//
///**友盟 微信 登录**/
//- (void)ba_WechatSessionLogin:(UIViewController *)viewController
//{
//    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
//    BA_WEAKSELF;
//    snsPlatform.loginClickHandler(viewController,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
//        
//        if (response.responseCode == UMSResponseCodeSuccess) {
//            
//            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary]valueForKey:UMShareToWechatSession];
//            
//            NSDictionary *dict = [NSDictionary dictionary];
//            dict = @{
//                     @"userName" : snsAccount.userName,
//                     @"usid" : snsAccount.usid,
//                     @"accessToken" : snsAccount.accessToken,
//                     @"iconURL" : snsAccount.iconURL
//                     };
//
//            // delegate
//            [weakSelf.delegate getUserData:dict];
//
////            UMSocialUserInfoResponse *userinfo =result;
////
////            NSString *message = [NSString stringWithFormat:@"name: %@\n icon: %@\n gender: %@\n",userinfo.name,userinfo.iconurl,userinfo.gender];
//
//            BALog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
//        }
//    });
//}
//
///**友盟登录列表**/
//- (void)ba_UMLoginListWithViewControll:(UIViewController *)viewController
//{
////    NSMutableArray *titarray = [NSMutableArray arrayWithObjects:@"微信", @"微博",  @"QQ", @"空间",nil];
////    NSMutableArray *picarray = [NSMutableArray arrayWithObjects:@"BASharManager.bundle/微信好友", @"BASharManager.bundle/新浪微博",  @"BASharManager.bundle/qq好友", @"BASharManager.bundle/qq空间",nil];
//    
//    NSArray *titarray = nil;
//    NSArray *picarray = nil;
//    //    NSMutableArray *titarray = [NSMutableArray arrayWithObjects:@"微信",@"朋友圈",@"微博", @"QQ",@"空间",nil];
//    //    NSMutableArray *picarray = [NSMutableArray arrayWithObjects:@"BASharManager.bundle/微信好友",@"BASharManager.bundle/朋友圈",@"BASharManager.bundle/新浪微博", @"BASharManager.bundle/qq好友", @"BASharManager.bundle/qq空间",nil];
//    
//    if ([WXApi isWXAppInstalled] && [TencentOAuth iphoneQQInstalled])
//    {
//        titarray = @[@"微信",@"微博", @"QQ",@"空间"];
//        picarray = @[@"BASharManager.bundle/微信好友",@"BASharManager.bundle/新浪微博", @"BASharManager.bundle/qq好友", @"BASharManager.bundle/qq空间"];
//    }
//    else if (![WXApi isWXAppInstalled] && [TencentOAuth iphoneQQInstalled])
//    {
//        titarray = @[@"微博", @"QQ",@"空间"];
//        picarray = @[@"BASharManager.bundle/新浪微博", @"BASharManager.bundle/qq好友", @"BASharManager.bundle/qq空间"];
//    }
//    else if ([WXApi isWXAppInstalled] && ![TencentOAuth iphoneQQInstalled])
//    {
//        titarray = @[@"微信",@"微博",];
//        picarray = @[@"BASharManager.bundle/微信好友", @"BASharManager.bundle/新浪微博"];
//    }
//    else if (![WXApi isWXAppInstalled] && ![TencentOAuth iphoneQQInstalled])
//    {
//        titarray = @[@"微博",];
//        picarray = @[@"BASharManager.bundle/新浪微博"];
//    }
//    
//    BAShareAnimationView *animationView = [[BAShareAnimationView alloc]initWithTitleArray:titarray picarray:picarray title:@"第三方登录"];
//    BA_WEAKSELF;
//    [animationView selectedWithIndex:^(NSInteger index,id shareType) {
//        BALog(@"你选择的index ＝＝ %ld",(long)index);
//        BALog(@"要登录的平台");
//        
//        if ([WXApi isWXAppInstalled] && [TencentOAuth iphoneQQInstalled])
//        {
//            switch (index)
//            {
//                    case 1:
//                    [weakSelf ba_WechatSessionLogin:viewController];
//                    break;
//                    case 2:
//                    [weakSelf ba_SinaLogin:viewController];
//                    break;
//                    case 3:
//                    [weakSelf ba_QQLogin:viewController];
//                    break;
//                    case 4:
//                    [weakSelf ba_QzoneLogin:viewController];
//                    break;
//                    
//                default:
//                    break;
//            }
//        }
//        else if (![WXApi isWXAppInstalled] && [TencentOAuth iphoneQQInstalled])
//        {
//            switch (index)
//            {
//                    case 1:
//                    [weakSelf ba_SinaLogin:viewController];
//                    break;
//                    case 2:
//                    [weakSelf ba_QQLogin:viewController];
//                    break;
//                    case 3:
//                    [weakSelf ba_QzoneLogin:viewController];
//                    break;
//                    
//                default:
//                    break;
//            }
//        }
//        else if ([WXApi isWXAppInstalled] && ![TencentOAuth iphoneQQInstalled])
//        {
//            switch (index)
//            {
//                    case 1:
//                    [weakSelf ba_WechatSessionLogin:viewController];
//                    break;
//                    case 2:
//                    [weakSelf ba_SinaLogin:viewController];
//                    break;
//                    
//                default:
//                    break;
//            }
//        }
//        else if (![WXApi isWXAppInstalled] && ![TencentOAuth iphoneQQInstalled])
//        {
//            switch (index)
//            {
//                    case 1:
//                    [weakSelf ba_SinaLogin:viewController];
//                    break;
//                    
//                default:
//                    break;
//            }
//        }
//    }];
//
//    [animationView CLBtnBlock:^(UIButton *btn) {
//        
//        BALog(@"你点了选择/取消按钮");
//    }];
//    [animationView show];
//}
//
//@end
