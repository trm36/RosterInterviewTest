//
//  ViewController.m
//  basketballRoster
//
//  Created by Taylor Mott on 3 Apr 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "ViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "TeamListTableViewDataSource.h"
#import "TeamController.h"
#import "TeamDetailViewController.h"

@interface ViewController () <UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) TeamListTableViewDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Navigation bar
    self.title = @"Teams";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *addTeamButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTeamButtonPressed)];
    self.navigationItem.rightBarButtonItem = addTeamButton;
    
    //View
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];;
    self.dataSource = [TeamListTableViewDataSource new];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    [self.dataSource registerTableView:self.tableView];
    [self.view addSubview:self.tableView];
    
    [self.tableView alignTop:@"0" leading:@"0" bottom:@"0" trailing:@"0" toView:self.view];
}

- (void)addTeamButtonPressed
{
    
    UIAlertController *addTeamAlert = [UIAlertController alertControllerWithTitle:@"Add new team?" message:@"Please enter a name for your new team." preferredStyle:UIAlertControllerStyleAlert];
    
    [addTeamAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Team Name";
    }];
    
    [addTeamAlert addAction:[UIAlertAction actionWithTitle:@"Add Team" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *textField = [[addTeamAlert textFields] firstObject];
        [[TeamController sharedInstance] addTeamWithName:textField.text];
        [self.tableView reloadData];
    }]];
    
    [addTeamAlert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:addTeamAlert animated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TeamDetailViewController *dvc = [TeamDetailViewController new];
    [dvc updateWithTeam:[TeamController sharedInstance].teams[indexPath.row]];
    [self.navigationController showViewController:dvc sender:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
