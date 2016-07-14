//
//  VDThemeElement.h
//  objcTemp
//
//  Created by Deng on 16/7/7.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDThemeSelectorArgument.h"

typedef NS_ENUM(NSInteger, VDThemeElementResourceType) {
    VDThemeElementResourceTypeRemove, // mark for removing element, just for equal judgment
    VDThemeElementResourceTypeColor,
    VDThemeElementResourceTypeImage,
    VDThemeElementResourceTypeFont,
    VDThemeElementResourceTypeAttribute,
};

@class VDThemeElement;


@interface VDThemeElement : NSObject

#pragma mark Public Method
+ (instancetype)elementWithResourceType:(VDThemeElementResourceType)resourceType withSelector:(SEL)selector withArguments:(NSArray *)arguments;

#pragma mark Properties
@property (nonatomic, assign) VDThemeElementResourceType resourceType;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, strong) NSArray *arguments;
@property (nonatomic, strong) VDThemeSelectorArgument *themeSelectorArgument;

@end
