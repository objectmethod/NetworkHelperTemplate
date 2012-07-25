#import "BaseViewController.h"
#import "MBProgressHUD.h"
#import "NetworkHelper.h"

@interface BaseViewController ()

@property (strong, nonatomic) ResponseBlock handleResponseBlock;

@end

@implementation BaseViewController

@synthesize handleResponseBlock = _handleResponseBlock;

#pragma mark post data to url

- (void) postData:(NSString *)postBody toUrl:(NSURL *)url {
    [self beginNetworkRequest];    
    [[NetworkHelper sharedNetworkHelper] postData:postBody toUrl:url  completion:self.handleResponseBlock];
}

#pragma mark getting data from URL

- (void) getDataFromUrl:(NSURL*)url {
    [self beginNetworkRequest];    
    [[NetworkHelper sharedNetworkHelper] getDataFromUrl:url completion:self.handleResponseBlock];
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

#pragma mark initialization

- (id)init {
    self = [super init];
    
    if (self) {
        __block typeof(self) bself = self;
        
        self.handleResponseBlock = (^(id response, NSError *error, int httpResponseStatusCode, NSURL *url){
            [bself endNetworkRequest];
            [bself checkResponse:(id)response andError:(NSError*)error fromUrl:url];
        });
    }
    
    return self;
}

@end