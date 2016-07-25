//
//  VDKVOElement.h
//  objcTemp
//
//  Created by Deng on 16/7/25.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>


@class VDKVOElement;


@interface VDKVOElement : NSObject

#pragma mark Public Method
- (instancetype)initWithTarget:(id)target keyPath:(NSString *)keyPath kvoBlock:(void(^)(VDKVOElement *element, NSDictionary *change))kvoBlock;
- (void)dispose;

#pragma mark Properties
@property (nonatomic, weak) id target;
@property (nonatomic, copy) NSString *keyPath;
@property (nonatomic, strong) void(^kvoBlock)(VDKVOElement *element, NSDictionary *change);

@property (nonatomic, assign, readonly) BOOL isDisposed;

#pragma mark Private Method
- (void)internalInitVDKVOElement;


@end
