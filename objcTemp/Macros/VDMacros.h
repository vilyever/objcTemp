//
//  VDMacros.h
//  objcTempUtilities
//
//  Created by Deng on 16/6/15.
//  Copyright © Deng. All rights reserved.
//

#ifndef VDMacros_h
#define VDMacros_h


#pragma mark Log
#if !VDLog
#define VDLog(frmt, ...) \
NSLog(@"\nMethod: %s\nLine: %d\nLog: %@\n   ", __FUNCTION__, __LINE__, [NSString stringWithFormat:frmt, ##__VA_ARGS__])
#endif


#pragma mark weak self for block
#if !VDWeakifySelf
#define VDWeakifySelf \
__weak __typeof(&*self)vd_weak_object = self

#define VDStrongifySelf \
__strong __typeof(&*vd_weak_object)self = vd_weak_object
#endif


#pragma mark Keypath
#if !VDKeyPath
#define VDKeyPath(Target, Path) \
@(((void)(NO && ((void)Target.Path, NO)), # Path))
#endif


#pragma mark String
#if !VDStringFormat
#define VDStringFormat(frmt, ...) \
([NSString stringWithFormat:frmt, ##__VA_ARGS__])
#endif

#if !VDStringWithInteger
#define VDStringWithInteger(integer) \
[NSString stringWithFormat:@"%@", @(integer)]
#endif

#if !VDIdentifier
#define VDIdentifier \
([NSString stringWithFormat:@"%p_%s_%d", self, __FUNCTION__, __LINE__])
#endif

#if !VDStringYES
#define VDStringYES \
@"YES"
#define VDStringNO \
@"NO"
#endif

#if !VDStringLineBreaker
#define VDStringLineBreaker \
@"\r\n"
#endif

#if !VDBOOLToString
#define VDBOOLToString(bool) \
((bool) ? VDStringYES : VDStringNO)
#endif

#if !VDStringWithBOOL
#define VDStringWithBOOL(b) \
((bool) ? VDStringYES : VDStringNO)
#endif


#pragma mark Array
#if !VDArrayCount
#define VDArrayCount(array, type) \
(sizeof(array) / sizeof(type))
#endif


#pragma mark Color
#if !VDRGBColor
#define VDRGBColor(r, g, b) \
[UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:1.0f]
#endif

#if !VDRGBAColor
#define VDRGBAColor(r, g, b, a) \
[UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:(a)  / 255.0f]
#endif

#if !VDColorFromRGBHex
#define VDColorFromRGBHex(rgbValue) \
[UIColor colorWithRed:( (float)( (rgbValue & 0xFF0000) >> 16) ) / 255.0f green:( (float)( (rgbValue & 0xFF00) >> 8) ) / 255.0f blue:( (float)(rgbValue & 0xFF) ) / 255.0f alpha:1.0f]
#endif


#pragma mark Image
#if !VDImageFromFile
#define VDImageFromFile(filePath, type) \
[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:filePath ofType:type]]
#endif


#pragma mark Device
#if !VDDeviceOverIOSVersion
#define VDDeviceOverVersion(version) \
([[[UIDevice currentDevice] systemVersion] floatValue] >= version ? YES : NO)
#endif

#if !VDDeviceOverIOS8
#define VDDeviceOverIOS8 \
([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES : NO)
#endif

#if !VDDeviceIsPad
#define VDDeviceIsPad \
(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#endif


#pragma mark Math
#if !VDCGFloatSign
#define VDFloatSign(float) \
(float < 0.0f ? -1.0f : 1.0f)
#endif

#ifndef VDMatrixVerticalArrangeToHorizonArrange
#define VDMatrixVerticalArrangeToHorizonArrange(num, rowCount, columnCount) \
(num * columnCount - (num / rowCount) * (rowCount * columnCount - 1) )
#endif


#pragma mark Instance
#if !VDDefaultNotificationCenter
#define VDDefaultNotificationCenter \
[NSNotificationCenter defaultCenter]
#endif

#if !VDUserDefaults
#define VDUserDefaults \
[NSUserDefaults standardUserDefaults]
#endif

#if !VDUserDefaultKey
#define VDUserDefaultKey(clazz, name) \
[NSString stringWithFormat:@"%@_%@", NSStringFromClass(clazz), name]
#endif

#if !VDApplication
#define VDApplication \
[UIApplication sharedApplication]
#endif

#if !VDScreen
#define VDScreen \
[UIScreen mainScreen]
#endif

#if !VDWindow
#define VDWindow \
[[[UIApplication sharedApplication] delegate] window]
#endif



#endif /* VDMacros_h */
