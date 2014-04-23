//
//  QWMessage.h
//  QQWalletSDK
//
//  Created by stonedong on 14-3-31.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QQWalletDefines.h"

DEFINE_EXTERN_STRING(QWMessageCode);
DEFINE_EXTERN_STRING(QWMessageText);
DEFINE_EXTERN_STRING(QWMessageInfos);

/**
 *  代表QQWallet调用，回调信息的类
 */
@interface QWMessage : NSObject
/**
 *  回调结果代号，0代表成功，其他值代表出错（并对应响应的出错信息）
 */
@property (nonatomic, assign) int code;
/**
 *  回调提示信息，如果出错，则代表出错的具体错误信息
 */
@property (nonatomic, strong) NSString* message;
/**
 *  按照key-value的方式存储回调结果信息
 */
@property (nonatomic, strong) NSDictionary* infos;

- (NSDictionary*) dictionaryWithAllValues;
@end
