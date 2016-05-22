//
//  QuestionData.h
//  TriviaApp
//
//  Created by DetroitLabs on 5/20/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface QuestionData : NSObject

@property(nonatomic, strong) NSMutableArray *questionsArray;
-(void)createQuestions;

@end
