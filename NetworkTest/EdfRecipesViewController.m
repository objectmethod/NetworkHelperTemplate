#import "EdfRecipesViewController.h"
#import "GetEdfRecipesResponse.h"
#import "EdfRecipe.h"

@interface EdfRecipesViewController ()

@end

@implementation EdfRecipesViewController

@synthesize recipes = _recipes;

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self getEdfRecipes];
}

#pragma tableview data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recipes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecipeCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"RecipeCell"];
    }
    
    EdfRecipe *recipe = [self.recipes objectAtIndex:indexPath.row];
    
    cell.textLabel.text = recipe.nid;
    cell.detailTextLabel.text = recipe.nodeChanged;
    
    return cell;
}

#pragma mark getting recipe data

- (void) getEdfRecipes {
    NSString *urlString = HTTP_URL_GET_EDF_RECIPES;
    NSURL *url = [NSURL URLWithString:urlString];
    [self getDataFromUrl:url];
}

- (void) receivedResponse:(id)response fromUrl:(NSURL *)url {
    GetEdfRecipesResponse *getEdfRecipesResponse = [GetEdfRecipesResponse instanceFromDictionary:response];
    self.recipes = getEdfRecipesResponse.data;
}

- (void)receivedError:(NSError *)error fromUrl:(NSURL *)url {
    NSLog(@"Error: %@", error);
}

#pragma mark updating recipes property

- (void)setRecipes:(NSArray *)recipes {
    _recipes = recipes;
    [self.tableView reloadData];
}

@end