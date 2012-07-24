@interface NetworkHelper : NSObject

typedef void (^ResponseBlock)(id response, NSError *error);

@property (strong, nonatomic) ResponseBlock responseBlock;

+ (id) sharedNetworkHelper;

- (void) getDataFromUrl:(NSURL*)url completion:(ResponseBlock)completion;

@end
