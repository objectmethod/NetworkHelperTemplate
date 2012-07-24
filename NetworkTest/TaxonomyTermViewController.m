#import "TaxonomyTermViewController.h"

@interface TaxonomyTermViewController ()

@end

@implementation TaxonomyTermViewController

#pragma mark view lifecylce

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getTaxonomyTerm];
}

#pragma mark get taxonomy term

- (void) getTaxonomyTerm {
    NSString *urlString = HTTP_URL_POST_TAXONOMY_TERM;
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSString *postBody = @"tids=1234";
    
    [self postData:postBody toUrl:url];
}

- (void) receivedResponse:(id)response fromUrl:(NSURL *)url {
    NSLog(@"response: %@", response);
}

- (void) receivedError:(NSError *)error fromUrl:(NSURL *)url {
    NSLog(@"error: %@", error);
}

@end
