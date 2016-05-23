//
//  ViewController.m
//  TriviaApp
//
//  Created by DetroitLabs on 5/20/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"
#import "OutcomeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self hideViewAttributes];
    [self createQuestions];
    [self viewWillLayoutSubviews];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)viewWillAppear:(BOOL)animated {
    [self startGame];
}

-(void)createQuestions {
    
    Question *questionOne = [Question initWithQuestion:@"The apprenticeship is in ____ Town." answerOne:@"West Corktown" answerTwo:@"Greektown" answerThree:@"Mexicantown" correctAnswer:@"TechTown" pointValue:10];
    
    questionOne.answerArray = [NSMutableArray arrayWithObjects:questionOne.possibleAnswerOne, questionOne.possibleAnswerTwo, questionOne.possibleAnswerThree, questionOne.correctAnswer, nil];
    
    Question *questionTwo = [Question initWithQuestion:@"Which of these is NOT a Michigan inland lake?" answerOne:@"Coldwater Lake" answerTwo:@"Torch Lake" answerThree:@"Elk Lake" correctAnswer:@"Lake Barkley" pointValue:20];

    questionTwo.answerArray = [NSMutableArray arrayWithObjects:questionTwo.possibleAnswerOne, questionTwo.possibleAnswerTwo, questionTwo.possibleAnswerThree, questionTwo.correctAnswer, nil];
    
    Question *questionThree = [Question initWithQuestion:@"What is Canada's national animal?" answerOne:@"Grizzly Bear" answerTwo:@"Hawk" answerThree:@"Bison" correctAnswer:@"Beaver" pointValue:30];

    questionThree.answerArray = [NSMutableArray arrayWithObjects:questionThree.possibleAnswerOne, questionThree.possibleAnswerTwo, questionThree.possibleAnswerThree, questionThree.correctAnswer, nil];
    
    Question *questionFour = [Question initWithQuestion:@"How many states border the Gulf of Mexico?" answerOne:@"4" answerTwo:@"3" answerThree:@"6" correctAnswer:@"5" pointValue:40];

    questionFour.answerArray = [NSMutableArray arrayWithObjects:questionFour.possibleAnswerOne, questionFour.possibleAnswerTwo, questionFour.possibleAnswerThree, questionFour.correctAnswer, nil];
    
    Question *questionFive = [Question initWithQuestion:@"What was the first planet to be discovered using the telescope, in 1781?" answerOne:@"Mercury" answerTwo:@"Mars" answerThree:@"Saturn" correctAnswer:@"Uranus" pointValue:50];

    questionFive.answerArray = [NSMutableArray arrayWithObjects:questionFive.possibleAnswerOne, questionFive.possibleAnswerTwo, questionFive.possibleAnswerThree, questionFive.correctAnswer, nil];
    
    _questions = @[questionOne, questionTwo, questionThree, questionFour, questionFive];
    
}

#pragma mark - Start New Game Function

-(void)startGame {
    self.view.backgroundColor = [UIColor whiteColor];
    _pointCount = 0;
    _currentQuestionIndex = 0;
    totalPointsLabel.text = @"0";
    _questionNumber = 1;
    _currentQuestion = [_questions objectAtIndex:_currentQuestionIndex];
    questionTextView.text = _currentQuestion.question;
    [self randomlyDisplayAnswers:_currentQuestion];
    currentQuestionCountLabel.text = [NSString stringWithFormat:@"Question #%i for %i points", _questionNumber, _currentQuestion.pointValue];
}

#pragma mark - Move to Next Question Function

-(void)nextQuestion {
    self.view.backgroundColor = [UIColor whiteColor];
    _startTime = 2;
    totalPointsLabel.text = [NSString stringWithFormat:@"%i", _pointCount];
    
    if (_currentQuestionIndex < _questions.count -1) {
        _currentQuestionIndex++;
        _currentQuestion = [_questions objectAtIndex:_currentQuestionIndex];
        
        questionTextView.text = _currentQuestion.question;
        [self randomlyDisplayAnswers:_currentQuestion];
        _questionNumber++;
        currentQuestionCountLabel.text = [NSString stringWithFormat:@"Question #%i for %i points", _questionNumber, _currentQuestion.pointValue];
    }
}

#pragma mark - Determine Answer Correctness Function

-(void)determineAnswerCorrectness:(BOOL)answer {
    
    _previousQuestion = [_questions objectAtIndex:_currentQuestionIndex];
    
    if (answer && _pointCount == 100) {
        _pointCount += _previousQuestion.pointValue;
        [self performSegueWithIdentifier:@"segueToOutcomeVC" sender:self];
    } else if (answer) {
        _pointCount += _previousQuestion.pointValue;
        self.view.backgroundColor = [UIColor greenColor];
        [self startTimer];
        [self subtractTime];
    } else {
        [self performSegueWithIdentifier:@"segueToOutcomeVC" sender:self];
    }
}

#pragma mark - NSTimer functions

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

#pragma mark - Array Shuffle Functions

