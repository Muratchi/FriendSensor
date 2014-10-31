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
    
    coordinateObject = [PFObject objectWithClassName:@"GeoPoint"];
    coordinateObject[@"location"] = [PFGeoPoint geoPointWithLatitude:0 longitude:0];
    [coordinateObject saveInBackground];
    [self myMethod];
    query = [PFQuery queryWithClassName:@"GeoPont"];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = [locations lastObject];
    latitube = newLocation.coordinate.latitude;
    longitube = newLocation.coordinate.longitude;
    currentLocation = [PFGeoPoint geoPointWithLatitude:latitube longitude:longitube];
    [query getObjectInBackgroundWithId:coordinateObject.objectId block:^(PFObject *coordinatedObject, NSError *error) {
        coordinatedObject[@"location"] = currentLocation;
        [coordinatedObject saveInBackground];
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
- (void)myMethod {
    PFUser *user = [PFUser user];
    user.username = @"myname";
    user.password = @"mypass";
    user.email = @"email@example.com";
    
    // other fields can be set just like with PFObject
    user[@"phone"] = @"415-392-0202";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
            // Show the errorString somewhere and let the user try again.
        }
    }];
    [PFUser logInWithUsernameInBackground:@"myname" password:@"mypass"
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                        } else {
                                            // The login failed. Check error to see why.
                                        }
                                    }];
    

   
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 
 - (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
 {

*/

@end
