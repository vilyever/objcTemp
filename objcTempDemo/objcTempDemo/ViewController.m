//
//  ViewController.m
//  objcTempDemo
//
//  Created by FTET on 16/6/29.
//  Copyright © 2016年 vilyever. All rights reserved.
//

#import "ViewController.h"

@import objcTemp;

@interface ViewController ()

@property (nonatomic, copy, setter=sTest:) NSString *test;
@property (nonatomic, assign) NSInteger __x;
@property (nonatomic, strong) NSArray *_array;

//@property (nonatomic, strong) VDAuto

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSArray *properties = [[self class] vd_properties];
//    for (VDProperty *property in properties) {
//        NSLog(@"%@   :   %@  ,  %@", property, property.setterSelectorName, property.getterSelectorName);
//    }
    
    [self vd_initPersistent];
    
    NSLog(@"test %@", self.test);
    NSLog(@"x %@", @(self.__x));
    NSLog(@"array %@", self._array);
    
    self.test = @"hh";
    self.__x = 11;
    self._array = @[@"1", @"2", @"5"];
    
    NSLog(@"test %@", self.test);
    NSLog(@"x %@", @(self.__x));
    NSLog(@"array %@", self._array);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
