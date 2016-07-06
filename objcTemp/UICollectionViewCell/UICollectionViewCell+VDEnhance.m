//
//  UICollectionViewCell+VDEnhance.m
//  objcTempUtilities
//
//  Created by Deng on 16/6/15.
//  Copyright © Deng. All rights reserved.
//

#import "UICollectionViewCell+VDEnhance.h"

//#import <objc/runtime.h>


@implementation UICollectionViewCell (VDEnhance)

#pragma mark Public Method
+ (void)vd_registerNibWithCollectionView:(UICollectionView *)collectionView
{
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass( [self class] ) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass( [self class] ) ];
}

+ (void)vd_registerClassWithCollectionView:(UICollectionView *)collectionView
{
    [collectionView registerClass:self forCellWithReuseIdentifier:NSStringFromClass( [self class] ) ];
}

+ (instancetype)vd_dequeueCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass( [self class] ) forIndexPath:indexPath];
}

#pragma mark Private Method


@end
