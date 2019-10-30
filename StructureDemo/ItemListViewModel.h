//
//  ItemListViewModel.h
//  StructureDemo
//
//  Created by 汪启航 on 2019/10/11.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReformerProtocol.h"

/*
 ViewModel封装数据转化的逻辑,做数据的标准化输出,还可以暴露属性,来与View进行双向绑定
 必须实现reformDataWithManager:方法来提供数据转化逻辑.
 针对不同的Model,转化逻辑不一样,所以这里依赖Model.
 一个ViewModel可以对应不同的View,一个View只对应一个ViewModel.
 整个MVVM,在Controller里面只处理Model,View,ViewModel之间的调度逻辑
 依赖关系:只有Controllerl依赖Model,View,ViewModel;ViewModel依赖Model.
 */


extern NSString * const kPropertyListDataKeyID;
extern NSString * const kPropertyListDataKeyName;
extern NSString * const kPropertyListDataKeyTitle;
extern NSString * const kPropertyListDataKeyImage;

NS_ASSUME_NONNULL_BEGIN

@interface ItemListViewModel : NSObject<ReformerProtocol>

@end

NS_ASSUME_NONNULL_END
