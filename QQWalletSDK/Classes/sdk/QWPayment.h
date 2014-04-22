//
//  QWPayment.h
//  QQWalletSDK
//
//  Created by stonedong on 14-3-31.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const kQWPaymentOrderID;
extern NSString* const kQWPaymentPartnerOrderId;
extern NSString* const kQWPaymentTransTotal;
extern NSString* const kQWPaymentCurrentCyID;
extern NSString* const kQWPaymentTranstDate;
extern NSString* const kQWPaymentProduct;


@class QWProduct;
@interface QWPayment : NSObject
@property (nonatomic, strong) NSString* orderId;
@property (nonatomic, strong) NSString* partnerOrderId;
@property (nonatomic, assign) float transtotal;
@property (nonatomic, assign) int currentCyId;
@property (nonatomic, strong) NSDate* transtDate;
@property (nonatomic, strong) QWProduct* product;
- (NSDictionary*) dictionaryWithAllValues;
@end
