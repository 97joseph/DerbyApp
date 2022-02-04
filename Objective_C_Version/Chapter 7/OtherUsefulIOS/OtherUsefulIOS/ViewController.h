//
//  ViewController.h
//  OtherUsefulIOS
//
//  Created by Jeff Mcwherter on 1/7/12.
//  Copyright (c) 2012 Gravity Works Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController
<CLLocationManagerDelegate>{
    CLLocationManager *locationManager;
}

@end
