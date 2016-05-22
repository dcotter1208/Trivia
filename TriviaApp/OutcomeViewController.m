//
//  OutcomeViewController.m
//  TriviaApp
//
//  Created by DetroitLabs on 5/22/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "OutcomeViewController.h"

@interface OutcomeViewController ()

@end

@implementation OutcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    if (_totalPoints == 150) {
        winLossLabel.text = @"You Win!";
        totalPointsLabe.text = [NSString stringWithFormat:@"Total Points: %i", _totalPoints];
        outcomeImage.image = [UIImage imageNamed:@"winner"];
    } else {
        winLossLabel.text = @"You Lose!";
        totalPointsLabe.text = [NSString stringWithFormat:@"Total Points: %i", _totalPoints];
        outcomeImage.image = [UIImage imageNamed:@"loser"];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)dismissView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

}


@end
