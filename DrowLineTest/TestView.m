//
//  TestView.m
//  DrowLineTest
//
//  Created by 李响响 on 2018/6/25.
//  Copyright © 2018年 李响响. All rights reserved.
//

#import "TestView.h"

@implementation TestView
/*
// 1、绘制椭圆
CGContextAddEllipseInRect(CGContextRef context, CGRect rect)

// 2、绘制虚线
CGContextSetLineDash(CGContextRef c, CGFloat phase,
                     const CGFloat lengths[], size_t count)

// 3、绘制圆弧
CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,
                       CGFloat x2, CGFloat y2, CGFloat radius)

CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y,
                CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)

// 4、绘制曲线
CGContextAddCurveToPoint(CGContextRef c, CGFloat cp1x,
                         CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)

// 5、绘制直线
CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)

// 6、绘制曲线
CGContextAddRect(CGContextRef __nullable c, CGRect rect)
 
 */







#pragma mark - **************** 绘制椭圆
/*
- (void)drawRect:(CGRect)rect {
    
    // 获取上下文（画布）
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置线条宽度
    CGContextSetLineWidth(context, 3.0);
    // 设置线条颜色
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    // 创建一个椭圆，如果 width = height 则是一个圆
    CGRect rectangle = CGRectMake(100, 100, 200, 200);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextStrokePath(context);
    
    // 填充
    // 1、设置填充颜色
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    // 2、填充椭圆
    CGContextFillEllipseInRect(context, rectangle);
    
}
 
 */

/*
#pragma mark - **************** 绘制直线
- (void)drawRect:(CGRect)rect {
    
    // 获取上下文（画布）
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置线条宽度
    CGContextSetLineWidth(context, 3.0);
    // 设置线条颜色
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    // 确定第一个点
    CGContextMoveToPoint(context, 100, 100);
    // 确定第二个点
    CGContextAddLineToPoint(context, 200, 300);
    // 开始绘图
    CGContextStrokePath(context);
}
 */

/*
#pragma mark - **************** 绘制椭圆
- (void)drawRect:(CGRect)rect {
    
    // 获取上下文（画布）
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置线条宽度
    CGContextSetLineWidth(context, 3.0);
    // 设置线条颜色
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    // 创建一个椭圆，如果 width = height 则是一个圆
    CGRect rectangle = CGRectMake(100, 100, 200, 200);
    
    CGContextAddEllipseInRect(context, rectangle);
    
    CGContextStrokePath(context);
    
}
 */

/*
#pragma mark - **************** 绘制三角形
- (void)drawRect:(CGRect)rect {
    
    // 获取上下文（画布）
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置线条宽度
    CGContextSetLineWidth(context, 3.0);
    // 设置线条颜色
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    // 创建三个点
    CGPoint point1 = CGPointMake(CGRectGetMidX(self.bounds),
                                 CGRectGetMidY(self.bounds) - 80);
    CGPoint point2 = CGPointMake(CGRectGetMidX(self.bounds) - 80,
                                 CGRectGetMidY(self.bounds) + 100);
    CGPoint point3 = CGPointMake(CGRectGetMidX(self.bounds) + 80,
                                 CGRectGetMidY(self.bounds) + 100);
    
    // 连接三个点
    // 1、设置起点
    CGContextMoveToPoint(context, point1.x, point1.y);
    // 2、设置连接点
    CGContextAddLineToPoint(context, point2.x, point2.y);
    CGContextAddLineToPoint(context, point3.x, point3.y);
    CGContextAddLineToPoint(context, point1.x, point1.y);
    // 绘图
    CGContextStrokePath(context);
    
}
 */
/*
#pragma mark - **************** 绘制虚线
- (void)drawRect:(CGRect)rect {
    
    // 获取上下文（画布）
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置线条宽度
    CGContextSetLineWidth(context, 3.0);
    // 设置线条颜色
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    // lengths 指明虚线如何交替绘制
    // lengths {10, 10}表示先绘制10个点，再跳过10个点，再绘制10个点，如此反复绘制；
    // lengths {5, 10, 5}表示先绘制5个点，再跳过10个点，再绘制5个点，再跳过5个点，如此反复绘制；
    
    CGFloat lengths[] = {10, 10};
    
    // 第1个参数：上下文
    // 第2个参数：phase值，如果设值为5，则在绘制第一段的时候执行(n - 5)个点，n为虚线交替绘制方式第1个元素值。
    // 第3个参数：虚线交替绘制方式
    // 第4个参数：虚线交替绘制方式集合元素个数
    CGContextSetLineDash(context, 0, lengths, 2);
    
    // 设置虚线起点
    CGContextMoveToPoint(context, 100, 100);
    // 设置虚线终点
    CGContextAddLineToPoint(context, 300, 300);
    // 开始绘制
    CGContextStrokePath(context);
    
}
 */
