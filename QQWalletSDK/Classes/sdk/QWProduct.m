//
//  QWProduct.m
//  QQWalletSDK
//
//  Created by stonedong on 14-3-31.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "QWProduct.h"

NSString* const kQWProductKeyIdentifer = @"identifier";
NSString* const kQWProductKeyName      = @"name";
NSString* const kQWProductKeyNum       = @"num";
NSString* const kQWProductKeyDetail    = @"detail";

@implementation QWProduct

- (void) setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqual:kQWProductKeyIdentifer]) {
        [self setIdentifier:value];
    } else if ([key  isEqual:kQWProductKeyName])
    {
        [self setName:value];
    } else if ([key isEqual:kQWProductKeyNum])
    {
        [self setNum:[value intValue]];
    } else if ( [key isEqual:kQWProductKeyDetail])
    {
        [self setDetailDescription:value];
    }
}

- (id) valueForKey:(NSString *)key
{
    if ([key isEqual:kQWProductKeyIdentifer]) {
        return _identifier;
    } else if ([key  isEqual:kQWProductKeyName])
    {
        return _name;
    } else if ([key isEqual:kQWProductKeyNum])
    {
        return @(_num);
    } else if ( [key isEqual:kQWProductKeyDetail])
    {
        return _detailDescription;
    }
    return [NSNull null];
}

- (NSDictionary*) dictionaryWithAllValues
{
    return [self dictionaryWithValuesForKeys:@[kQWProductKeyNum,kQWProductKeyName,kQWProductKeyIdentifer,kQWProductKeyDetail]];
}
@end
