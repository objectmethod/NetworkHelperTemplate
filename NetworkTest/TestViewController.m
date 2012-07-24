#import "TestViewController.h"
#import "EdfRecipesViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

#pragma mark Button clicks

- (IBAction)getEdfRecipesButtonClicked:(id)sender {
    EdfRecipesViewController *edfRecipesViewController = [[EdfRecipesViewController alloc] init];
    [self.navigationController pushViewController:edfRecipesViewController animated:YES];
}

- (IBAction)postDataToTaxonomyTermButtonClicked:(id)sender {
    [self getTaxonomyTerm];
}

#pragma mark get taxonomy term

- (void) getTaxonomyTerm {
    NSString *urlString = HTTP_URL_POST_TAXONOMY_TERM;
    NSURL *url = [NSURL URLWithString:urlString];

    NSString *postBody = @"tids=1234";
    
    [self postData:postBody toUrl:url];
}

@end
