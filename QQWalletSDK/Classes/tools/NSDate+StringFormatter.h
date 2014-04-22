//
//  NSDate+StringFormatter.h
//  QQWalletSDK
//
//  Created by stonedong on 14-4-1.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
extern NSString* const kQWStringFormatString;


@interface NSDate (StringFormatter)
+ (NSDate*) dateFromString:(NSString*)str;
- (NSString *)string;
@end
