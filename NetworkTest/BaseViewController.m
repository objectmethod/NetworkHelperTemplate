#import "BaseViewController.h"
#import "MBProgressHUD.h"
#import "NetworkHelper.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark post data to url

- (void) postData:(NSString *)postBody toUrl:(NSURL *)url {
    [self beginNetworkRequest];
    
    [[NetworkHelper sharedNetworkHelper] postData:postBody toUrl:url  completion:^(id response, NSError *error){
        [self endNetworkRequest];
        [self checkResponse:response andError:error fromUrl:url];
    }];
}

#pragma mark getting data from URL

- (void) getDataFromUrl:(NSURL*)url {
    [self beginNetworkRequest];
    
    [[NetworkHelper sharedNetworkHelper] getDataFromUrl:url completion:^(id response, NSError *error){
        [self endNetworkRequest];
        [self checkResponse:(id)response andError:(NSError*)error fromUrl:url];
    }];
}

#pragma mark response

- (void) checkResponse:(id)response andError:(NSError*)error fromUrl:(NSURL*)url {
    if (error) {
        [self receivedError:error fromUrl:url];
    } else {
        [self receivedResponse:response fromUrl:url];
    }
}

- (void) receivedResponse:(id)response fromUrl:(NSURL *)url {
    
}

- (void) receivedError:(NSError *)error fromUrl:(NSURL *)url {
    
}

#pragma mark begin and finish network request

- (void) beginNetworkRequest {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void) endNetworkRequest {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end