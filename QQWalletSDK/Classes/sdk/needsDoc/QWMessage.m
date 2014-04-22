//
//  QWMessage.m
//  QQWalletSDK
//
//  Created by stonedong on 14-3-31.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "QWMessage.h"

#define INIT_EXTERN_STRING(key, value) NSString* const k##key=@""#value
INIT_EXTERN_STRING(QWMessageCode, code);
INIT_EXTERN_STRING(QWMessageText, message);
INIT_EXTERN_STRING(QWMessageInfos, infos);

@implementation QWMessage
- (void) setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqual:kQWMessageCode]) {
        _code = [value intValue];
    } else if ([key isEqual:kQWMessageInfos])
    {
        _infos = value;
    } else if ([key isEqual:kQWMessageText])
    {
        _message = value;
    }
}

- (id) valueForKey:(NSString *)key
{
    if ([key isEqual:kQWMessageCode]) {
        return  @(_code) ;
    } else if ([key isEqual:kQWMessageInfos])
    {
        return _infos ;
    } else if ([key isEqual:kQWMessageText])
    {
        return _message;
    }
    return [NSNull null];
}

- (NSDictionary*) dictionaryWithAllValues
{
    return [self dictionaryWithValuesForKeys:@[kQWMessageText, kQWMessageInfos, kQWMessageCode]];
}
@end
