//
//  MasterViewController.h
//  TroyStory5
//
//  Created by roshan on 04/06/2015.
//  Copyright (c) 2015 ikompass. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

