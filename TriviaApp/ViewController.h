//
//  ViewController.h
//  TriviaApp
//
//  Created by DetroitLabs on 5/20/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"

@interface ViewController : UIViewController {
    IBOutlet UITextView *questionTextView;
    IBOutlet UIButton *answerButtonOne;
    IBOutlet UIButton *answerButtonTwo;
    IBOutlet UIButton *answerButtonThree;
    IBOutlet UIButton *answerButtonFour;
    IBOutlet UIButton *startGameButton;
    IBOutlet UILabel *totalPointsLabel;
    IBOutlet UILabel *currentQuestionCountLabel;
    IBOutlet UILabel *totalPointsStaticLabel;
}


@property(nonatomic, strong)NSArray *questions;
@property(nonatomic, strong) Question *currentQuestion;
@property(nonatomic) int currentQuestionIndex;
@property(nonatomic) int pointCount;
@property(nonatomic) int questionNumber;
@property(nonatomic) int startTime;
@property(nonatomic) NSTimer *timer;

-(IBAction)answerButtonSelected:(id)sender;
-(IBAction)startOrRestartGame:(id)sender;

@end

