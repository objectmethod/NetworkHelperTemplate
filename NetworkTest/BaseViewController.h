@interface BaseViewController : UIViewController

- (void) getDataFromUrl:(NSURL*)url;
- (void) postData:(NSString*)postBody toUrl:(NSURL *)url;

- (void) receivedResponse:(id)response fromUrl:(NSURL*)url;
- (void) receivedError:(NSError*)error fromUrl:(NSURL*)url;

@end