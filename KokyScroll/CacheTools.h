//
//  CacheTools.h
//  KokyScroll
//
//  Created by jingjing on 2017/8/8.
//  Copyright © 2017年 jingjing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CacheTools : NSObject

+(NSString *)getPath;
+(CGFloat)folderSizeWithPath:(NSString *)path;
+(void)clearCacheWith:(NSString *)path;

@end
