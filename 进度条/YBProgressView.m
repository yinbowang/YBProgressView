//
//  YBProgressView.m
//  进度条
//
//  Created by wyb on 2017/3/11.
//  Copyright © 2017年 中天易观. All rights reserved.
//

#import "YBProgressView.h"
#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height

@interface YBProgressView ()

@property(nonatomic,strong)UILabel *centerLabel;

@end

@implementation YBProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self initData];
        
        [self loadUI];
        
        
        
    }
    return self;
}

- (void)initData
{
   self.progressWidth = 3.0;
    self.bottomCircleColor = [UIColor greenColor];
    self.topCircleColor = [UIColor redColor];
}

- (void)loadUI
{
    
    
    UILabel *centerlab = [[UILabel alloc]init];
    centerlab.frame = self.bounds;
    centerlab.textAlignment = NSTextAlignmentCenter;
    self.centerLabel = centerlab;
    [self addSubview:centerlab];
}

- (void)drawRect:(CGRect)rect{
    
   //方法一
   /*
   CGContextRef ctx =  UIGraphicsGetCurrentContext();
    //底部的圆
    CGContextAddArc(ctx, WIDTH/2.0, WIDTH/2.0, (WIDTH-self.progressWidth*2.0)/2.0, 0, M_PI*2.0, 0);
    [self.bottomCircleColor setStroke];
    CGContextSetLineWidth(ctx, self.progressWidth);
    CGContextStrokePath(ctx);
    
    
    //顶部的动圆
    CGFloat endAngle = -M_PI_2 + self.progress*(M_PI * 2);
    
    // x\y : 圆心
    // radius : 半径
    // startAngle : 开始角度
    // endAngle : 结束角度
    // clockwise : 圆弧的伸展方向(0:顺时针, 1:逆时针)
    CGContextAddArc(ctx, WIDTH/2.0, WIDTH/2.0, (WIDTH-self.progressWidth*2.0)/2.0, -M_PI_2, endAngle, 0);
    
    [self.topCircleColor setStroke];
    
    CGContextSetLineWidth(ctx, self.progressWidth);
    
    CGContextStrokePath(ctx);
    */
    
    //方法二
    //底部的圆
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIBezierPath *bottomPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(WIDTH/2.0, WIDTH/2.0) radius:(WIDTH-self.progressWidth*2.0)/2.0 startAngle:0 endAngle:M_PI*2.0 clockwise:0];
    //设置线的宽度
    CGContextSetLineWidth(ctx, self.progressWidth);
    //线条的颜色
    [self.bottomCircleColor setStroke];
    //将路径添加到上下文
    CGContextAddPath(ctx, bottomPath.CGPath);
    //渲染路径
    CGContextStrokePath(ctx);
    
    //顶部的圆
    CGFloat endAngle = -M_PI_2 + self.progress*(M_PI * 2);
    UIBezierPath *topPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(WIDTH/2.0, WIDTH/2.0) radius:(WIDTH-self.progressWidth*2.0)/2.0 startAngle:-M_PI_2 endAngle:endAngle clockwise:0];
    //设置线的宽度
    CGContextSetLineWidth(ctx, self.progressWidth);
    //线条的颜色
    [self.topCircleColor setStroke];
    //将路径添加到上下文
    CGContextAddPath(ctx, topPath.CGPath);
    //渲染路径
    CGContextStrokePath(ctx);
    
}



-  (void)setProgress:(float)progress{
    
    if (_progress != progress) {
        _progress = progress;
        
        if (progress >= 1.0 || progress < 0) {
            return;
        }
        
        self.centerLabel.text = [NSString stringWithFormat:@"%.02f%%",progress*100];
        
        [self setNeedsDisplay];
        
    }
}


@end
