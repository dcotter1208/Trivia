//
//  Questions.h
//  TriviaApp
//
//  Created by DetroitLabs on 5/20/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Question : NSObject

@property(nonatomic, strong) NSString *question;
@property(nonatomic, strong) NSString *possibleAnswerOne;
@property(nonatomic, strong) NSString *possibleAnswerTwo;
@property(nonatomic, strong) NSString *possibleAnswerThree;
@property(nonatomic, strong) NSString *correctAnswer;
@property(nonatomic, strong) NSMutableArray *answerArray;
@property(nonatomic) int pointValue;

-(id)initWithQuestion:(NSString *)question answerOne:(NSString *)answerOne answerTwo:(NSString *)answerTwo answerThree:(NSString *)answerThree correctAnswer:(NSString *)correctAnswer pointValue:(int)pointValue;

+(id)initWithQuestion:(NSString *)question answerOne:(NSString *)answerOne answerTwo:(NSString *)answerTwo answerThree:(NSString *)answerThree correctAnswer:(NSString *)correctAnswer pointValue:(int)pointValue;


@end

NS_ASSUME_NONNULL_END