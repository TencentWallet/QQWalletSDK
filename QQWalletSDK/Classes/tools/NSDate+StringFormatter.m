//
//  NSDate+StringFormatter.m
//  QQWalletSDK
//
//  Created by stonedong on 14-4-1.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "NSDate+StringFormatter.h"
#import "LoadAbleCategory.h"

NSString* const kQWStringFormatString = @"yyyy-MM-dd HH:mm:ss";

//MAKE_CATEGORIES_LOADABLE(NSDate_StringFormatter);

@implementation NSDate (StringFormatter)
- (NSString *)stringWithFormat:(NSString *)format {
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateFormat:format];
	NSString *timestamp_str = [outputFormatter stringFromDate:self];
	return timestamp_str;
}

- (NSString *)string {
	return [self stringWithFormat:kQWStringFormatString];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
	NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
	[inputFormatter setDateFormat:format];
	NSDate *date = [inputFormatter dateFromString:string];
	return date;
}

+ (NSDate*) dateFromString:(NSString*)str
{
    return [self dateFromString:str withFormat:kQWStringFormatString];
}
@end
