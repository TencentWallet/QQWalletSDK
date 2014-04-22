//
//  QWURLEncodeEngine.h
//  QQWalletSDK
//
//  Created by stonedong on 14-4-2.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const kQWURLKeyAction;
extern NSString* const kQWURLKeyParams;
extern NSString* const kQWURLKeyApplication;

@interface QWURLEncodeEngine : NSObject

+ (NSURL*) encodeWithAction:(NSDictionary*)action params:(NSDictionary*)params error:(NSError* __autoreleasing *)error;
+ (NSDictionary*) decodeWithInfo:(NSURL *)url error:(NSError *__autoreleasing *)error;
@end
