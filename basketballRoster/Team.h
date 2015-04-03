//
//  Team.h
//  basketballRoster
//
//  Created by Taylor Mott on 3 Apr 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

static NSString *teamClass = @"Team";

@class Person;

@interface Team : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSOrderedSet *persons;
@end

@interface Team (CoreDataGeneratedAccessors)

- (void)insertObject:(Person *)value inPersonsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromPersonsAtIndex:(NSUInteger)idx;
- (void)insertPersons:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removePersonsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInPersonsAtIndex:(NSUInteger)idx withObject:(Person *)value;
- (void)replacePersonsAtIndexes:(NSIndexSet *)indexes withPersons:(NSArray *)values;
- (void)addPersonsObject:(Person *)value;
- (void)removePersonsObject:(Person *)value;
- (void)addPersons:(NSOrderedSet *)values;
- (void)removePersons:(NSOrderedSet *)values;
@end
