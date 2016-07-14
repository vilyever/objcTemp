//
//  VDJsonObject.m
//  objcTemp
//
//  Created by Deng on 16/6/30.
//  Copyright © Deng. All rights reserved.
//

#import "VDJsonObject.h"

#import "VDMacros.h"


@interface VDJsonObject ()


@end


@implementation VDJsonObject

#pragma mark Public Method
+ (instancetype)modelWithJsonString:(NSString *)jsonString
{
    return [self modelWithJsonString:jsonString usingEncoding:NSUTF8StringEncoding];
}

+ (instancetype)modelWithJsonString:(NSString *)jsonString usingEncoding:(NSStringEncoding)encoding
{
    if (jsonString.length == 0) {
        return nil;
    }
    
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:encoding]
                                                               options:kNilOptions
                                                                 error:&error];
    if (error) {
        NSLog(@"modelWithJsonString error %@", error);
        return nil;
    }
    return [self modelWithDictionary:dictionary];
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary
{
    if (!dictionary) {
        return nil;
    }
    
    id model = [[self alloc] init];
    
    NSDictionary *jsonKeyDictionary = [self jsonKeyDictionary];

    Class ancestorClass = [VDJsonObject class];
    
    // get properties that the model class have (include super class)
    NSArray *properties = [self vd_propertiesTraceToAncestorClass:ancestorClass];
    
    for (VDProperty *property in properties) {
        if ([jsonKeyDictionary objectForKey:property.name]) {
            [self internalInsertJsonValue:dictionary jsonKey:[jsonKeyDictionary objectForKey:property.name] model:model property:property];
        } else {
            [self internalInsertJsonValue:dictionary jsonKey:property.name model:model property:property];
        }
    }
    
    return model;
}

+ (NSArray *)arrayWithJsonString:(NSString *)jsonString
{
    return [self arrayWithJsonString:jsonString usingEncoding:NSUTF8StringEncoding];
}

+ (NSArray *)arrayWithJsonString:(NSString *)jsonString usingEncoding:(NSStringEncoding)encoding
{
    if (jsonString.length == 0) {
        return nil;
    }
    
    NSError *error;
    NSArray *dictionaries = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:encoding]
                                                            options:kNilOptions
                                                              error:&error];
    if (error) {
        NSLog(@"arrayWithJsonString error %@", error);
        return nil;
    }
    return [self arrayWithDictionaries:dictionaries];
}

+ (NSArray *)arrayWithDictionaries:(NSArray *)dictionaries
{
    if (!dictionaries) {
        return nil;
    }
    
    NSMutableArray *array = [NSMutableArray new];
    
    for (NSDictionary *dic in dictionaries)
    {
        [array addObject:[self modelWithDictionary:dic]];
    }
    
    return [NSArray arrayWithArray:array];
}

+ (NSDictionary *)jsonKeyDictionary
{
    return [NSDictionary new];
}

