//
//  DrawingView.h
//  DrowLineTest
//
//  Created by 李响响 on 2018/6/25.
//  Copyright © 2018年 李响响. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectPhotoManager.h"
@interface DrawingView : UIView
@property(nonatomic,strong)UIButton *undoButton;
@property(nonatomic,strong)UIButton *clearButton;
@property(nonatomic,strong)UIButton *saveButton;
@property(nonatomic,strong)NSMutableArray *lines; /**< 存储绘制的线 */

@property (nonatomic, strong)SelectPhotoManager *photoManager;
@end
