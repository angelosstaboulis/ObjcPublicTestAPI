//
//  ViewController.h
//  ObjcPublicTestApi
//
//  Created by Angelos Staboulis on 17/10/22.
//

#import <UIKit/UIKit.h>
#import "GenderModel.h"

@interface ViewController : UIViewController
@property struct GenderModel *gender;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtGender;
@property (strong, nonatomic) IBOutlet UITextField *txtProbability;

@end

