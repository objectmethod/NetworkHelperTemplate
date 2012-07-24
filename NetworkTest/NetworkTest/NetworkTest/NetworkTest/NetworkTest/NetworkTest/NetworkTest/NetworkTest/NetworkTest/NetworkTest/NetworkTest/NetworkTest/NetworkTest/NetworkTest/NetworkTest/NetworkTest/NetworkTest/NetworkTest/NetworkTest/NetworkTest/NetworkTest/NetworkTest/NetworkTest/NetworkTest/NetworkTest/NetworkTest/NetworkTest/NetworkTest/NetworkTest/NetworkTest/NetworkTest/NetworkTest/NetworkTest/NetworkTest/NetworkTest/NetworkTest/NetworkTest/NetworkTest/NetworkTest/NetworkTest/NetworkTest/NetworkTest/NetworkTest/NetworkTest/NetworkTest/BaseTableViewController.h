#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end
