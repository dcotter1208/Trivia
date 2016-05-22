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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
