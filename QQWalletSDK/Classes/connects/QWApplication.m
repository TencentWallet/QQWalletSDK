//
//  QWApplication.m
//  QQWalletSDK
//
//  Created by stonedong on 14-4-2.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "QWApplication.h"
NSString* const kQWAppKeyName = @"name";
NSString* const kQWAppKeyUrlScheme = @"urlScheme";
NSString* const kQWAppKeySDKVersion = @"sdkVersion";
NSString* const kQWAppKeyAPPID=  @"appId";
NSString* const kQWAppKeyType = @"type";

NSString* const kQWAppTypeNative = @"native";
NSString* const kQWAppTypeBrowser = @"browser";

@implementation QWApplication


+ (QWApplication*) shareApplication
{
    static QWApplication* share = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[QWApplication alloc] init];
        share.name = @"unknown application";
        share.urlScheme = @"";
        share.sdkVersion = @"0.0.1";
        share.appId = @"invalid";
        share.type  = kQWAppTypeNative;
    });
    return share;
}
- (NSString*) urlSchemePrefix
{
    return [NSString stringWithFormat:@"%@://",_urlScheme];
}
- (void) setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqual:kQWAppKeyName]) {
        _name = value;
    } else if ([key isEqual:kQWAppKeySDKVersion])
    {
        if ([value isKindOfClass:[NSNumber class]]) {
            value  = [value stringValue];
        } else
        {
            _sdkVersion = value;
        }
    } else if ([key isEqual:kQWAppKeyUrlScheme])
    {
        _urlScheme = value;
    } else if ([key isEqual:kQWAppKeyAPPID])
    {
        _appId = value;
    } else if ([key isEqual:kQWAppKeyType])
    {
        _type = value;
    }
}

- (id) valueForKey:(NSString *)key
{
    if ([key isEqual:kQWAppKeyName]) {
        return _name;
    } else if ([key isEqual:kQWAppKeySDKVersion])
    {
        return _sdkVersion;
    } else if ([key isEqual:kQWAppKeyUrlScheme])
    {
        return _urlScheme;
    } else if ([key isEqual:kQWAppKeyAPPID])
    {
        return _appId;
    } else if ([key isEqual:kQWAppKeyType])
    {
        return _type;
    }
    return [NSNull null];
}

- (NSDictionary*) dictionaryWithAllValues
{
    return [self dictionaryWithValuesForKeys:@[kQWAppKeyUrlScheme, kQWAppKeySDKVersion, kQWAppKeyName, kQWAppKeyAPPID]];
}
@end
