//
//  ItemListViewModel.m
//  StructureDemo
//
//  Created by 汪启航 on 2019/10/11.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "ItemListViewModel.h"
#import "ItemListModel.h"

NSString * const kPropertyListDataKeyID = @"kPropertyListDataKeyID";
NSString * const kPropertyListDataKeyName = @"kPropertyListDataKeyName";
NSString * const kPropertyListDataKeyTitle = @"kPropertyListDataKeyTitle";
NSString * const kPropertyListDataKeyImage = @"kPropertyListDataKeyImage";

@implementation ItemListViewModel

- (NSDictionary *)reformDataWithManager:(APIManager *)manager {
    NSDictionary *resultData = nil;
    if ([manager isKindOfClass:[ItemListModel class]]) {
        resultData = @{
                       kPropertyListDataKeyID:manager.rawData[@"id"],
                       kPropertyListDataKeyName:manager.rawData[@"name"],
                       kPropertyListDataKeyTitle:manager.rawData[@"title"],
                       kPropertyListDataKeyImage:manager.rawData[@"imageUrl"]
                       };
    }
    /*
     if ([manager isKindOfClass:[XinFangListAPIManager class]]) {
     resultData = @{
     kPropertyListDataKeyID:originData[@"xinfang_id"],
     kPropertyListDataKeyName:originData[@"xinfang_name"],
     kPropertyListDataKeyTitle:originData[@"xinfang_title"],
     kPropertyListDataKeyImage:[UIImage imageWithUrlString:originData[@"xinfang_imageUrl"]]
     };
     }
     if ([manager isKindOfClass:[ErShouFangListAPIManager class]]) {
     resultData = @{
     kPropertyListDataKeyID:originData[@"esf_id"],
     kPropertyListDataKeyName:originData[@"esf_name"],
     kPropertyListDataKeyTitle:originData[@"esf_title"],
     kPropertyListDataKeyImage:[UIImage imageWithUrlString:originData[@"esf_imageUrl"]]
     };
     }
     */
    return resultData;
}

@end
