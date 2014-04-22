//
//  QQWalletSDK.m
//  QQWalletSDK
//
//  Created by stonedong on 14-3-31.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "QQWalletSDK.h"
#import <UIKit/UIKit.h>
#import "QWPayTask.h"
#import "QQWallet.h"
#import "QWApplication.h"
#import "QWURLEncodeEngine.h"
#import "QWServerPayTask.h"
@implementation QQWalletSDK

+ (void) startPayWithServerParams:(NSDictionary*)params completion:(QQTaskCompletion)completion
{
    QWServerPayTask* task = [[QWServerPayTask alloc] initWithParams:params];
    task.completionBlock = completion;
    [QQDefaultWallet startTask:task];
}

+ (BOOL) QQWalletSDKHanldeApplication:(UIApplication*)application
                              openURL:(NSURL *)url
                       sourceApplication:(NSString *)sourceApplication
                              annotation:(id)annotation
{

    if (![[url absoluteString] hasPrefix:[QWApplication shareApplication].urlSchemePrefix]) {
        return NO;
    }
    NSError* error = nil;
    NSDictionary* infos = [QWURLEncodeEngine decodeWithInfo:url error:&error];
    [[QQWallet shareInstance] handleResposeWithInfo:infos];
    return YES;
}

+ (void) registerQQWalletApplication:(NSString *)appId urlScheme:(NSString *)urlScheme name:(NSString *)name
{
    QWApplication* application = [QWApplication shareApplication];
    application.name = name;
    application.appId = appId;
    application.urlScheme = urlScheme;
}

@end
