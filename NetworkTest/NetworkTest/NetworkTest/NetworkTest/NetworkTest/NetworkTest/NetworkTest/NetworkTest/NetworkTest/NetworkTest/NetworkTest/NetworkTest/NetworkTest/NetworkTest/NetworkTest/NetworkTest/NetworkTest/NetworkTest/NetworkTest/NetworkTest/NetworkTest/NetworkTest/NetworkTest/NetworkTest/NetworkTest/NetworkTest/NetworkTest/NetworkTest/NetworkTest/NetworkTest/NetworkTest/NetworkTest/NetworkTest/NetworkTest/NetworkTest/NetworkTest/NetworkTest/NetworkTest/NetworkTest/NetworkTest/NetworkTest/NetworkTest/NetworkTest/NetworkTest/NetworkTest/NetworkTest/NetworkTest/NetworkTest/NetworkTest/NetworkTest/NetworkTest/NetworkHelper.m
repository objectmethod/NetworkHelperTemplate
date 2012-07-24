#import "NetworkHelper.h"

@interface NetworkHelper ()

@property (strong, nonatomic) NSOperationQueue *queue;

@end

@implementation NetworkHelper

@synthesize responseBlock = _responseBlock;
@synthesize queue = _queue;

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

- (void) getDataFromUrl:(NSURL*)url completion:(ResponseBlock)completion {
    self.responseBlock = completion;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [NSURLConnection sendAsynchronousRequest:request queue:self.queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        id results = nil;
        
        if (data) {            
            results = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(results, error);
        });
    }];
}

@end