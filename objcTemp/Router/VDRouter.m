//
//  VDRouter.m
//  Ever
//
//  Created by FTET on 16/6/13.
//  Copyright © 2016年 vilyever. All rights reserved.
//

#import "VDRouter.h"

#import "VDRouterNavigationViewController.h"
#import "VDMacros.h"

@interface VDRouter ()

@property (nonatomic, strong) VDRouterNavigationViewController *rootNavigationController;
@property (nonatomic, strong) NSMutableDictionary *registeredViewControllers;

@end


@implementation VDRouter

#pragma mark Public Method
+ (VDRouter *)sharedRouter {
    return [self vd_sharedInstance];
}

+ (void)setRootViewControllerIdentifier:(NSString *)rootViewControllerIdentifier {
    VDWindow.rootViewController = [[self sharedRouter] rootNavigationController];
    
    Class viewControllerClass = [[[self sharedRouter] registeredViewControllers] objectForKey:rootViewControllerIdentifier];
    NSAssert(viewControllerClass, @"rootViewControllerIdentifier must be binded with a ViewController's class");
    
    UIViewController *rootViewController = [[viewControllerClass alloc] init];
    [[[self sharedRouter] rootNavigationController] changeRootViewController:rootViewController];
}

+ (void)bindViewController:(Class)vcClass identifier:(NSString *)identifier {
    [[[self sharedRouter] registeredViewControllers] setObject:vcClass forKey:identifier];
}

+ (Class)findBindedViewControllerClass:(NSString *)identifier {
    return [[[self sharedRouter] registeredViewControllers] objectForKey:identifier];
}

+ (UIViewController *)push:(NSString *)identifier {
    return [self push:identifier withPrepareBlock:nil];
}

+ (UIViewController *)push:(NSString *)identifier withPrepareBlock:(void (^)(UIViewController *controller))block {
    Class viewControllerClass = [[[self sharedRouter] registeredViewControllers] objectForKey:identifier];
    if (viewControllerClass) {
        UIViewController *targetViewController = [[viewControllerClass alloc] init];
        if (block) {
            block(targetViewController);
        }
        [[[self sharedRouter] rootNavigationController] pushViewController:targetViewController animated:YES];
        
        return targetViewController;
    }
    
    return nil;
}

+ (UIViewController *)present:(NSString *)identifier {
    return [self present:identifier withPrepareBlock:nil];
}

+ (UIViewController *)present:(NSString *)identifier withPrepareBlock:(void (^)(UIViewController *controller))block {
    Class viewControllerClass = [[[self sharedRouter] registeredViewControllers] objectForKey:identifier];
    if (viewControllerClass) {
        UIViewController *targetViewController = [[viewControllerClass alloc] init];
        if (block) {
            block(targetViewController);
        }
        [[UIViewController vd_topViewController] presentViewController:targetViewController animated:YES completion:NULL];
        
        return targetViewController;
    }
    
    return nil;
}


#pragma mark Properties
- (VDRouterNavigationViewController *)rootNavigationController {
    if (!_rootNavigationController) {
        _rootNavigationController = [[VDRouterNavigationViewController alloc] init];
    }
    
    return _rootNavigationController;
}

- (NSMutableDictionary *)registeredViewControllers {
    if (!_registeredViewControllers) {
        _registeredViewControllers = [NSMutableDictionary new];
    }
    
    return _registeredViewControllers;
}

#pragma mark Overrides
- (instancetype)init {
    self = [super init];

    return self;
}

- (void)dealloc {
    
}


#pragma mark Delegates


#pragma mark Private Method

@end
