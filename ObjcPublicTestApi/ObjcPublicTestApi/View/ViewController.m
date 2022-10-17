//
//  ViewController.m
//  ObjcPublicTestApi
//
//  Created by Angelos Staboulis on 17/10/22.
//

#import "ViewController.h"
#import "GenderModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [_txtName setText:@"Angelos"];
    [self fetchGenderAPI:[_txtName text] completion:^(NSDictionary *dict) {
        dispatch_async(dispatch_get_main_queue(), ^{
                [self->_txtGender setText:[dict valueForKey:@"gender"]];
                NSString *probability = [NSString stringWithFormat:@"%@",[dict valueForKey:@"probability"]];
                [self->_txtProbability setText:probability];
        });
    }];
}
- (void) fetchGenderAPI:(NSString *) name completion:(void (^) (NSDictionary *dict))completion
{
    dispatch_queue_t  queue = dispatch_queue_create("queue", DISPATCH_QUEUE_PRIORITY_DEFAULT);
    
    dispatch_async(queue, ^{
        NSURL *urlMain = [[NSURL alloc] initWithString:@"https://api.genderize.io?name=luc"];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL: urlMain];
        NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            completion(dict);
        }];
        [dataTask resume];
    });
}
@end
