//
//  YBProgressView.h
//  进度条
//
//  Created by wyb on 2017/3/11.
//  Copyright © 2017年 中天易观. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBProgressView : UIView

@property (nonatomic, assign) float progress; /**< 进度条进度 0-1*/

@property(nonatomic,assign)float progressWidth;

@property(nonatomic,strong)UIColor *bottomCircleColor;

@property(nonatomic,strong)UIColor *topCircleColor;


@end
