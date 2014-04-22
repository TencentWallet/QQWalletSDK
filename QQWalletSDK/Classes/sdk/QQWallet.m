//
//  QQWallet.m
//  QQWalletSDK
//
//  Created by stonedong on 14-3-31.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "QQWallet.h"
#import "QWTask.h"
#import "QWPayment.h"
#import "QWProduct.h"
#import "QWURLEncodeEngine.h"
#import "QWMessage.h"
@implementation QQWallet
@synthesize currentTask = _currentTask;

+ (QQWallet*) shareInstance
{
    static QQWallet* share = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [QQWallet new];
    });
    return share;
}

- (void) startTask:(QWTask *)task
{
    if (!SystemSupportQQWallet) {
       NSError *error = [NSError errorWithDomain:kQWErrorDomain
                                            code:QWErrorNotSupport
                                        userInfo:@{NSLocalizedDescriptionKey:@"not support"}
                         ];
        if (task.completionBlock) {
            task.completionBlock(nil , error);
        }
        return;
    }
    _currentTask = task;
    NSError* error = nil;
    if (![_currentTask start:&error]) {
        if (task.completionBlock) {
            task.completionBlock(nil, error);
        }
    }
}

- (void) handleResposeWithInfo:(NSDictionary *)infos
{
    NSDictionary* actions = infos[kQWURLKeyAction];
    NSDictionary* params =  infos[kQWURLKeyParams];
    
    QWMessage* message = [QWMessage new];
    [message setValuesForKeysWithDictionary:params];
    
    NSString* identifier = actions[kQWTaskKeyIdentifier];
    if (![identifier isEqual:_currentTask.identifier]) {
        return;
    }
    NSError* error = nil;
    if (message.code != 0) {
        error = [NSError errorWithDomain:kQWErrorDomain code:message.code userInfo:@{NSLocalizedDescriptionKey: message.message ? message.message: @"unknow!"}];
    }
    if (_currentTask.completionBlock) {
        _currentTask.completionBlock(message, error);
    }
}
@end
