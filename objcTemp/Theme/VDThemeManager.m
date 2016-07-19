//
//  VDThemeManager.m
//  objcTemp
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import "VDThemeManager.h"
#import "NSObject+VDEnhance.h"
#import "VDWeakRef.h"
#import "NSObject+VDThemeManager.h"

#if !VDThemeManagerThemeTypeKey
#define VDThemeManagerThemeTypeKey \
[NSString stringWithFormat:@"VDThemeManagerThemeTypeKey"]
#endif

NSString * const VDThemeManagerThemeTypeDidChangeNotification = @"VDThemeManagerThemeTypeDidChangeNotification";
NSString * const VDThemeManagerThemeTypeDidChangeNotificationUserInfoNewThemeTypeKey = @"VDThemeManagerThemeTypeDidChangeNotificationUserInfoNewThemeTypeKey";
NSString * const VDThemeManagerThemeTypeDidChangeNotificationUserInfoOldThemeTypeKey = @"VDThemeManagerThemeTypeDidChangeNotificationUserInfoOldThemeTypeKey";

@interface VDThemeManager ()

@property (nonatomic, assign) BOOL isThemeChangedBefore;

@property (nonatomic, strong) NSMutableArray *themeTargets;

@end


@implementation VDThemeManager

#pragma mark Public Method
+ (VDThemeManager *)sharedManager {
    return [self vd_sharedInstance];
}

+ (void)bindDatasource:(id<VDThemeManagerDatasource>)datasource {
    [[VDThemeManager sharedManager] setDatasource:datasource];
}

+ (void)setupThemeChangeAnimationDuration:(NSTimeInterval)duration {
    [[VDThemeManager sharedManager] setAnimationDuration:duration];
}

+ (void)changeThemeType:(NSInteger)themeType {
    [[VDThemeManager sharedManager] setThemeType:themeType];
}

+ (void)setDefaultThemeType:(NSInteger)defaultThemeType {
    if (![VDThemeManager sharedManager].isThemeChangedBefore) {
        [self changeThemeType:defaultThemeType];
    }
}

+ (NSInteger)currentThemeType {
    return [VDThemeManager sharedManager].themeType;
}

+ (UIColor *)colorForKey:(NSString *)key {
    if ([[VDThemeManager sharedManager].datasource respondsToSelector:@selector(colorForThemeType:withKey:)]) {
        return [[VDThemeManager sharedManager].datasource colorForThemeType:[VDThemeManager sharedManager].themeType withKey:key];
    }
    
    return nil;
}
+ (UIImage *)imageForKey:(NSString *)key {
    if ([[VDThemeManager sharedManager].datasource respondsToSelector:@selector(imageForThemeType:withKey:)]) {
        return [[VDThemeManager sharedManager].datasource imageForThemeType:[VDThemeManager sharedManager].themeType withKey:key];
    }
    
    return nil;
}

+ (UIFont *)fontForKey:(NSString *)key {
    if ([[VDThemeManager sharedManager].datasource respondsToSelector:@selector(fontForThemeType:withKey:)]) {
        return [[VDThemeManager sharedManager].datasource fontForThemeType:[VDThemeManager sharedManager].themeType withKey:key];
    }
    
    return nil;
}

+ (id)attributeForKey:(NSString *)key {
    if ([[VDThemeManager sharedManager].datasource respondsToSelector:@selector(attributeForThemeType:withKey:)]) {
        return [[VDThemeManager sharedManager].datasource attributeForThemeType:[VDThemeManager sharedManager].themeType withKey:key];
    }
    
    return nil;
}

+ (void)setColorForTarget:(id)target withSelector:(SEL)selector withArguments:(NSArray *)arguments {
    [target vd_addThemeElement:[VDThemeElement elementWithResourceType:VDThemeElementResourceTypeColor withSelector:selector withArguments:arguments]];
    [[VDThemeManager sharedManager] internalAddTarget:target];
}

+ (void)setImageForTarget:(id)target withSelector:(SEL)selector withArguments:(NSArray *)arguments {
    [target vd_addThemeElement:[VDThemeElement elementWithResourceType:VDThemeElementResourceTypeImage withSelector:selector withArguments:arguments]];
    [[VDThemeManager sharedManager] internalAddTarget:target];
}

+ (void)setFontForTarget:(id)target withSelector:(SEL)selector withArguments:(NSArray *)arguments {
    [target vd_addThemeElement:[VDThemeElement elementWithResourceType:VDThemeElementResourceTypeFont withSelector:selector withArguments:arguments]];
    [[VDThemeManager sharedManager] internalAddTarget:target];
}

+ (void)setAttributeForTarget:(id)target withSelector:(SEL)selector withArguments:(NSArray *)arguments {
    [target vd_addThemeElement:[VDThemeElement elementWithResourceType:VDThemeElementResourceTypeAttribute withSelector:selector withArguments:arguments]];
    [[VDThemeManager sharedManager] internalAddTarget:target];
}

+ (void)removeTarget:(id)target {
    [target vd_clearThemeElements];
}

+ (void)removeTarget:(id)target withSelector:(SEL)selector withArguments:(NSArray *)arguments {
    [target vd_removeThemeElement:[VDThemeElement elementWithResourceType:VDThemeElementResourceTypeRemove withSelector:selector withArguments:arguments]];
}

#pragma mark Properties
- (void)setThemeType:(NSInteger)themeType {
    if (_themeType != themeType) {
        NSInteger oldThemeType = _themeType;
        _themeType = themeType;
        [[NSUserDefaults standardUserDefaults] setObject:@(_themeType) forKey:VDThemeManagerThemeTypeKey];
        [self internalOnThemeChange:_themeType withOldThemeType:oldThemeType];
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
    
    NSNumber *themeType = [[NSUserDefaults standardUserDefaults] objectForKey:VDThemeManagerThemeTypeKey];
    if (themeType) {
        self.isThemeChangedBefore = YES;
        self.themeType = [themeType integerValue];
    }
    
    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Private Method      
- (void)internalAddTarget:(id)target {
    if (![self.themeTargets containsObject:target]) {
        [self.themeTargets addObject:[target vd_weakRef]];
    }
}

- (void)internalOnThemeChange:(NSInteger)newThemeType withOldThemeType:(NSInteger)oldThemeType {
    for (id target in self.themeTargets) {
        if ([target respondsToSelector:@selector(vd_onThemeChange:withOldThemeType:)]) {
            [target vd_onThemeChange:newThemeType withOldThemeType:oldThemeType];
        }
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:VDThemeManagerThemeTypeDidChangeNotification object:nil userInfo:@{
                                                                                                                            VDThemeManagerThemeTypeDidChangeNotificationUserInfoNewThemeTypeKey:@(newThemeType),
                                                                                                                            VDThemeManagerThemeTypeDidChangeNotificationUserInfoNewThemeTypeKey:@(oldThemeType),
                                                                                                                                  }];
}

@end
