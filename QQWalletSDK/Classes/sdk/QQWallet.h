//
//  QQWallet.h
//  QQWalletSDK
//
//  Created by stonedong on 14-3-31.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QQWalletDefines.h"

#define QQDefaultWallet [QQWallet shareInstance]

@class QWTask;
@interface QQWallet : NSObject
@property (nonatomic, strong, readonly) QWTask* currentTask;
+ (QQWallet*) shareInstance;
- (void) startTask:(QWTask*)task;
- (void) handleResposeWithInfo:(NSDictionary*)infos;
@end
