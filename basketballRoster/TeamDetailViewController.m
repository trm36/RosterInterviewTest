//
//  TeamDetailViewController.m
//  basketballRoster
//
//  Created by Taylor Mott on 3 Apr 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "TeamDetailViewController.h"
#import "RosterTableViewDataSource.h"
#import "UIView+FLKAutoLayout.h"
#import "Person.h"
#import "Stack.h"
#import "PersonDetailViewController.h"

@interface TeamDetailViewController () <UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) RosterTableViewDataSource *dataSource;
@property (strong, nonatomic) Team *team;

@end

@implementation TeamDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.team.name;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *addPersonButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPersonButtonPressed)];
    self.navigationItem.rightBarButtonItem = addPersonButton;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.dataSource = [RosterTableViewDataSource new];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    [self.dataSource registerTableView:self.tableView andTeam:self.team];
    [self.view addSubview:self.tableView];
    
    [self.tableView alignTop:@"0" leading:@"0" bottom:@"0" trailing:@"0" toView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateWithTeam:(Team *)team
{
    self.team = team;
}

-(void)addPersonButtonPressed
{
    
    UIAlertController *addPersonAlert = [UIAlertController alertControllerWithTitle:@"Add new person?" message:@"Please enter the information below." preferredStyle:UIAlertControllerStyleAlert];
    
    [addPersonAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Name";
    }];
    [addPersonAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Phone Number";
    }];
    [addPersonAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"E-Mail Address";
    }];
    
    [addPersonAlert addAction:[UIAlertAction actionWithTitle:@"Add as Coach" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        NSArray *textFields = [addPersonAlert textFields];
        
        Person *coach = [NSEntityDescription insertNewObjectForEntityForName:personClass inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
        coach.name = ((UITextField *)textFields[0]).text;
        coach.phone = ((UITextField *)textFields[1]).text;
        coach.email = ((UITextField *)textFields[2]).text;
        coach.team = self.team;
        coach.role = @1;
        
        [[Stack sharedInstance].managedObjectContext save:nil];
        [self.tableView reloadData];
    }]];
    [addPersonAlert addAction:[UIAlertAction actionWithTitle:@"Add as Player" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSArray *textFields = [addPersonAlert textFields];
        
        Person *player = [NSEntityDescription insertNewObjectForEntityForName:personClass inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
        player.name = ((UITextField *)textFields[0]).text;
        player.phone = ((UITextField *)textFields[1]).text;
        player.email = ((UITextField *)textFields[2]).text;
        player.team = self.team;
        player.role = @2;
        
        [[Stack sharedInstance].managedObjectContext save:nil];
        [self.tableView reloadData];
    }]];
    
    [addPersonAlert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:addPersonAlert animated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PersonDetailViewController *dvc = [PersonDetailViewController new];
    [dvc updateWithPerson:self.team.persons[indexPath.row]];
    [self.navigationController showViewController:dvc sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
