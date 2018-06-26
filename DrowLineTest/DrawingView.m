//
//  DrawingView.m
//  DrowLineTest
//
//  Created by 李响响 on 2018/6/25.
//  Copyright © 2018年 李响响. All rights reserved.
//

#import "DrawingView.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kSize [UIScreen mainScreen].bounds.size
enum {
    undoTag = 100, clearTag
};

@interface DrawingView ()

@end

@implementation DrawingView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        // 初始化集合
        _lines = [NSMutableArray array];
      
        // 撤销
        UIButton *undoButton = [UIButton buttonWithType:UIButtonTypeSystem];
        undoButton.bounds = CGRectMake(0, 0, 50, 40);
        undoButton.center = CGPointMake( [UIScreen mainScreen].bounds.size.width - 50, 55);
        [self setButtonAttributeWithButton:undoButton title:@"撤销" tag:undoTag];
        _undoButton=undoButton;
        [self addSubview:_undoButton];
        
        
        // 清空
        UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeSystem];
        clearButton.bounds = CGRectMake(0, 0, 50, 40);
        clearButton.center = CGPointMake(40, 55);
        [self setButtonAttributeWithButton:clearButton title:@"清空" tag:clearTag];
        _clearButton=clearButton;
        [self addSubview:_clearButton];
     
        UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
        saveButton.bounds = CGRectMake(0, 0, 50, 40);
          saveButton.center = CGPointMake(kWidth/2, 55);
        [saveButton setTitle:@"保存" forState:UIControlStateNormal];
        saveButton.backgroundColor=[UIColor redColor];
       
        _saveButton=saveButton;
        [self addSubview:_saveButton];
        
        
  
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    // 异常处理
    if (_lines.count == 0) {
        return;
    }
    
    // 解决点点击之后再绘制奔溃的问题
    [_lines removeObject:@[]];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 3.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    // 步骤：取出一条线 -》 取得线上的每一个点 -》绘图
    for (int i = 0; i < _lines.count; i++) {
        NSMutableArray *points = _lines[i];
        for (int j = 0; j < points.count - 1; j++) {
            
            CGPoint currentPoint = [points[j] CGPointValue];
            CGPoint nextPoint = [points[j + 1] CGPointValue];
            
            // 连接两点
            CGContextMoveToPoint(context, currentPoint.x, currentPoint.y);
            CGContextAddLineToPoint(context, nextPoint.x, nextPoint.y);
        }
    }
    // 开始绘制
    CGContextStrokePath(context);
    
}

#pragma mark - Touches methods
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSMutableArray *newPoints = [NSMutableArray array];
    
    [_lines addObject:newPoints];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    NSValue *value = [NSValue valueWithCGPoint:point];
    
    [_lines.lastObject addObject:value];
    // 调用此方法会直接调用drawRect方法
    [self setNeedsDisplay];
    
}

#pragma mark - Private methods
- (void)setButtonAttributeWithButton:(UIButton *)button title:(NSString *)title tag:(NSInteger)tag {
    button.tag = tag;
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.cornerRadius = 6;
    [button setTitle:title forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(respondsToButton:) forControlEvents:UIControlEventTouchUpInside];
}
//#pragma mark - responds events
//- (void)respondsToButton:(UIButton *)sender {
//    switch (sender.tag) {
//        case undoTag: {
//            [_lines removeLastObject];
//            [self setNeedsDisplay];
//        }
//            break;
//        case clearTag: {
////            [_lines removeAllObjects];
////            [self setNeedsDisplay];
//        }
//
//        default:
//            break;
//    }
//}

@end
