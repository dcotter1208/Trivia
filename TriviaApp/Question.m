//
//  Questions.m
//  TriviaApp
//
//  Created by DetroitLabs on 5/20/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "Question.h"

@implementation Question

-(id)initWithQuestion:(NSString *)question {
    self = [super init];
    if (self) {
        _question = question;
    }
    return self;
}

+(id)initWithQuestion:(NSString *)question {
    return [[self alloc]initWithQuestion:question];
}


@end
