//
//  QuestionData.m
//  TriviaApp
//
//  Created by DetroitLabs on 5/20/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "QuestionData.h"

@implementation QuestionData

-(void)createQuestions {
    Question *questionOne = [Question initWithQuestion:@"The apprenticeship is in ____ Town."];
    
    questionOne.possibleAnswerOne = @"West Corktown";
    questionOne.possibleAnswerTwo = @"Greektown";
    questionOne.possibleAnswerThree = @"Mexicantown";
    questionOne.correctAnswer = @"TechTown";

    
    Question *questionTwo = [Question initWithQuestion:@"Which of these is NOT a Michigan inland lake?"];
    
    questionTwo.possibleAnswerOne = @"Coldwater Lake";
    questionTwo.possibleAnswerTwo = @"Torch Lake";
    questionTwo.possibleAnswerThree = @"Elk Lake";
    questionTwo.correctAnswer = @"Lake Barkley";
    
    Question *questionThree = [Question initWithQuestion:@"What is Canada's national animal?"];
    
    questionThree.possibleAnswerOne = @"Grizzly Bear";
    questionThree.possibleAnswerTwo = @"Hawk";
    questionThree.possibleAnswerThree = @"Bison";
    questionThree.correctAnswer = @"Beaver";
    
    Question *questionFour = [Question initWithQuestion:@"How many states border the Gulf of Mexico?"];
    
    questionFour.possibleAnswerOne = @"4";
    questionFour.possibleAnswerTwo = @"3";
    questionFour.possibleAnswerThree = @"6";
    questionFour.correctAnswer = @"5";
    
    Question *questionFive = [Question initWithQuestion:@"What was the first planet to be discovered using the telescope, in 1781?"];
    
    questionFive.possibleAnswerOne = @"Mercury";
    questionFive.possibleAnswerTwo = @"Mars";
    questionFive.possibleAnswerThree = @"Saturn";
    questionFive.correctAnswer = @"Uranus";
    
    [_questionsArray addObject:questionOne];
    [_questionsArray addObject:questionTwo];
    [_questionsArray addObject:questionThree];
    [_questionsArray addObject:questionFour];
    [_questionsArray addObject:questionFive];
}



@end
