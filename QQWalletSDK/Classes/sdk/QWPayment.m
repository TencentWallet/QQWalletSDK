//
//  QWPayment.m
//  QQWalletSDK
//
//  Created by stonedong on 14-3-31.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "QWPayment.h"
#import "QWProduct.h"
#import "NSDate+StringFormatter.h"
NSString* const kQWPaymentOrderID = @"order_id";
NSString* const kQWPaymentPartnerOrderId = @"partner_order_id";
NSString* const kQWPaymentTransTotal = @"trans_total";
NSString* const kQWPaymentCurrentCyID = @"current_cy_id";
NSString* const kQWPaymentTranstDate = @"trans_date";
NSString* const kQWPaymentProduct = @"product";

@implementation QWPayment
- (void) setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqual:kQWPaymentOrderID]) {
        [self setOrderId:value];
    } else if ([key isEqual:kQWPaymentCurrentCyID])
    {
        [self setCurrentCyId:[value intValue]];
    } else if ([key isEqualToString:kQWPaymentPartnerOrderId])
    {
        [self setPartnerOrderId:value];
    } else if ([key isEqualToString:kQWPaymentTranstDate])
    {
        NSDate* date = nil;
        if ([value isKindOfClass:[NSDate class]]) {
            date = value;
        } else if ([value isKindOfClass:[NSString class]])
        {
            date = [NSDate dateFromString:value];
        }
        [self setTranstDate:date];
    } else if ([key isEqualToString:kQWPaymentProduct])
    {
        QWProduct* product = nil;
        if ([value isKindOfClass:[QWProduct class]]) {
            product = value;
        } else if ([value isKindOfClass:[NSDictionary class]])
        {
            product = [[QWProduct alloc] init];
            [product setValuesForKeysWithDictionary:value];
        }
        [self setProduct:product];
    } else if ([key isEqualToString:kQWPaymentTransTotal])
    {
        [self setTranstotal:[value floatValue]];
    }
}

- (id) valueForKey:(NSString *)key
{
    if ([key isEqual:kQWPaymentOrderID]) {
        return _orderId;
    } else if ([key isEqual:kQWPaymentCurrentCyID])
    {
        return @(_currentCyId);
    } else if ([key isEqualToString:kQWPaymentPartnerOrderId])
    {
        return _partnerOrderId;
    } else if ([key isEqualToString:kQWPaymentTranstDate])
    {
        return [_transtDate string];
    } else if ([key isEqualToString:kQWPaymentProduct])
    {
        return [_product dictionaryWithAllValues];
    } else if ([key isEqualToString:kQWPaymentTransTotal])
    {
        return @(_transtotal);
    }
    return [NSNull null];
}

- (NSDictionary*) dictionaryWithAllValues
{
    return [self dictionaryWithValuesForKeys:@[kQWPaymentTransTotal,
                                               kQWPaymentTranstDate,
                                               kQWPaymentProduct,
                                               kQWPaymentPartnerOrderId,
                                               kQWPaymentOrderID,
                                               kQWPaymentCurrentCyID]];
}
@end
