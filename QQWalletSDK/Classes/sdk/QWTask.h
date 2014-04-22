//
//  QWTask.h
//  QQWalletSDK
//
//  Created by stonedong on 14-3-31.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QQWalletDefines.h"
extern NSString* const kQWTaskKeyIdentifier;

@interface QWTask : NSObject
@property (nonatomic, strong) QQTaskCompletion completionBlock;
@property (nonatomic, strong) NSString* identifier;
+ (NSString*) actionName;
- (NSDictionary*) dictionaryWithAllValues;
- (BOOL) start:(NSError *__autoreleasing *)error;
- (BOOL) startWithParams:(NSDictionary *)params error:(NSError *__autoreleasing *)error;
@end
