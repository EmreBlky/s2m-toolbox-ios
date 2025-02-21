//
//  S2MQRViewController.h
//  S2MQRCodeReader
//
//  Created by Joern Ehmann on 03/11/14.
//  Copyright (c) 2014 SinnerSchrader Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
@class S2MQRViewController;
@protocol S2MQRViewControllerDelegate <NSObject>

@optional

-(void)qrViewController:(S2MQRViewController*)qrViewController didRecognizeCode:(NSString*)code;
-(void)qrViewController:(S2MQRViewController*)qrViewController didFailWithError:(NSError*)error;

@end


@interface S2MQRViewController : UIViewController

/**
 *  designated Initializer
 *
 *  @param delegate S2MQRViewControllerDelegate //may be nil if you want automatic handling
 *
 *  @return instance of S2MQRViewController
 */
-(instancetype)initWithDelegate:(id<S2MQRViewControllerDelegate>)delegate;

/**
 *  designated delegate. Is called when QR is detected
 */
@property (nonatomic, weak) id<S2MQRViewControllerDelegate> delegate;

/**
 *  Overlays video capute view with this image. Default is nil. The image is centered in the container and takes the image size as intrinsic size
 */
@property (nonatomic, strong) UIImage *boundingImage;

/**
 *  Default is NO. If YES detected URLs are automatically opened in Safari. If NO, only delegate will be called and you can handle the recognized String on your own.
 */
@property (nonatomic, assign) BOOL openURLsAutomatically;

/**
 *  Default is NO. If YES will try to use front camera for QR scanning, else default device is taken.
 */
@property (nonatomic, assign) BOOL useFrontCamera;

/**
 *  Default is YES. iOS8 and up only.
 */
@property (nonatomic, assign) BOOL willLeadToSettingsIfNotAuthorized;

/**
 *  Text displayed for denied authorization Alert
 */
@property (nonatomic, copy) NSString *authorizationDeniedText;
/**
 *  Text displayed for no valid URL found text
 */
@property (nonatomic, copy) NSString *noValidURLText;
/**
 *  Text displayed in Ok Button
 */
@property (nonatomic, copy) NSString *okButtonText;

@end

