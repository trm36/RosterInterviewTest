//
//  RosterTableViewDataSource.h
//  basketballRoster
//
//  Created by Taylor Mott on 3 Apr 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Team.h"
@import UIKit;

@interface RosterTableViewDataSource : NSObject <UITableViewDataSource>

-(void)registerTableView:(UITableView *)tableView andTeam:(Team *)team;

@end
