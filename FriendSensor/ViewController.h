//
//  ViewController.h
//  FriendSensor
//
//  Created by Owner on H26/07/16.
//  Copyright (c) 平成26年 Owner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewController : UIViewController
<UITextFieldDelegate>
{
    IBOutlet UITextField *field;
    IBOutlet UITextField *field1;
    IBOutlet UITextField *field2;
}

- (IBAction)signup:(id)sender;

@end
