//
//  QWProduct.h
//  QQWalletSDK
//
//  Created by stonedong on 14-3-31.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const kQWProductKeyIdentifer;
extern NSString* const kQWProductKeyName;
extern NSString* const kQWProductKeyNum;
extern NSString* const kQWProductKeyDetail;


@interface QWProduct : NSObject
@property (nonatomic, strong) NSString* identifier;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) int num;
@property (nonatomic, strong) NSString* detailDescription;

- (NSDictionary*) dictionaryWithAllValues;
@end
