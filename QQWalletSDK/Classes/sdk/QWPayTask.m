//
//  QWPayTask.m
//  QQWalletSDK
//
//  Created by stonedong on 14-3-31.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "QWPayTask.h"

@implementation QWPayTask

+ (NSString*) actionName
{
    return @"pay1";
}
- (BOOL) start:(NSError *__autoreleasing *)error
{
    NSDictionary* infos = [_payment dictionaryWithAllValues];
    return [self startWithParams:infos error:error];
}

- (instancetype) initWithPayment:(QWPayment *)payment
{
    self = [super init];
    if (!self) {
        return self;
    }
    _payment = payment;
    return self;
}

@end
