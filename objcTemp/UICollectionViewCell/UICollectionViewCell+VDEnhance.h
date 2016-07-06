//
//  UICollectionViewCell+VDEnhance.h
//  objcTempUtilities
//
//  Created by Deng on 16/6/15.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UICollectionViewCell (VDEnhance)

#pragma mark Public Method
+ (void)vd_registerNibWithCollectionView:(UICollectionView *)collectionView;

+ (void)vd_registerClassWithCollectionView:(UICollectionView *)collectionView;

+ (instancetype)vd_dequeueCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

@end
