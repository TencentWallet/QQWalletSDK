//
//  QWURLEncodeEngine.m
//  QQWalletSDK
//
//  Created by stonedong on 14-4-2.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "QWURLEncodeEngine.h"
#import "QQWalletDefines.h"
#import "SBJson4.h"
#import "Base64.h"
#import "QWApplication.h"

NSString* const kQWURLKeyAction      = @"action";
NSString* const kQWURLKeyParams      = @"params";
NSString* const kQWURLKeyApplication = @"application";

@implementation QWURLEncodeEngine

+ (NSURL*) encodeWithAction:(NSDictionary *)action
                     params:(NSDictionary *)params
                      error:(NSError *__autoreleasing *)error
{
    NSMutableDictionary* infos = [NSMutableDictionary new];
    if (action) {
        infos[kQWURLKeyAction] = action;
    }
    if (params) {
        infos[kQWURLKeyParams] = params;
    }
    infos[kQWURLKeyApplication] = [[QWApplication shareApplication] dictionaryWithAllValues];
    NSMutableString* urlString = [NSMutableString stringWithFormat:@"%@://",kQWURLScheme];
    SBJson4Writer* jsonWriter = [SBJson4Writer new];
    NSString* datas = [jsonWriter stringWithObject:infos];
    [urlString appendString:[NSString stringWithFormat:@"%@",[datas base64EncodedString]]];
    NSURL* url = [NSURL URLWithString:urlString];
    if (!url) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:kQWErrorDomain code:QWErrorParamsError userInfo:@{NSLocalizedDescriptionKey:@"参数错误！"}];
        }
        return nil;
    }
    return url;
}

+ (NSDictionary*) decodeWithInfo:(NSURL *)url error:(NSError *__autoreleasing *)error
{
    NSString* string = [url absoluteString];
    NSString* prefix = [NSString stringWithFormat:@"%@://",[QWApplication shareApplication].urlScheme];
    
    NSRange range = [string rangeOfString:prefix];
    if (range.length == NSNotFound || range.location == NSNotFound) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:kQWErrorDomain code:QWErrorParamsError userInfo:@{NSLocalizedDescriptionKey:@"url scheme error"}];
        }
        return nil;
    }
    NSString* datas = [string substringFromIndex:range.location + range.length];
    NSData* jsonData = [datas base64DecodedData];
    
    __block NSDictionary* infos = nil;
    __block NSError* parserError = nil;
    SBJson4Parser* parser = [SBJson4Parser multiRootParserWithBlock:^(id item, BOOL *stop) {
        infos = item;
    } errorHandler:^(NSError *error) {
        parserError = error;
    }];
    //
    [parser parse:jsonData];
    //
    if (parserError) {
        if (error != NULL) {
            *error = parserError;
        }
        return nil;
    }
    return infos;
}
@end