/*
#pragma mark - **************** 绘制弧线  方法1
- (void)drawRect:(CGRect)rect {
    
    // 获取上下文（画布）
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置线条宽度
    CGContextSetLineWidth(context, 3.0);
    // 设置线条颜色
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    // 设置圆心
    CGPoint centerPoint = {200, 300};
    // 设置半径
    CGFloat radius = 100;
    // 设置起始角度
    CGFloat startAngle = 0;
    // 设置结束角度
    CGFloat endAngle = M_PI;
    // 设置绘制方向：1为顺时针， 0为逆时针
    int clockwise = 1;
    
    // 绘制弧线
    // 第1个参数：上下文
    // 第2个参数：圆心.x
    // 第3个参数：圆心.y
    // 第4个参数：半径
    // 第5个参数：起始角度
    // 第6个参数：结束角度
    // 第7个参数：旋转方向
    CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, startAngle, endAngle, clockwise);
    CGContextStrokePath(context);
    
}
*/
/*
#pragma mark - **************** 绘制弧线  方法2

- (void)drawRect:(CGRect)rect {
    
    // 获取上下文（画布）
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置线条宽度
    CGContextSetLineWidth(context, 3.0);
    // 设置线条颜色
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    // 通过指定2个切点，还有角度，调用CGContextAddArcToPoint()绘制。
    // 圆弧起点
    CGPoint firstPoint = {100 ,300};
    CGPoint middlePoint = {200 ,200};
    CGPoint endPoint = {300 ,300};
    
    CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
    
    CGContextAddArcToPoint(context, middlePoint.x, middlePoint.y, endPoint.x, endPoint.y, 130);
    
    CGContextStrokePath(context);
    
}
*/
/*
#pragma mark - **************** 绘制曲线
- (void)drawRect:(CGRect)rect {
    
    // 获取上下文（画布）
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置线条宽度
    CGContextSetLineWidth(context, 3.0);
    // 设置线条颜色
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    // 创建四个点
    CGPoint firstPoint = {20, 200};
    CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
    // 顶峰点
    CGPoint topPoint = {90, 40};
    // 低峰点
    CGPoint bottomPoint = {230, 360};
    // 末尾点
    CGPoint endPoint = {300, 200};
    
    // 贝兹曲线是通过一个起始点，然后通过两个控制点，还有一个终止点，调用CGContextAddCurveToPoint()函数绘制。
    CGContextAddCurveToPoint(context, topPoint.x, topPoint.y, bottomPoint.x, bottomPoint.y, endPoint.x, endPoint.y);
    CGContextStrokePath(context);
    
}
 */
/*
#pragma mark - **************** 绘制多边形
- (void)drawRect:(CGRect)rect {
    
    // 设置画笔颜色
    [[UIColor redColor] setStroke];
    
    UIBezierPath * path = [[UIBezierPath alloc]init];
    
    // 设置起点
    [path moveToPoint:CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))];
    
    // 添加点
    [path addLineToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(120, 80)];
    [path addLineToPoint:CGPointMake(150, 100)];
    
    // 封闭路径
    [path closePath];
    // 设直线条宽度
    [path setLineWidth:2];
    // 设置拐角处的效果为圆角
    [path setLineJoinStyle:kCGLineJoinRound];
    // 设置结束处的效果为圆角
    [path setLineCapStyle:kCGLineCapRound];
    // 开始绘制
    [path stroke];
    
    
    // 填充
    // 1、设置填充颜色
    [[UIColor brownColor] setFill];
    // 2、开始填充
    [path fill];
}
 */

#pragma mark - **************** 绘制弧形
- (void)drawRect:(CGRect)rect {
    
    // 设置填充颜色
    [[UIColor redColor] setFill];
    
    UIBezierPath * path = [[UIBezierPath alloc]init];
    
    // 设置圆心
    [path moveToPoint:CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))];
    
    // 画弧
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    [path addArcWithCenter:center // 圆心
                    radius:80     // 半径
                startAngle:0      // 起始角度
                  endAngle:M_PI_2 // 结束角度
                 clockwise:YES];  // 是否顺时针
    // 封闭路径
    [path closePath];
    // 填充
    [path fill];
}

@end
