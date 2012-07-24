#import "TestViewController.h"
#import "EdfRecipesViewController.h"
#import "TaxonomyTermViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

#pragma mark Button clicks

- (IBAction)getEdfRecipesButtonClicked:(id)sender {
    EdfRecipesViewController *edfRecipesViewController = [[EdfRecipesViewController alloc] init];
    [self.navigationController pushViewController:edfRecipesViewController animated:YES];
}

- (IBAction)postDataToTaxonomyTermButtonClicked:(id)sender {
    TaxonomyTermViewController *taxonomyTermViewController = [[TaxonomyTermViewController alloc] init];
    [self.navigationController pushViewController:taxonomyTermViewController animated:YES];
}

@end
