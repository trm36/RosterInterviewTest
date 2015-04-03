//
//  PersonDetailViewController.m
//  basketballRoster
//
//  Created by Taylor Mott on 3 Apr 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "PersonDetailViewController.h"
#import "UIView+FLKAutoLayout.h"

@interface PersonDetailViewController ()

@property (strong, nonatomic) Person *person;

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *phoneLabel;
@property (strong, nonatomic) UILabel *emailLabel;
@property (strong, nonatomic) UILabel *roleLabel;

@end

@implementation PersonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.nameLabel = [UILabel new];
    self.nameLabel.text = self.person.name;
    [self.view addSubview:self.nameLabel];
    
    self.phoneLabel = [UILabel new];
    self.phoneLabel.text = self.person.phone;
    [self.view addSubview:self.phoneLabel];
    
    self.emailLabel = [UILabel new];
    self.emailLabel.text = self.person.email;
    [self.view addSubview:self.emailLabel];
    
    self.roleLabel = [UILabel new];
    if ([self.person.role isEqualToNumber:@1])
    {
        self.roleLabel.text = @"Coach";
    }
    else
    {
        self.roleLabel.text = @"Player";
    }
    [self.view addSubview:self.roleLabel];
    
    [self.nameLabel alignTopEdgeWithView:self.view predicate:@"75"];
    [self.nameLabel alignCenterXWithView:self.view predicate:nil];
    
    [self.phoneLabel constrainTopSpaceToView:self.nameLabel predicate:@"10"];
    [self.phoneLabel alignCenterXWithView:self.view predicate:nil];
    
    [self.emailLabel constrainTopSpaceToView:self.phoneLabel predicate:@"10"];
    [self.emailLabel alignCenterXWithView:self.view predicate:nil];
    
    [self.roleLabel constrainTopSpaceToView:self.emailLabel predicate:@"10"];
    [self.roleLabel alignCenterXWithView:self.view predicate:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateWithPerson:(Person *)person
{
    self.person = person;
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
