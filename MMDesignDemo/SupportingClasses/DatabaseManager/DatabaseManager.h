//
//  DatabaseManager.h
//  MMDesignDemo
//
//  Created by keyur on 19/04/17.
//  Copyright © 2017 Keyur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StructureDemo.h"

@interface DatabaseManager : NSObject

@property (nonatomic,strong)FMDatabase *database;

+(DatabaseManager *)getInstance;
+(void)copyFile :(NSString *)file;

-(NSMutableArray *)displayData;
- (void)insertData:(NSString *)sname Email:(NSString *)email Phone:(NSString *)phone;
-(void)updateData:(NSString *)sname Email:(NSString *)email Phone:(NSString *)phone Oldname:(NSString *)oldName;
-(void)deleteData:(NSString *)name;
@end
