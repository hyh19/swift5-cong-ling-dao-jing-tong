//
//  Objective-C_Hander.m
//  39_SQLiteLibTest
//
//  Created by 珲少 on 2021/2/9.
//

#import "Objective-C_Hander.h"

@implementation Objective_C_Hander

+(void)runNormalSql:(NSString *)sqlString{
    sqlite3 * _sqlite3_db;
    NSString * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString * file = [NSString stringWithFormat:@"%@/myDB.sqlite",path];
    sqlite3_open([file UTF8String], &_sqlite3_db);
    char * err;
    int code = sqlite3_exec(_sqlite3_db, [sqlString UTF8String], NULL, NULL, &err);
    if (code==SQLITE_OK) {
        NSLog(@"执行成功");
    }else{
        NSLog(@"执行失败");
    }
}

+(void)selectSql{
    sqlite3 * _sqlite3_db;
    NSString * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString * file = [NSString stringWithFormat:@"%@/myDB.sqlite",path];
    sqlite3_open([file UTF8String], &_sqlite3_db);
    sqlite3_stmt *stmt;
    sqlite3_prepare_v2(_sqlite3_db, [@"select * from Student" UTF8String], -1, &stmt, NULL);
    while (sqlite3_step(stmt)==SQLITE_ROW) {
        NSString * name = [NSString stringWithCString:sqlite3_column_text(stmt, 0) encoding:NSUTF8StringEncoding];
        int age = sqlite3_column_int(stmt, 1);
        NSLog(@"name:%@,age:%d",name,age);
    }
}

@end
