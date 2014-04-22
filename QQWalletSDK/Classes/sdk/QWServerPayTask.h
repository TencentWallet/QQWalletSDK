//
//  QWServerPayTask.h
//  QQWalletSDK
//
//  Created by stonedong on 14-4-3.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "QWTask.h"

@interface QWServerPayTask : QWTask
@property (nonatomic, strong) NSDictionary* params;

- (instancetype) initWithParams:(NSDictionary*)params;
@end
