//
//  VDJsonObject.h
//  objcTemp
//
//  Created by Deng on 16/6/30.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>


@class VDJsonObject;

@protocol VDJsonIgnore <NSObject>
@end


@interface VDJsonObject : NSObject

#pragma mark Public Method
+ (instancetype)modelWithJsonString:(NSString *)jsonString;
+ (instancetype)modelWithJsonString:(NSString *)jsonString usingEncoding:(NSStringEncoding)encoding;

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;

+ (NSArray *)arrayWithJsonString:(NSString *)jsonString;
+ (NSArray *)arrayWithJsonString:(NSString *)jsonString usingEncoding:(NSStringEncoding)encoding;

+ (NSArray *)arrayWithDictionaries:(NSArray *)dictionaries;

+ (NSMutableDictionary *)jsonKeyDictionary;
+ (NSDateFormatter *)jsonDateFormatter;

- (NSDictionary *)toJsonDictionary;
- (NSString *)toJsonString;

#pragma mark Properties


@end
