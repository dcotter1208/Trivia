//
//  OutcomeViewController.h
//  TriviaApp
//
//  Created by DetroitLabs on 5/22/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OutcomeViewController : UIViewController {
    IBOutlet UILabel *winLossLabel;
    IBOutlet UILabel *totalPointsLabe;
    IBOutlet UIImageView *outcomeImage;
}

@property (nonatomic) int totalPoints;

-(IBAction)dismissView:(id)sender;


@end
