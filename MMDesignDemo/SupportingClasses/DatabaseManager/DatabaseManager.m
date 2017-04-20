//
//  DatabaseManager.m
//  MMDesignDemo
//
//  Created by keyur on 19/04/17.
//  Copyright © 2017 Keyur. All rights reserved.
//

#import "DatabaseManager.h"

@implementation DatabaseManager

static DatabaseManager *instance = nil;
@synthesize database;

+(DatabaseManager *)getInstance{
    
    if (!instance) {
        
        instance = [[DatabaseManager alloc]init];
        instance.database = [FMDatabase databaseWithPath:[self getFilePath:@"Score.sqlite"]];
    }
    return instance;
}

+(NSString *)getFilePath :(NSString *)fileName{
    
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:fileName];
}

+(void)copyFile:(NSString *)file{

    NSString *toPath = [self getFilePath:file];
    NSLog(@"toPath :- %@",toPath);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:toPath]) {
        
        NSString *fromPath = [[NSBundle mainBundle]pathForResource:@"Score" ofType:@"sqlite"];
        [fileManager copyItemAtPath:fromPath toPath:toPath error:nil];
    }
}

- (void)insertData:(NSString *)sname Email:(NSString *)email Phone:(NSString *)phone{
    
    [instance.database open];
    
    NSString *strQuery = [NSString stringWithFormat:@"INSERT INTO student(sname,email,phone) VALUES ('%@','%@','%@')",sname,email,phone];
    NSLog(@"strQuery :- %@",strQuery);
    
    BOOL isInserted = [instance.database executeUpdate:strQuery];
    [instance.database close];
    
    if (isInserted) {
        
        NSLog(@"Inserted Successfully");
    }
    else{
        
        NSLog(@"Error occured while inserting");
    }
}

-(NSMutableArray *) displayData
{
    [instance.database open];
    
    NSMutableArray *arrTeam1Player = [[NSMutableArray alloc] init];
    
    FMResultSet *resultSet=[instance.database executeQuery:@"SELECT * FROM student"];
    if(resultSet)
    {
        while([resultSet next])
        {
            [arrTeam1Player addObject:[resultSet resultDictionary]];
            NSLog(@"%@",arrTeam1Player);
        }
    }
    [instance.database close];
    return arrTeam1Player;
}

-(void)updateData:(NSString *)sname Email:(NSString *)email Phone:(NSString *)phone Oldname:(NSString *)oldName
{
    [instance.database open];
    
    BOOL isUpdated=[instance.database executeUpdate:@"UPDATE student SET sname=?,email=?,phone=? WHERE sname=?",sname,email,phone,oldName];
    
    [instance.database close];
    
    if(isUpdated)
        NSLog(@"Updated Successfully");
    else
        NSLog(@"Error occured while Updating");
}

-(void)deleteData:(NSString *)name
{
    [instance.database open];
    BOOL isDeleted=[instance.database executeUpdate:@"DELETE FROM student WHERE sname=?",name];
    [instance.database close];
    
    if(isDeleted)
        NSLog(@"Deleted Successfully");
    else
        NSLog(@"Error occured while Deleting");
}
@end
