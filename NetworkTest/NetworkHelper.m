#import "NetworkHelper.h"

@interface NetworkHelper ()

@property (strong, nonatomic) NSOperationQueue *queue;

@end

@implementation NetworkHelper

#define HTTP_METHOD_POST @"POST"
#define HTTP_METHOD_GET @"GET"

@synthesize queue = _queue;

#pragma mark singleton

+ (id) sharedNetworkHelper {
    static dispatch_once_t onceQueue;
    static NetworkHelper *networkHelper = nil;
    
    dispatch_once(&onceQueue, ^{ networkHelper = [[self alloc] init]; });
    return networkHelper;
}

- (id)init {
    self = [super init];
    
    if (self) {
        self.queue = [[NSOperationQueue alloc] init];
    }
    
    return self;
}

#pragma mark get data from url

- (void) getDataFromUrl:(NSURL*)url completion:(ResponseBlock)completion {
    [self makeNetworkRequestToUrl:url withMethod:HTTP_METHOD_GET andBody:nil completion:completion];
}

#pragma mark post data to url

- (void)postData:(NSString*)postBody toUrl:(NSURL *)url completion:(ResponseBlock)completion {
    NSData *postData = [postBody dataUsingEncoding:NSUTF8StringEncoding];
    [self makeNetworkRequestToUrl:url withMethod:HTTP_METHOD_POST andBody:postData completion:completion];
}

#pragma mark make network request

- (void) makeNetworkRequestToUrl:(NSURL*)url withMethod:(NSString*)httpMethod andBody:(NSData*)bodyData completion:(ResponseBlock)completion {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = httpMethod;
    
    if (httpMethod == HTTP_METHOD_POST) {
        request.HTTPBody = bodyData;
    }
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [NSURLConnection sendAsynchronousRequest:request queue:self.queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
        int responseStatusCode = [httpResponse statusCode];
        
        id results = nil;
        
        if (data) {
            results = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(results, error, responseStatusCode, url);
        });
    }];
}

@end