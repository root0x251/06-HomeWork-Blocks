//
//  Student.m
//  06-HomeWork-Blocks
//
//  Created by Slava on 07.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void) notPassedExam { // недобор баллов
    NSLog(@"%@ не сдал экзамен", self.name);
}

- (void) retake {   // пересдача
    NSLog(@"%@, идет на пересдачу", self.name);
}

- (void) kick {     // исключение
    NSLog(@"%@, исключен", self.name);
}


@end