+ (NSDateFormatter *)jsonDateFormatter {
    NSDateFormatter *jsonDateFormatter = [ [NSDateFormatter alloc] init];
    [jsonDateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return jsonDateFormatter;
}

#pragma Public Instance Method
- (NSDictionary *)toJsonDictionary {
    NSMutableDictionary *jsonDictionary = [NSMutableDictionary new];
    
    NSArray *properties = [[self class] vd_propertiesTraceToAncestorClass:[VDJsonObject class]];
    
    NSDictionary *jsonKeyDictionary = [[self class] jsonKeyDictionary];
    
    for (VDProperty *property in properties)
    {
        if (![property.protocols containsObject:@protocol(VDJsonIgnore)])
        {
            for (NSString *propertyName in jsonKeyDictionary.allKeys)
            {
                if ([propertyName isEqualToString:property.name])
                {
                    id value;
                    if ([property.type isSubclassOfClass:[VDJsonObject class]])
                    {
                        value = [[self valueForKey:property.name] toJsonDictionary];
                    }
                    else if (property.type == [NSArray class]
                             || property.type == [NSMutableArray class])
                    {
                        BOOL isJsonObjectArray = NO;
                        for (NSString *protocolName in property.protocols) {
                            Class protocolClass = NSClassFromString(protocolName);
                            if ([protocolClass isSubclassOfClass:[VDJsonObject class]]) {
                                isJsonObjectArray = YES;
                                break;
                            }
                        }
                        
                        if (isJsonObjectArray) {
                            NSMutableArray *values = [NSMutableArray new];
                            NSArray *models = [self valueForKey:property.name];
                            for (id model in models) {
                                [values addObject:[model toJsonDictionary]];
                            }
                            value = values;
                        } else {
                            value = [[self class] internalGetValueFromModel:self property:property];
                        }
                    }
                    else
                    {
                        value = [[self class] internalGetValueFromModel:self property:property];
                    }
                    
                    if (!value) {
                        value = @"";
                    }
                    [jsonDictionary setObject:value forKey:[jsonKeyDictionary objectForKey:propertyName]];
                    break;
                }
            }
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:jsonDictionary];
}

- (NSString *)toJsonString {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[self toJsonDictionary] options:0 error:&error];
    
    if (!jsonData) {
        return @"{}";
    }
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


#pragma mark Properties


#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    
    return self;
}

- (void)dealloc {
    
}

- (NSString *)description {
    NSString *originalDescription = [super description];
    
    NSMutableString *description = [NSMutableString stringWithFormat:@"\n< %@ > \n", originalDescription];
    
    Class ancestorClass = [VDJsonObject class];
    
    NSArray *properties = [[self class] vd_propertiesTraceToAncestorClass:ancestorClass];
    
    NSDictionary *jsonKeyDictionary = [[self class] jsonKeyDictionary];
    
    for (VDProperty *property in properties)
    {
        if (![property.protocols containsObject:@protocol(VDJsonIgnore)])
        {
            id value = [self.class internalGetValueFromModel:self property:property];
            if (!value) {
                continue;
            }
            
            NSString *appendString = @"";
            for (NSString *propertyName in jsonKeyDictionary.allKeys)
            {
                if ([propertyName isEqualToString:property.name])
                {
                    appendString = VDStringFormat(@" (%@) ", [jsonKeyDictionary objectForKey:propertyName]);
                    break;
                }
            }
            
            [description appendFormat:@"[%@%@] : %@ \n", property.name, appendString, value];
        }
    }
    
    [description appendFormat:@"</%@>", [self class]];
    
    return description;
}


#pragma mark Delegates


#pragma mark Private Method
+ (void)internalInsertJsonValue:(NSDictionary *)jsonDictionary jsonKey:(NSString *)jsonKey model:(id)model property:(VDProperty *)property {
    
    if (![jsonDictionary objectForKey:jsonKey]) {
        return;
    }
    
    if (property.isPrimitive)
    {
        [model setValue:[jsonDictionary objectForKey:jsonKey] forKeyPath:property.name];
    }
    else if (property.type == [NSString class])
    {
        [model setValue:[jsonDictionary objectForKey:jsonKey] forKeyPath:property.name];
    }
    else if (property.type == [NSNumber class])
    {
        [model setValue:[jsonDictionary objectForKey:jsonKey] forKeyPath:property.name];
    }
    else if (property.type == [NSDate class])
    {
        NSDateFormatter *jsonDateFormatter = [self jsonDateFormatter];
        NSDate *destDate= [jsonDateFormatter dateFromString:[jsonDictionary objectForKey:jsonKey]];
        [model setValue:destDate forKeyPath:property.name];
    }
    else if (property.type == [NSArray class]
             || property.type == [NSMutableArray class])
    {
        for (NSString *protocolName in property.protocols)
        {
            Class protocolClass = NSClassFromString(protocolName);
            if (protocolClass)
            {
                NSArray *array = [protocolClass arrayWithDictionaries:[jsonDictionary objectForKey:jsonKey]];
                
                if (property.type == [NSArray class])
                {
                    [model setValue:array forKey:property.name];
                }
                else if (property.type == [NSMutableArray class])
                {
                    [model setValue:[NSMutableArray arrayWithArray:array] forKey:property.name];
                }
                break;
            }
        }
    }
    else if ([property.type isSubclassOfClass:[VDJsonObject class]])
    {
        [model setValue:[property.type modelWithDictionary:[jsonDictionary objectForKey:jsonKey]] forKey:property.name];
    }
    
}

+ (id)internalGetValueFromModel:(id)model property:(VDProperty *)property {
    if (property.isPrimitive)
    {
        return [model valueForKey:property.name];
    }
    else if (property.type == [NSString class])
    {
        return [model valueForKey:property.name];
    }
    else if (property.type == [NSNumber class])
    {
        return [model valueForKey:property.name];
    }
    else if (property.type == [NSDate class])
    {
        NSDateFormatter *jsonDateFormatter = [self jsonDateFormatter];
        NSDate *date = [model valueForKey:property.name];
        return [jsonDateFormatter stringFromDate:date];
    }
    else if (property.type == [NSArray class]
             || property.type == [NSMutableArray class])
    {
        return [model valueForKey:property.name];
    }
    else if ([property.type isSubclassOfClass:[VDJsonObject class]])
    {
        return [model valueForKey:property.name];
    }
    
    return nil;
}

@end
