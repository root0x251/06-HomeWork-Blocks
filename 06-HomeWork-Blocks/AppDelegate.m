//
//  AppDelegate.m
//  06-HomeWork-Blocks
//
//  Created by Slava on 07.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
#pragma mark - Easy
    //    1. В апп делегате создайте блок с без возвращаемой переменной и без параметров и вызовите его.
    //    2. Создайте блоки с параметрами и передайте туда строку, которую выведите на экран в последствии.
    //    3. Если вы не определили тип данных для ваших блоков, то сделайте это сейчас и используйте их
    //    4. Создайте метод который принимает блок и вызывает его и вызовите этот метод.
    
    void (^block) (void) = ^ {
        NSLog(@"я блок с безвозвращаемой переменной из задания ученик");
    };
    block();
    
    void (^blockWithParametrString) (NSString *) = ^(NSString * string) {
        NSLog(@"я блок с параметром string-%@", string);
    };
    blockWithParametrString(@"parametr string");
    
    [self methodWithBlock:^{
        NSLog(@"я метод который принимает блок");
    }];

#pragma mark - Student lvl
//    Студент.
//    5. Создайте класс студент с проперти имя и фамилия.
//    6. Создайте в аппделегате 10 разных студентов, пусть у парочки будут одинаковые фамилии.
//    7. Поместите всех в массив.
//    8. Используя соответствующий метод сортировки массива (с блоком) отсортируйте массив студентов сначала по фамилии, а если они одинаковы то по имени.

    NSMutableArray *arrayStud = [NSMutableArray new];
    for (int i = 1; i < 5; i++) {
        Student *stud = [Student new];
        char randomLatterName  = arc4random_uniform(3) + 'A';
        char randomLatterLastName = arc4random_uniform(10) + 'A';
        stud.name = [NSString stringWithFormat:@"%carray+One+Name", randomLatterName];
        stud.lastName = [NSString stringWithFormat:@"%carray+One+LastName", randomLatterLastName];
        [arrayStud addObject:stud];
    }
    for (int i = 1; i < 5; i++) {
        Student * stud2 = [Student new];
        char randomLatterName  = arc4random_uniform(3) + 'A';
        char randomLatterLastName = arc4random_uniform(10) + 'A';
        stud2.name = [NSString stringWithFormat:@"%carray-Two-Name", randomLatterName];
        stud2.lastName = [NSString stringWithFormat:@"%carray-Two-LastName", randomLatterLastName];
        [arrayStud addObject:stud2];
    }
    for (int i = 1; i < 5; i++) {
        Student * stud3 = [Student new];
        char randomLatterName  = arc4random_uniform(3) + 'A';
        char randomLatterLastName = arc4random_uniform(10) + 'A';
        stud3.name = [NSString stringWithFormat:@"%carray_Three_Name", randomLatterName];
        stud3.lastName = [NSString stringWithFormat:@"%carray_ThreeLast_Name", randomLatterLastName];
        [arrayStud addObject:stud3];
    }
//    for (int i = 0; i < arraStud.count; i++) {
//        Student *string = [arraStud objectAtIndex:i];
//        NSLog(@"%d, %@ %@", i, string.name, string.lastName);
//    }
    
    
    NSArray *sortArray = [arrayStud sortedArrayUsingComparator:^NSComparisonResult(id studentOne, id studentTwo) {
        if ([studentOne lastName] == [studentTwo lastName]) {
            return [[studentOne name] compare:[studentTwo name]];
        } else {
            return [[studentOne lastName] compare:[studentTwo lastName]];
        }
    }];

    for (int i = 0; i < sortArray.count; i++) {
        Student *obj = [sortArray objectAtIndex:i];
        NSLog(@"%d, name - %@, lastname - %@", i, obj.name, obj.lastName);
    }
    
    
//    Мастер.
//    9. Задание из видео. Из урока о делегатах. У пациентов удалите протокол делегат и соответствующее проперти.
//    10. Добавьте метод принимающий блок когда им станет плохо.
//    11. Блок должен передавать указатель на самого студента ну и на те параметры, которые были в задании по делегатам.
//    12. Теперь когда пациентам поплохеет, они должны вызывать блок, а в блоке нужно принимать решения что делать (доктор не нужен делайте все в апп делегате)
//    
//    Супермен
//    13. Познайте истинное предназначение блоков :) Пусть пациентам становится плохо не тогда когда вы их вызываете в цикле(это убрать), а через случайное время 5-15 секунд после создания (используйте специальный метод из урока по селекторам в ините пациента).
//    14. не забудьте массив пациентов сделать проперти аппделегата, а то все помрут по выходе из функции так и не дождавшись :)
    
    return YES;
}

- (void) methodWithBlock: (void (^) (void)) block {
    block();
}


- (void)applicationWillResignActive:(UIApplication *)application {

    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {

}


@end
