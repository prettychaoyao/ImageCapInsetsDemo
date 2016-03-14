//
//  ViewController.m
//  ImageCapInsetsDemo
//
//  Created by Jobs on 16/3/9.
//  Copyright © 2016年 Jobs. All rights reserved.
//


/*
- (UIImage *)resizableImageWithCapInsets:(UIEdgeInsets)capInsets  resizingMode:(UIImageResizingMode)resizingMode
// 该方法返回的是UIImage类型的对象,即返回经该方法拉伸后的图像
// 传入的第一个参数capInsets是UIEdgeInsets类型的数据,即原始图像要被保护的区域
// 这个参数是一个结构体,定义如下
// typedef struct { CGFloat top, left , bottom, right ; }
// UIEdgeInsets:该参数的意思是被保护的区域到原始图像外轮廓的上部,左部,底部,右部的直线距离
// 传入的第二个参数resizingMode是UIImageResizingMode类似的数据,即图像拉伸时选用的拉伸模式
// 这个参数是一个枚举类型,有以下两种方式
// UIImageResizingModeTile,     平铺
// UIImageResizingModeStretch,  拉伸

*/


#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewLeft;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewRight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //--原始图片
    //imageView大小为60 * 128    图片尺寸为60 * 128
    UIImage *testImage1 = [UIImage imageNamed:@"test_image"];
    testImage1 = [testImage1 resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
    
    //_imageViewLeft
    //imageView为180 * 384
    UIImage *testImage2 = [UIImage imageNamed:@"test_image"];
    UIEdgeInsets edgeInset;
    
    //方法1 resizableImageWithCapInsets:默认是平铺
//    edgeInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //平铺的概念是保证原图像大小不变,将新图像填充满
    
    //将上部的三分之一"保护",然后进行显示
//    edgeInset = UIEdgeInsetsMake(42, 0, 0, 0);
    //这代表新图像中,上部的三分之一和原图像一样,而其余部分的填充不会使用原图像上部的三分之一
    
    //将左部的三分之一"保护",然后进行显示
    edgeInset = UIEdgeInsetsMake(0,50, 0, 10);
    //这代表新图像中,上部的三分之一和原图像一样,而其余部分的填充不会使用原图像上部的三分之一
    
    //将四周进行保护后
//    edgeInset = UIEdgeInsetsMake(42, 20, 42, 20);
    //在X轴上,由于1被左边的设置保护,3被右边的设置保护,所以中间只能用2来平铺,同理,7和9之间的8
    //在Y轴上,由于1被上边的设置保护,7被下边的设置保护,所以中间只能用4来平铺,同理,3和9之间的6
    //由于5没有被保护,所以在整个空间中,用5进行平铺来填充剩余的区域

    testImage2 = [testImage2 resizableImageWithCapInsets:edgeInset resizingMode:UIImageResizingModeTile];
    
    
    //  UIImageResizingModeStretch,  拉伸
//    edgeInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //  拉伸的概念是直接按比例将图片放大到与相框尺寸相同的图像,
    
    //将上部的三分之一"保护",然后进行显示
//    edgeInset = UIEdgeInsetsMake(42, 0, 0, 0);
    //保证原图像上部的三分之一在Y轴上不被拉伸,其余部分按剩余比例拉伸
    
    //将左部的三分之一"保护",然后进行显示
//    edgeInset = UIEdgeInsetsMake(0,20, 0, 0);
    //保证原图像左部的三分之一在Y轴上不被拉伸,其余部分按剩余比例拉伸
    
    //将四周进行保护后
//    edgeInset = UIEdgeInsetsMake(42, 20, 42, 20);
    //在X轴上,由于1被左边的设置保护,3被右边的设置保护,所以中间只能用2来拉伸,同理,7和9之间的8
    //在Y轴上,由于1被上边的设置保护,7被下边的设置保护,所以中间只能用4来拉伸,同理,3和9之间的6
    //由于5没有被保护,所以在整个空间中,用5进行拉伸来填充剩余的区域
    
//    testImage2 = [testImage2 resizableImageWithCapInsets:edgeInset resizingMode:UIImageResizingModeStretch];
    
    //将图片添加到相框
    _imageViewLeft.image = testImage2;
    
    
    
    //_imageViewRight的相关
    UIImage *testImage3 = [UIImage imageNamed:@"test_image"];
//    testImage3 = [testImage3 resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeTile];
    testImage3 = [testImage3 resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
    
    _imageViewRight.image = testImage3;
    
}

@end
