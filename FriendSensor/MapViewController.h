//
//  MapViewController.h
//  FriendSensor
//
//  Created by Owner on H26/07/17.
//  Copyright (c) 平成26年 Owner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController
<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocationDegrees latitube;
    CLLocationDegrees longitube;
    IBOutlet MKMapView *map;
}
@end
