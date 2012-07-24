#import "EdfRecipesViewController.h"
#import "GetEdfRecipesResponse.h"

@interface EdfRecipesViewController ()

@end

@implementation EdfRecipesViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self getEdfRecipes];
}

#pragma mark Getting recipe data

- (void) getEdfRecipes {
    NSString *urlString = @"http://www.marthastewart.com/services/json/views/edf_recipes.json";
    NSURL *url = [NSURL URLWithString:urlString];
    [self getDataFromUrl:url];
}

- (void) receivedResponse:(id)response fromUrl:(NSURL *)url {
    GetEdfRecipesResponse *getEdfRecipesResponse = [GetEdfRecipesResponse instanceFromDictionary:response];
    NSLog(@"response: %@", getEdfRecipesResponse);
}

- (void)receivedError:(NSError *)error fromUrl:(NSURL *)url {
    NSLog(@"Error: %@", error);
}

@end