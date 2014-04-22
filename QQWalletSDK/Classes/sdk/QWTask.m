//
//  QWTask.m
//  QQWalletSDK
//
//  Created by stonedong on 14-3-31.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "QWTask.h"
#import "QQWalletDefines.h"
#import "QWURLEncodeEngine.h"
#import <UIKit/UIKit.h>
#import "QWApplication.h"

NSString* const kQWTaskKeyIdentifier = @"identifier";
NSString* const kQWTaskKeyActionName = @"name";

@implementation QWTask
@synthesize identifier = _identifier;
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _identifier = [NSString stringWithFormat:@"%d%d",rand(),rand()];
    return self;
}

- (void) setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqual:kQWTaskKeyIdentifier])
    {
        _identifier = value;
    }
}

- (id) valueForKey:(NSString *)key
{
    if ([key isEqual:kQWTaskKeyActionName]) {
        return [[self class] actionName];
    } else if ([key isEqual:kQWTaskKeyIdentifier])
    {
        return _identifier;
    }
    return [NSNull null];
}

- (NSDictionary*) dictionaryWithAllValues
{
    return [self dictionaryWithValuesForKeys:@[kQWTaskKeyIdentifier, kQWTaskKeyActionName]];
}

+ (NSString*) actionName
{
    return @"not_support";
}
- (BOOL) start:(NSError *__autoreleasing *)error
{
    return [self startWithParams:nil  error:error];
}

- (BOOL) startWithParams:(NSDictionary *)params error:(NSError *__autoreleasing *)error
{
    NSURL* url = [QWURLEncodeEngine encodeWithAction:[self dictionaryWithAllValues] params:params error:error];
    if (!url) {
        return NO;
    }
    [[UIApplication sharedApplication] openURL:url];
    return YES;
}

@end
