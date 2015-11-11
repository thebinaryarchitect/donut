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
 *  Called when the bannerViewActionShouldBegin:willLeaveApplication: delegate method is called.
 */
@property (nonatomic, copy, readwrite) void(^actionShouldBeginBlock)(ADBannerView *bannerView, BOOL willLeaveApplication);

/**
 *  Called when the bannerViewActionDidFinish: delegate method is called.
 */
@property (nonatomic, copy, readwrite) void(^actionDidFinishBlock)(ADBannerView *bannerView);

@property (nonatomic, assign, readonly) BOOL shouldShowBannerView;

/**
 *  The designated initializer.
 *
 *  @param contentViewController The content view controller.
 *
 *  @return TBABannerViewController or nil.
 */
- (instancetype)initWithContentViewController:(UIViewController *)contentViewController;

/**
 *  Animates the banner view into view.
 */
- (void)showBannerView;

/**
 *  Animates the banner view out of view.
 */
- (void)hideBannerView;

@end
