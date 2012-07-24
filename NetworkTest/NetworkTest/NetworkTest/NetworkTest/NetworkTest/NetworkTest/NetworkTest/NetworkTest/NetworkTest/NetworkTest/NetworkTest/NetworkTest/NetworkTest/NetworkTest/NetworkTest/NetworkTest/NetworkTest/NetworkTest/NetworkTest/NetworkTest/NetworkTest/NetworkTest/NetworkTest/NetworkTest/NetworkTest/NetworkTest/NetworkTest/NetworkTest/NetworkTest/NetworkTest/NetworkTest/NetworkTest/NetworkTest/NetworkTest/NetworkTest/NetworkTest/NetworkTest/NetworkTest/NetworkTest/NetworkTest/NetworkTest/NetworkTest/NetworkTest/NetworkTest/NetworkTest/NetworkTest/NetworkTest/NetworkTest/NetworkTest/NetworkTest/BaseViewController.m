#import "BaseViewController.h"
#import "MBProgressHUD.h"
#import "NetworkHelper.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark Getting data from URL

- (void) getDataFromUrl:(NSURL*)url {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [[NetworkHelper sharedNetworkHelper] getDataFromUrl:url completion:^(id response, NSError *error){
        [self finishedGettingDataFromUrl];
        
        if (error) {
            [self receivedError:error fromUrl:url];
        } else {
            [self receivedResponse:response fromUrl:url];
        }        
    }];
}

- (void) finishedGettingDataFromUrl {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void) receivedResponse:(id)response fromUrl:(NSURL *)url {
    
}

- (void) receivedError:(NSError *)error fromUrl:(NSURL *)url {
    
}

@end