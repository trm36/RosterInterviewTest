//
//  RosterTableViewDataSource.m
//  basketballRoster
//
//  Created by Taylor Mott on 3 Apr 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "RosterTableViewDataSource.h"
#import "Person.h"

static NSString *cellID = @"cellID";

@interface RosterTableViewDataSource()

@property (strong, nonatomic) Team *team;

@end

@implementation RosterTableViewDataSource

-(void)registerTableView:(UITableView *)tableView andTeam:(Team *)team
{
    self.team = team;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.team.persons.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    Person *person = [self.team.persons objectAtIndexedSubscript:indexPath.row];
    
    cell.textLabel.text = person.name;
    if ([person.role isEqual:@1])
    {
        cell.detailTextLabel.text = @"Coach";
    }
    else
    {
        cell.detailTextLabel.text = @"Player";
    }
    
    
    return cell;
}

@end
