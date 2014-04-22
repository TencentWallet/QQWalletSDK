//
//  QWPayTask.h
//  QQWalletSDK
//
//  Created by stonedong on 14-3-31.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "QWTask.h"
#import "QWPayment.h"
@interface QWPayTask : QWTask
@property (nonatomic, strong) QWPayment* payment;
- (instancetype) initWithPayment:(QWPayment*)payment;
@end
