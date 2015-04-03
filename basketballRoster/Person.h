//
//  Person.h
//  basketballRoster
//
//  Created by Taylor Mott on 3 Apr 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

static NSString *personClass = @"Person";

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSNumber * role;
@property (nonatomic, retain) NSManagedObject *team;

@end
