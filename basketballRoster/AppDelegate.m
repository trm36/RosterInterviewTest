//
//  AppDelegate.m
//  basketballRoster
//
//  Created by Taylor Mott on 3 Apr 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TeamController.h"
#import "Team.h"
#import "Person.h"
#import "Stack.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"hasLaunched"])
    {
        [[TeamController sharedInstance] addTeamWithName:@"DevMountain Ballers"];
        
        Team *devmntBallers = [[TeamController sharedInstance].teams firstObject];
        
        Person *coach = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
        coach.name = @"Asa Roberts";
        coach.phone = @"801-555-6914";
        coach.email = @"aroberts@sample.com";
        coach.role = @1;
        coach.team = devmntBallers;
        
        Person *p1 = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
        p1.name = @"Chase Baker";
        p1.phone = @"801-555-1234";
        p1.email = @"cbaker@sample.com";
        p1.role = @0;
        p1.team = devmntBallers;
        
        Person *p2 = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
        p2.name = @"Brayden Robinson";
        p2.phone = @"801-555-2345";
        p2.email = @"brobinson@sample.com";
        p2.role = @0;
        p2.team = devmntBallers;
        
        Person *p3 = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
        p3.name = @"Chad Gavins";
        p3.phone = @"801-555-3456";
        p3.email = @"cgavins@sample.com";
        p3.role = @0;
        p3.team = devmntBallers;
        
        Person *p4 = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
        p4.name = @"Trent Richards";
        p4.phone = @"801-555-4567";
        p4.email = @"trichards@sample.com";
        p4.role = @0;
        p4.team = devmntBallers;
        
        Person *p5 = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
        p5.name = @"John Hunter";
        p5.phone = @"801-555-5678";
        p5.email = @"jhunter@sample.com";
        p5.role = @0;
        p5.team = devmntBallers;
        
        Person *p6 = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
        p6.name = @"Parley Coombs";
        p6.phone = @"801-555-6789";
        p6.email = @"pcoombs@sample.com";
        p6.role = @0;
        p6.team = devmntBallers;
        
        Person *p7 = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
        p7.name = @"Quinn Brandon";
        p7.phone = @"801-555-7890";
        p7.email = @"qbrandon@sample.com";
        p7.role = @0;
        p7.team = devmntBallers;
        
        Person *p8 = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
        p8.name = @"Jarron Mansfield";
        p8.phone = @"801-555-8901";
        p8.email = @"jmansfield@sample.com";
        p8.role = @0;
        p8.team = devmntBallers;
        
        [[Stack sharedInstance].managedObjectContext save:nil];
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasLaunched"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
