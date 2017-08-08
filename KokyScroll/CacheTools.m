//
//  CacheTools.m
//  KokyScroll
//
//  Created by jingjing on 2017/8/8.
//  Copyright © 2017年 jingjing. All rights reserved.
//

#import "CacheTools.h"

@implementation CacheTools

//首先获取缓存文件的路径
+(NSString *)getPath
{
    //沙盒目录下library文件夹下的cache文件夹就是缓存文件夹
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return path;
}

+(CGFloat)folderSizeWithPath:(NSString *)path
{
    //初始化文件管理类
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    float folderSize = 0.0;
    if ([fileManager fileExistsAtPath:path])
    {
        //如果存在
        //计算文件的大小
        NSArray * fileArray = [fileManager subpathsAtPath:path];
        for (NSString * fileName in fileArray)
        {
            //可以过滤掉特殊格式的文件
            if ([fileName hasSuffix:@".png"])
            {
                continue;
            }
            //获取每个文件的路径
            NSString * filePath = [path stringByAppendingPathComponent:fileName];
            //计算每个子文件的大小
            long fileSize = [fileManager attributesOfItemAtPath:filePath error:nil].fileSize;//字节数
            folderSize = folderSize + fileSize / 1024.0 / 1024.0;
        }
    }
    return folderSize;
}

+(void)clearCacheWith:(NSString *)path
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path])
    {
        NSArray * fileArray = [fileManager subpathsAtPath:path];
        for (NSString * fileName in fileArray)
        {
            //可以过滤掉特殊格式的文件
            if ([fileName hasSuffix:@".png"])
            {
                NSLog(@"不删除");
            }
            else
            {
                //获取每个子文件的路径
                NSString * filePath = [path stringByAppendingPathComponent:fileName];
                //移除指定路径下的文件
                [fileManager removeItemAtPath:filePath error:nil];
            }
        }
    }
}

@end
