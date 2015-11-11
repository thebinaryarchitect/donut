//
//  TBABannerViewController.h
//  Donut
//
//  Copyright (C) 2015 Xiao Yao. All Rights Reserved.
//  See LICENSE.txt for more information.
//

@import iAd;
@import UIKit;

#pragma mark - TBABannerViewController

/**
 *  View controller that manages an ADBannerView.
 */
@interface TBABannerViewController : UIViewController

/**
 *  The designated initializer.
 *
 *  @param contentViewController The content view controller.
 *
 *  @return TBABannerViewController or nil.
 */
- (instancetype)initWithContentViewController:(UIViewController *)contentViewController;

@end
