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
    
    [self createQuestions];
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
    questionOne.answerArray = [NSMutableArray arrayWithObjects:questionOne.possibleAnswerOne, questionOne.possibleAnswerTwo, questionOne.possibleAnswerThree, questionOne.correctAnswer, nil];
    
    Question *questionTwo = [Question initWithQuestion:@"Which of these is NOT a Michigan inland lake?"];
    
    questionTwo.possibleAnswerOne = @"Coldwater Lake";
    questionTwo.possibleAnswerTwo = @"Torch Lake";
    questionTwo.possibleAnswerThree = @"Elk Lake";
    questionTwo.correctAnswer = @"Lake Barkley";
    questionTwo.answerArray = [NSMutableArray arrayWithObjects:questionTwo.possibleAnswerOne, questionTwo.possibleAnswerTwo, questionTwo.possibleAnswerThree, questionTwo.correctAnswer, nil];
    
    Question *questionThree = [Question initWithQuestion:@"What is Canada's national animal?"];
    
    questionThree.possibleAnswerOne = @"Grizzly Bear";
    questionThree.possibleAnswerTwo = @"Hawk";
    questionThree.possibleAnswerThree = @"Bison";
    questionThree.correctAnswer = @"Beaver";
    questionThree.answerArray = [NSMutableArray arrayWithObjects:questionThree.possibleAnswerOne, questionThree.possibleAnswerTwo, questionThree.possibleAnswerThree, questionThree.correctAnswer, nil];
    
    Question *questionFour = [Question initWithQuestion:@"How many states border the Gulf of Mexico?"];
    
    questionFour.possibleAnswerOne = @"4";
    questionFour.possibleAnswerTwo = @"3";
    questionFour.possibleAnswerThree = @"6";
    questionFour.correctAnswer = @"5";
    questionFour.answerArray = [NSMutableArray arrayWithObjects:questionFour.possibleAnswerOne, questionFour.possibleAnswerTwo, questionFour.possibleAnswerThree, questionFour.correctAnswer, nil];
    
    Question *questionFive = [Question initWithQuestion:@"What was the first planet to be discovered using the telescope, in 1781?"];
    
    questionFive.possibleAnswerOne = @"Mercury";
    questionFive.possibleAnswerTwo = @"Mars";
    questionFive.possibleAnswerThree = @"Saturn";
    questionFive.correctAnswer = @"Uranus";
    questionFive.answerArray = [NSMutableArray arrayWithObjects:questionFive.possibleAnswerOne, questionFive.possibleAnswerTwo, questionFive.possibleAnswerThree, questionFive.correctAnswer, nil];
    
    _questions = @[questionOne, questionTwo, questionThree, questionFour, questionFive];
    
}

-(void)startGame {
    self.view.backgroundColor = [UIColor whiteColor];
    [self createQuestions];
    _currentQuestion = [_questions objectAtIndex:_currentQuestionIndex];
    questionTextView.text = _currentQuestion.question;
    [self randomlyDisplayAnswers:_currentQuestion];
}

-(void)nextQuestion {
    self.view.backgroundColor = [UIColor whiteColor];
    _startTime = 2;
    
    if (_currentQuestionIndex < _questions.count -1) {
        _currentQuestionIndex++;
        _currentQuestion = [_questions objectAtIndex:_currentQuestionIndex];
        questionTextView.text = _currentQuestion.question;
        [self randomlyDisplayAnswers:_currentQuestion];
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

-(void)randomlyDisplayAnswers:(Question *)question {

    NSArray *answerArray = [self shuffleArray:question.answerArray];
    for (int i = 0; i < question.answerArray.count; i++) {
        
        [answerButtonOne setTitle:[answerArray objectAtIndex:0] forState:UIControlStateNormal];
        [answerButtonTwo setTitle:[answerArray objectAtIndex:1] forState:UIControlStateNormal];
        [answerButtonThree setTitle:[answerArray objectAtIndex:2]forState:UIControlStateNormal];
        [answerButtonFour setTitle:[answerArray objectAtIndex:3] forState:UIControlStateNormal];
    }
}

-(NSArray *)shuffleArray:(NSMutableArray *)questionAnswerArray {
    
    int count = (int)questionAnswerArray.count;
    for (int i = 0; i < count; ++i) {
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [questionAnswerArray exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    return questionAnswerArray;
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
