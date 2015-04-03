//
//  TeamListTableViewDataSource.h
//  basketballRoster
//
//  Created by Taylor Mott on 3 Apr 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface TeamListTableViewDataSource : NSObject <UITableViewDataSource>

-(void)registerTableView:(UITableView *)tableView;

@end
