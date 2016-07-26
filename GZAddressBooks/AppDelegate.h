//
//  AppDelegate.h
//  GZAddressBooks
//
//  Created by xinshijie on 16/7/26.
//  Copyright © 2016年 Mr.quan. All rights reserved.
//
/*
 *********************************************************************************
 *
 *  QQ    : 3139726292
 * 新浪微博 : 轻斟浅醉17
 * Email  : 3139726292@qq.com
 * GitHub : https://github.com/Gang679
 * 博客园  : http://www.cnblogs.com/Gang679/
 * 博客    : http://gang679.blog.163.com
 *********************************************************************************
 */
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

