@interface NetworkHelper : NSObject

typedef void (^ResponseBlock)(id response, NSError *error, int httpResposneStatusCode, NSURL *url);

+ (id) sharedNetworkHelper;

- (void) getDataFromUrl:(NSURL*)url completion:(ResponseBlock)completion;
- (void) postData:(NSString*)postBody toUrl:(NSURL *)url completion:(ResponseBlock)completion;

@end