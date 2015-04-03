//
//  Stack.h
//  basketballRoster
//
//  Created by Taylor Mott on 3 Apr 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface Stack : NSObject

+ (Stack *)sharedInstance;

@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;

@end
