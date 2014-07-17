//
//  ViewController.m
//  FriendSensor
//
//  Created by Owner on H26/07/16.
//  Copyright (c) 平成26年 Owner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)signup:(id)sender
{
    /*PFUser *user = [PFUser user];
    user.username = field.text;
    user.password = field1.text;
    user.email = field2.text;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"%@",errorString);
            // Show the errorString somewhere and let the user try again.
        }
    }];*/
    [PFUser logInWithUsernameInBackground:field.text password:field1.text block:^(PFUser *user,NSError *error){
        if (user) {
        }else{
            NSLog(@"%@",error);
        }
    }];
    
    /*PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        NSLog(@"%@",currentUser.username);
    }else{
        NSLog(@"Please Login");
    }*/
}
@end
