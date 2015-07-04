//
//  DetailViewController.h
//  TroyStory5
//
//  Created by roshan on 04/06/2015.
//  Copyright (c) 2015 ikompass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

