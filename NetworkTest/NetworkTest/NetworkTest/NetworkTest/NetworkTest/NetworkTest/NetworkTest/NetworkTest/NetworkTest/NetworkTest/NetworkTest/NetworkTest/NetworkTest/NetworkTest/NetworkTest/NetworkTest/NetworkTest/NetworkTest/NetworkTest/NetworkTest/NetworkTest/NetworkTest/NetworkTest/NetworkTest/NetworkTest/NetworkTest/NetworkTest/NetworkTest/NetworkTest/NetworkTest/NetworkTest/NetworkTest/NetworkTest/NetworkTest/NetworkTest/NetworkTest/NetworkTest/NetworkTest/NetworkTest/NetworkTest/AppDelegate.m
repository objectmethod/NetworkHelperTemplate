#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize testViewController = _testViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.testViewController = [[TestViewController alloc] init];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.testViewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window addSubview:self.navigationController.view];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end