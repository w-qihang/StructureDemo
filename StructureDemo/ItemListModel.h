//
//  ItemListModel.h
//  StructureDemo
//
//  Created by 汪启航 on 2019/10/11.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "APIManager.h"

/*
 这里不仅是一个APIManager,也充当了Model的角色(胖model,包含弱业务)
 在Model内进行网络请求并提供原始数据rawData,针对不同的业务可在此定制化不同的场景,比如提供翻页,下拉刷新和列表多维度筛选时取消请求
 必须实现APIManagerDataSource来提供网络请求的配置.
 */

NS_ASSUME_NONNULL_BEGIN

@interface ItemListModel : APIManager

@end

NS_ASSUME_NONNULL_END
