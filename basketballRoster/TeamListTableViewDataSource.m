//
//  TeamListTableViewDataSource.m
//  basketballRoster
//
//  Created by Taylor Mott on 3 Apr 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "TeamListTableViewDataSource.h"
#import "TeamController.h"
#import "Team.h"

static NSString *cellID = @"cellID";

@implementation TeamListTableViewDataSource

-(void)registerTableView:(UITableView *)tableView
{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [TeamController sharedInstance].teams.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    Team *team = [TeamController sharedInstance].teams[indexPath.row];
    
    cell.textLabel.text = team.name;
    
    return cell;
}

@end
