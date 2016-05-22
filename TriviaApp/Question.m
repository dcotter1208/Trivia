//
//  Questions.m
//  TriviaApp
//
//  Created by DetroitLabs on 5/20/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "Question.h"

@implementation Question

-(id)initWithQuestion:(NSString *)question answerOne:(NSString *)answerOne answerTwo:(NSString *)answerTwo answerThree:(NSString *)answerThree correctAnswer:(NSString *)correctAnswer pointValue:(int)pointValue {
    self = [super init];
    if (self) {
        _question = question;
        _possibleAnswerOne = answerOne;
        _possibleAnswerTwo = answerTwo;
        _possibleAnswerThree = answerThree;
        _correctAnswer = correctAnswer;
        _pointValue = pointValue;
    }
    return self;
}

+(id)initWithQuestion:(NSString *)question answerOne:(NSString *)answerOne answerTwo:(NSString *)answerTwo answerThree:(NSString *)answerThree correctAnswer:(NSString *)correctAnswer pointValue:(int)pointValue {
    
    return [[self alloc]initWithQuestion:question answerOne:answerOne answerTwo:answerTwo answerThree:answerThree correctAnswer:correctAnswer pointValue:pointValue];
}


@end
