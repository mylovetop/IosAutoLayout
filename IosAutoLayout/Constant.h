//
//  Constant.h
//  IosAutoLayout
//
//  Created by zdsoft on 15-7-29.
//  Copyright (c) 2015年 zdsoft. All rights reserved.
//

#ifndef IosAutoLayout_Constant_h
#define IosAutoLayout_Constant_h

#define VIEW_CONTENT_TOP                        50

#endif


//自动布局规则
//|: 表示父视图
//-:表示距离
//V:  :表示垂直
//H:  :表示水平
//>= :表示视图间距、宽度和高度必须大于或等于某个值
//<= :表示视图间距、宽度和高度必须小宇或等于某个值
//== :表示视图间距、宽度或者高度必须等于某个值
//@  :>=、<=、==  限制   最大为  1000
//
//1.|-[view]-|:  视图处在父视图的左右边缘内
//2.|-[view]  :   视图处在父视图的左边缘
//3.|[view]   :   视图和父视图左边对齐
//4.-[view]-  :  设置视图的宽度高度
//5.|-30.0-[view]-30.0-|:  表示离父视图 左右间距  30
//6.[view(200.0)] : 表示视图宽度为 200.0
//7.|-[view(view1)]-[view1]-| :表示视图宽度一样，并且在父视图左右边缘内
//8. V:|-[view(50.0)] : 视图高度为  50
//9: V:|-(==padding)-[imageView]->=0-[button]-(==padding)-| : 表示离父视图的距离
//为Padding,这两个视图间距必须大于或等于0并且距离底部父视图为 padding。
//10:  [wideView(>=60@700)]  :视图的宽度为至少为60 不能超过  700
//11: 如果没有声明方向默认为  水平  V: