//
//  TeamController.m
//  basketballRoster
//
//  Created by Taylor Mott on 3 Apr 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "TeamController.h"
#import "Stack.h"

@implementation TeamController

+ (TeamController *)sharedInstance
{
    static TeamController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [TeamController new];
    });
    
    return sharedInstance;
}

- (void)addTeamWithName:(NSString *)name
{
    Team *team = [NSEntityDescription insertNewObjectForEntityForName:teamClass inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    team.name = name;
    
    [[Stack sharedInstance].managedObjectContext save:nil];
}

- (void)removeTeam:(Team *)teamToDelete
{
    [teamToDelete.managedObjectContext deleteObject:teamToDelete];
    
    [[Stack sharedInstance].managedObjectContext save:nil];
}

- (NSArray *)teams
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:teamClass];
    return [[Stack sharedInstance].managedObjectContext executeFetchRequest:request error:nil];
}

@end
