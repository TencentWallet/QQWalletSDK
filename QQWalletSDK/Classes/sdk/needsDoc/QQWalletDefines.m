//
//  QQWalletDefines.m
//  QQWalletSDK
//
//  Created by stonedong on 14-3-31.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "QQWalletDefines.h"
#import <UIKit/UIKit.h>

NSString* const kQWURLScheme = @"mqqwallet";
NSString* const kQWErrorDomain = @"com.tencent.qw.error";

//
 NSString* const kQWPayParamTokenID = @"token_id";
 NSString* const kQWPayParamPubHint =  @"pubHint";
 NSString* const kQWPayParamPubAccountID = @"pubAcc";

BOOL IsSupportQQWallet()
{
    NSString* fullUrl = [NSString stringWithFormat:@"%@://wallet/pay?src_type=app&callback_name=myQQPayDemo&order_no=000000000111111&callback_type=scheme&version=1", kQWURLScheme];
    
    NSURL* url = [NSURL URLWithString:fullUrl];
    if([[UIApplication sharedApplication] canOpenURL:url])
    {
        return YES;
    }
    return NO;
}