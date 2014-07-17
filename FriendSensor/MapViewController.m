//
//  MapViewController.m
//  FriendSensor
//
//  Created by Owner on H26/07/17.
//  Copyright (c) 平成26年 Owner. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    longitube = 0;
    latitube = 0;
    BOOL locationSerVicesEnabled;
    locationManager = [[CLLocationManager alloc] init];
    if ([CLLocationManager respondsToSelector:@selector(locationServicesEnabled)]) {
        locationSerVicesEnabled = [CLLocationManager locationServicesEnabled];
    }
    
    if (locationSerVicesEnabled) {
        locationManager.delegate = self;
        [locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = [locations lastObject];
    PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLatitude:newLocation.coordinate.latitude longitude:newLocation.coordinate.longitude];
    PFQuery *location = [PFQuery queryWithClassName:@"Location"];
    location = 1;
    PFObject *locationObject =
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
