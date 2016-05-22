//
//  ViewController.m
//  TriviaApp
//
//  Created by DetroitLabs on 5/20/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideViewAttributes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}

-(void)createQuestions {
    //Randomly put the question's answers in an array in the Question class. Then randomly generate them to assign them to the buttons so it's not always D.
    
    Question *questionOne = [Question initWithQuestion:@"The apprenticeship is in ____ Town."];
    
    questionOne.possibleAnswerOne = @"West Corktown";
    questionOne.possibleAnswerTwo = @"Greektown";
    questionOne.possibleAnswerThree = @"Mexicantown";
    questionOne.correctAnswer = @"TechTown";
    questionOne.answerArray = @[questionOne.possibleAnswerOne, questionOne.possibleAnswerTwo, questionOne.possibleAnswerThree, questionOne.correctAnswer];
    
    Question *questionTwo = [Question initWithQuestion:@"Which of these is NOT a Michigan inland lake?"];
    
    questionTwo.possibleAnswerOne = @"Coldwater Lake";
    questionTwo.possibleAnswerTwo = @"Torch Lake";
    questionTwo.possibleAnswerThree = @"Elk Lake";
    questionTwo.correctAnswer = @"Lake Barkley";
    questionTwo.answerArray = @[questionOne.possibleAnswerOne, questionOne.possibleAnswerTwo, questionOne.possibleAnswerThree, questionOne.correctAnswer];
    
    Question *questionThree = [Question initWithQuestion:@"What is Canada's national animal?"];
    
    questionThree.possibleAnswerOne = @"Grizzly Bear";
    questionThree.possibleAnswerTwo = @"Hawk";
    questionThree.possibleAnswerThree = @"Bison";
    questionThree.correctAnswer = @"Beaver";
    questionThree.answerArray = @[questionOne.possibleAnswerOne, questionOne.possibleAnswerTwo, questionOne.possibleAnswerThree, questionOne.correctAnswer];
    
    Question *questionFour = [Question initWithQuestion:@"How many states border the Gulf of Mexico?"];
    
    questionFour.possibleAnswerOne = @"4";
    questionFour.possibleAnswerTwo = @"3";
    questionFour.possibleAnswerThree = @"6";
    questionFour.correctAnswer = @"5";
    questionFour.answerArray = @[questionOne.possibleAnswerOne, questionOne.possibleAnswerTwo, questionOne.possibleAnswerThree, questionOne.correctAnswer];
    
    Question *questionFive = [Question initWithQuestion:@"What was the first planet to be discovered using the telescope, in 1781?"];
    
    questionFive.possibleAnswerOne = @"Mercury";
    questionFive.possibleAnswerTwo = @"Mars";
    questionFive.possibleAnswerThree = @"Saturn";
    questionFive.correctAnswer = @"Uranus";
    questionFive.answerArray = @[questionOne.possibleAnswerOne, questionOne.possibleAnswerTwo, questionOne.possibleAnswerThree, questionOne.correctAnswer];
    
    [_questions addObject:questionOne];
    [_questions addObject:questionTwo];
    [_questions addObject:questionThree];
    [_questions addObject:questionFour];
    [_questions addObject:questionFive];
    
}

-(void)startGame{
    self.view.backgroundColor = [UIColor whiteColor];
    _questions = [NSMutableArray array];
    [self createQuestions];
    _currentQuestion = [_questions objectAtIndex:_currentQuestionIndex];
    questionTextView.text = _currentQuestion.question;
    [answerButtonOne setTitle:_currentQuestion.possibleAnswerOne forState:UIControlStateNormal];
    [answerButtonTwo setTitle:_currentQuestion.possibleAnswerTwo forState:UIControlStateNormal];
    [answerButtonThree setTitle:_currentQuestion.possibleAnswerThree forState:UIControlStateNormal];
    [answerButtonFour setTitle:_currentQuestion.correctAnswer forState:UIControlStateNormal];
    
}

-(void)nextQuestion {
    self.view.backgroundColor = [UIColor whiteColor];
    _startTime = 2;
    
    if (_currentQuestionIndex < _questions.count -1) {
        _currentQuestionIndex++;
        NSLog(@"index: %i", _currentQuestionIndex);
        _currentQuestion = [_questions objectAtIndex:_currentQuestionIndex];
        questionTextView.text = _currentQuestion.question;
        [answerButtonOne setTitle:_currentQuestion.possibleAnswerOne forState:UIControlStateNormal];
        [answerButtonTwo setTitle:_currentQuestion.possibleAnswerTwo forState:UIControlStateNormal];
        [answerButtonThree setTitle:_currentQuestion.possibleAnswerThree forState:UIControlStateNormal];
        [answerButtonFour setTitle:_currentQuestion.correctAnswer forState:UIControlStateNormal];
    }
}

-(void)determineAnswerCorrectness:(BOOL)answer {
    
    if (answer) {
        self.view.backgroundColor = [UIColor greenColor];
        [self startTimer];
        [self subtractTime];

    } else {
        self.view.backgroundColor = [UIColor redColor];
    }

}

-(void)startTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector: @selector(subtractTime) userInfo:nil repeats:YES];
}

-(void)subtractTime {
    _startTime--;
    if (_startTime == 0) {
        [_timer invalidate];
        [self nextQuestion];
    }
}

-(void)hideViewAttributes {
        questionTextView.layer.opacity = 0.00;
        answerButtonOne.layer.opacity = 0.00;
        answerButtonTwo.layer.opacity = 0.00;
        answerButtonThree.layer.opacity = 0.00;
        answerButtonFour.layer.opacity = 0.00;
}

-(void)showViewAttributes {
    questionTextView.layer.opacity = 1.00;
    answerButtonOne.layer.opacity = 1.00;
    answerButtonTwo.layer.opacity = 1.00;
    answerButtonThree.layer.opacity = 1.00;
    answerButtonFour.layer.opacity = 1.00;
}

- (IBAction)answerButtonSelected:(id)sender {
    
    UIButton *selectedButton = sender;

    if ([_currentQuestion.correctAnswer isEqualToString:selectedButton.titleLabel.text]) {
        
        [self determineAnswerCorrectness:YES];
        
    } else {
        [self determineAnswerCorrectness:NO];
    }
    
}

-(IBAction)startOrRestartGame:(id)sender {
    [startGameButton setTitle:@"Restart Game" forState:UIControlStateNormal];
    _startTime = 2;
    _currentQuestionIndex = 0;
    [self showViewAttributes];
    [self startGame];
}





@end
