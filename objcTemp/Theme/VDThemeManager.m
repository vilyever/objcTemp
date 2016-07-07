//
//  VDThemeManager.m
//  objcTemp
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import "VDThemeManager.h"
#import "NSObject+VDEnhance.h"
#import "NSObject+VDThemeManager.h"
#import "VDWeakRef.h"

@interface VDThemeManager ()

@property (nonatomic, strong) NSMutableArray *themeTargets;

@end


@implementation VDThemeManager

#pragma mark Public Method
+ (UIColor *)colorForKey:(NSString *)key {
    if ([[VDThemeManager vd_sharedInstance].datasource respondsToSelector:@selector(colorForThemeType:withKey:)]) {
        return [[VDThemeManager vd_sharedInstance].datasource colorForThemeType:[VDThemeManager vd_sharedInstance].themeType withKey:key];
    }
    
    return nil;
}
+ (UIImage *)imageForKey:(NSString *)key {
    if ([[VDThemeManager vd_sharedInstance].datasource respondsToSelector:@selector(imageForThemeType:withKey:)]) {
        return [[VDThemeManager vd_sharedInstance].datasource imageForThemeType:[VDThemeManager vd_sharedInstance].themeType withKey:key];
    }
    
    return nil;
}

+ (UIFont *)fontForKey:(NSString *)key {
    if ([[VDThemeManager vd_sharedInstance].datasource respondsToSelector:@selector(fontForThemeType:withKey:)]) {
        return [[VDThemeManager vd_sharedInstance].datasource fontForThemeType:[VDThemeManager vd_sharedInstance].themeType withKey:key];
    }
    
    return nil;
}

+ (id)attributeForKey:(NSString *)key {
    if ([[VDThemeManager vd_sharedInstance].datasource respondsToSelector:@selector(attributeForThemeType:withKey:)]) {
        return [[VDThemeManager vd_sharedInstance].datasource attributeForThemeType:[VDThemeManager vd_sharedInstance].themeType withKey:key];
    }
    
    return nil;
}

+ (void)setColorForTarget:(id)target withSelector:(SEL)selector withArguments:(NSArray *)arguments {
    [target vd_addThemeElement:[VDThemeElement elementWithResourceType:VDThemeElementResourceTypeColor withSelector:selector withArguments:arguments]];
    [[VDThemeManager vd_sharedInstance] internalAddTarget:target];
}

+ (void)setImageForTarget:(id)target withSelector:(SEL)selector withArguments:(NSArray *)arguments {
    [target vd_addThemeElement:[VDThemeElement elementWithResourceType:VDThemeElementResourceTypeImage withSelector:selector withArguments:arguments]];
    [[VDThemeManager vd_sharedInstance] internalAddTarget:target];
}

+ (void)setFontForTarget:(id)target withSelector:(SEL)selector withArguments:(NSArray *)arguments {
    [target vd_addThemeElement:[VDThemeElement elementWithResourceType:VDThemeElementResourceTypeFont withSelector:selector withArguments:arguments]];
    [[VDThemeManager vd_sharedInstance] internalAddTarget:target];
}

+ (void)setAttributeForTarget:(id)target withSelector:(SEL)selector withArguments:(NSArray *)arguments {
    [target vd_addThemeElement:[VDThemeElement elementWithResourceType:VDThemeElementResourceTypeAttribute withSelector:selector withArguments:arguments]];
    [[VDThemeManager vd_sharedInstance] internalAddTarget:target];
}

#pragma mark Properties
- (void)setThemeType:(NSInteger)themeType {
    if (_themeType != themeType) {
        [self internalOnThemeChange:themeType withOldThemeType:_themeType];
        _themeType = themeType;
    }
}

- (NSMutableArray *)themeTargets {
    if (!_themeTargets) {
        _themeTargets = [NSMutableArray new];
    }
    
    return _themeTargets;
}

#pragma mark Overrides
- (instancetype)init {
    self = [super init];
    if (self) {
        [self internalInit];
    }
    
    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Private Method
- (void)internalInit {
    
}
        
- (void)internalAddTarget:(id)target {
    if (![self.themeTargets containsObject:target]) {
        [self.themeTargets addObject:[VDWeakRef refWithObject:target]];
    }
}

- (void)internalOnThemeChange:(NSInteger)newThemeType withOldThemeType:(NSInteger)oldThemeType {
    for (id target in self.themeTargets) {
        [target vd_onThemeChange:newThemeType withOldThemeType:oldThemeType];
    }
}

@end
