//
//  QWServerPayTask.m
//  QQWalletSDK
//
//  Created by stonedong on 14-4-3.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "QWServerPayTask.h"

@implementation QWServerPayTask
+ (NSString*) actionName
{
    return @"pay";
}
- (BOOL) start:(NSError *__autoreleasing *)error
{
    NSDictionary* infos = _params;
    return [self startWithParams:infos error:error];
}

- (instancetype) initWithParams:(NSDictionary *)params
{
    self = [super init];
    if (!self) {
        return self;
    }
    _params = params;
    return self;
}

@end
