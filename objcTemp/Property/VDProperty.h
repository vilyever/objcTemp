//
//  VDProperty.h
//  objcTemp
//
//  Created by Deng on 16/6/30.
//  Copyright © Deng. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, VDPropertyAccessorType) {
    VDPropertyAccessorTypeOriginal,
    VDPropertyAccessorTypeCustom
};

typedef NS_ENUM(NSInteger, VDPropertyPrimitiveType) {
    VDPropertyPrimitiveTypeIntOrSignedOrEnumOrNSInteger,
    VDPropertyPrimitiveTypeUnsignedIntOrNSUinteger,
    VDPropertyPrimitiveTypeShort,
    VDPropertyPrimitiveTypeUnsignedShort,
    VDPropertyPrimitiveTypeLong,
    VDPropertyPrimitiveTypeUnsignedLong,
    VDPropertyPrimitiveTypeLongLong,
    VDPropertyPrimitiveTypeUnsignedLongLong,
    VDPropertyPrimitiveTypeCharOrBOOL,
    VDPropertyPrimitiveTypeUnsignedChar,
    VDPropertyPrimitiveTypeFloat,
    VDPropertyPrimitiveTypeDouble,
    VDPropertyPrimitiveTypeLongDouble,
    VDPropertyPrimitiveTypeBlock,
    VDPropertyPrimitiveTypeVoidPointer,
    VDPropertyPrimitiveTypeID,
    VDPropertyPrimitiveTypeSEL,
    VDPropertyPrimitiveTypeClass,
    VDPropertyPrimitiveTypeStruct,
    VDPropertyPrimitiveTypeUnion
};

@class VDProperty;

@protocol VDPropertyIgnore
@end

@interface VDProperty : NSObject

#pragma mark Public Method
+ (NSArray *)propertiesWithClass:(Class)objClass;
+ (NSArray *)propertiesWithClass:(Class)objClass traceToAncestorClass:(Class)ancestorClass;

#pragma mark Properties
@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) Class type;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic, assign, readonly) VDPropertyPrimitiveType primitiveType;

/** 所属类,声明此property的类 */
@property (nonatomic, copy) Class ownerClass;

/** 若为Struct */
@property (nonatomic, copy) NSString *structName;

/** 若为Union */
@property (nonatomic, copy) NSString *unionName;

/** 所有的protocol Name */
@property (nonatomic, strong, readonly) NSArray *protocols;

@property (nonatomic, assign, readonly) BOOL isIgnore;
@property (nonatomic, assign, readonly) BOOL isReadonly;
@property (nonatomic, assign, readonly) BOOL isStrong; // or retain
@property (nonatomic, assign, readonly) BOOL isWeak;
@property (nonatomic, assign, readonly) BOOL isCopy;
@property (nonatomic, assign, readonly) BOOL isAssign;
@property (nonatomic, assign, readonly) BOOL isDynamic;
@property (nonatomic, assign, readonly) BOOL isNonatomic;
@property (nonatomic, assign, readonly) BOOL isPrimitive;
@property (nonatomic, assign, readonly) BOOL isID;
@property (nonatomic, assign, readonly) BOOL isSEL;
@property (nonatomic, assign, readonly) BOOL isMutable;
@property (nonatomic, assign, readonly) BOOL isStruct;
@property (nonatomic, assign, readonly) BOOL isUnion;
@property (nonatomic, assign, readonly) BOOL isPointer;

@property (nonatomic, assign, readonly) VDPropertyAccessorType getterType;
@property (nonatomic, copy) NSString *getterSelectorName;

@property (nonatomic, assign, readonly) VDPropertyAccessorType setterType;
@property (nonatomic, copy) NSString *setterSelectorName;

@end