-(NSArray *)shuffleArray:(NSMutableArray *)questionAnswerArray {
    
    for (int i = 0; i < questionAnswerArray.count; i++) {
        int randomInt = arc4random() % [questionAnswerArray count];
        [questionAnswerArray exchangeObjectAtIndex:i withObjectAtIndex:randomInt];
    }

    return questionAnswerArray;
}

-(void)randomlyDisplayAnswers:(Question *)question {

    NSArray *answerArray = [self shuffleArray:question.answerArray];
    for (int i = 0; i < question.answerArray.count; i++) {
        [answerButtonOne setTitle:[answerArray objectAtIndex:0] forState:UIControlStateNormal];
        [answerButtonTwo setTitle:[answerArray objectAtIndex:1] forState:UIControlStateNormal];
        [answerButtonThree setTitle:[answerArray objectAtIndex:2]forState:UIControlStateNormal];
        [answerButtonFour setTitle:[answerArray objectAtIndex:3] forState:UIControlStateNormal];
    }
}

#pragma mark - Prepare For Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueToOutcomeVC"]) {
        OutcomeViewController *destionationVC = (OutcomeViewController *)segue.destinationViewController;
        destionationVC.totalPoints = _pointCount;
    }
}

#pragma mark - Hide or show buttons and textview

-(void)hideViewAttributes {
    questionTextView.layer.opacity = 0.00;
    answerButtonOne.layer.opacity = 0.00;
    answerButtonTwo.layer.opacity = 0.00;
    answerButtonThree.layer.opacity = 0.00;
    answerButtonFour.layer.opacity = 0.00;
    currentQuestionCountLabel.layer.opacity = 0.00;
    totalPointsStaticLabel.layer.opacity = 0.00;
    totalPointsLabel.layer.opacity = 0.00;
}

-(void)showViewAttributes {
    questionTextView.layer.opacity = 1.00;
    answerButtonOne.layer.opacity = 1.00;
    answerButtonTwo.layer.opacity = 1.00;
    answerButtonThree.layer.opacity = 1.00;
    answerButtonFour.layer.opacity = 1.00;
    currentQuestionCountLabel.layer.opacity = 1.00;
    totalPointsStaticLabel.layer.opacity = 1.00;
    totalPointsLabel.layer.opacity = 1.00;
}

#pragma mark - Layout Subviews

-(void)viewWillLayoutSubviews {
    //Start Button
    startGameButton.layer.cornerRadius = startGameButton.frame.size.height / 2;
    startGameButton.layer.borderWidth = 2.0;
    startGameButton.layer.borderColor = [UIColor blackColor].CGColor;
    
    //Question Text View
    questionTextView.layer.cornerRadius = questionTextView.frame.size.height / 2;
    questionTextView.layer.borderWidth = 4.0;
    questionTextView.layer.borderColor = [UIColor blackColor].CGColor;
    
    //Answer Buttons
    answerButtonOne.layer.cornerRadius = answerButtonOne.frame.size.height / 2;
    answerButtonOne.layer.borderWidth = 2.0;
    answerButtonOne.layer.borderColor = [UIColor blackColor].CGColor;
    
    answerButtonTwo.layer.cornerRadius = answerButtonTwo.frame.size.height / 2;
    answerButtonTwo.layer.borderWidth = 2.0;
    answerButtonTwo.layer.borderColor = [UIColor blackColor].CGColor;
    
    answerButtonThree.layer.cornerRadius = answerButtonThree.frame.size.height / 2;
    answerButtonThree.layer.borderWidth = 2.0;
    answerButtonThree.layer.borderColor = [UIColor blackColor].CGColor;
    
    answerButtonFour.layer.cornerRadius = answerButtonFour.frame.size.height / 2;
    answerButtonFour.layer.borderWidth = 2.0;
    answerButtonFour.layer.borderColor = [UIColor blackColor].CGColor;
    
    //Total Points Label
    totalPointsLabel.layer.cornerRadius = totalPointsLabel.frame.size.width / 2;
    totalPointsLabel.clipsToBounds = YES;
    totalPointsLabel.layer.borderWidth = 2.0;
    totalPointsLabel.layer.borderColor = [UIColor blackColor].CGColor;
    
    //Current Question Label
    currentQuestionCountLabel.layer.cornerRadius = currentQuestionCountLabel.frame.size.height / 2;
    currentQuestionCountLabel.clipsToBounds = YES;
    currentQuestionCountLabel.layer.borderWidth = 2.0;
    currentQuestionCountLabel.layer.borderColor = [UIColor blackColor].CGColor;
}

#pragma mark - IBActions

- (IBAction)answerButtonSelected:(id)sender {
    
    UIButton *selectedButton = sender;

    if ([_currentQuestion.correctAnswer isEqualToString:selectedButton.titleLabel.text]) {
        
        [self determineAnswerCorrectness:YES];
        
    } else {
        [self determineAnswerCorrectness:NO];
    }
}

-(IBAction)startOrRestartGame:(id)sender {
    _pointCount = 0;
    [startGameButton setTitle:@"Restart Game" forState:UIControlStateNormal];
    _startTime = 2;
    [self showViewAttributes];
    [self startGame];
}





@end
