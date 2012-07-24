#import "BaseViewController.h"
#import "MBProgressHUD.h"
#import "NetworkHelper.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark getting data from URL

- (void) getDataFromUrl:(NSURL*)url {
    [self beginNetworkRequest];
    
    [[NetworkHelper sharedNetworkHelper] getDataFromUrl:url completion:^(id response, NSError *error){
        [self endNetworkRequest];
        
        if (error) {
            [self receivedError:error fromUrl:url];
        } else {
            [self receivedResponse:response fromUrl:url];
        }        
    }];
}

- (void) receivedResponse:(id)response fromUrl:(NSURL *)url {
    
}

- (void) receivedError:(NSError *)error fromUrl:(NSURL *)url {
    
}

#pragma mark post data to url

- (void) postData:(NSString *)postBody toUrl:(NSURL *)url {
    [self beginNetworkRequest];
    
    [[NetworkHelper sharedNetworkHelper] postData:postBody toUrl:url  completion:^(id response, NSError *error){
        [self endNetworkRequest];
    }];
}

#pragma mark begin and finish network request

- (void) beginNetworkRequest {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void) endNetworkRequest {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end