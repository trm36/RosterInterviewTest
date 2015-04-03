//
//  TeamController.h
//  basketballRoster
//
//  Created by Taylor Mott on 3 Apr 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Team.h"

@interface TeamController : NSObject

+ (TeamController *)sharedInstance;
- (void)addTeamWithName:(NSString *)name;
- (void)removeTeam:(Team *)teamToDelete;
- (NSArray *)teams;

@end
