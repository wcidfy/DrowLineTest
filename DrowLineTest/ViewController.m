//
//  ViewController.m
//  DrowLineTest
//
//  Created by 李响响 on 2018/6/25.
//  Copyright © 2018年 李响响. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"
#import "DrawingView.h"


#define kWidth [UIScreen mainScreen].bounds.size.width
#define kSize [UIScreen mainScreen].bounds.size
@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property(nonatomic,strong)DrawingView *drawView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    TestView *view=[TestView new];
//    view.frame=CGRectMake(0, 100, self.view.bounds.size.width, 500);
//    view.backgroundColor=[UIColor whiteColor];
//    [self.view addSubview:view];
    _drawView=[DrawingView new];
    _drawView.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
//    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview: _drawView];
    
    
    [_drawView.clearButton addTarget:self action:@selector(clearButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_drawView.undoButton addTarget:self action:@selector(undoButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_drawView.saveButton addTarget:self action:@selector(saveImage) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - **************** 点击清空按钮
-(void)clearButtonClick
{
    [_drawView.lines removeAllObjects];
    _drawView.backgroundColor=[UIColor whiteColor];
    [_drawView setNeedsDisplay];
}
#pragma mark - **************** 店家撤销按钮  
-(void)undoButtonClick
{
    
    [_drawView.lines removeLastObject];
    [_drawView setNeedsDisplay];
}
#pragma mark - **************** 点击保存按钮
-(void)saveImage
{
    _drawView.clearButton.hidden=YES;
    _drawView.saveButton.hidden=YES;
    _drawView.undoButton.hidden=YES;
    
#pragma mark - **************** 1.在 Block 内如果需要访问 self 的方法、变量，建议使用 weakSelf。   2.如果在 Block 内需要多次 访问 self，则需要使用 strongSelf。
    __weak __typeof__(self) weakSelf = self;
    __strong __typeof(self) strongSelf = weakSelf;
    [self makeScreenShotCompletion:^(UIImage *image) {
        NSLog(@"1");
   
       strongSelf.drawView.clearButton.hidden=NO;
        strongSelf.drawView.saveButton.hidden=NO;
        strongSelf.drawView.undoButton.hidden=NO;
    
        
        [strongSelf.drawView.lines removeAllObjects];
        [strongSelf.drawView setNeedsDisplay];
    }];
    
}
#pragma mark - **************** 保存并存到本地相册
-(void)makeScreenShotCompletion:(void(^)(UIImage * image))completion{
    //开启上下文  <span style="font-family: Arial, Helvetica, sans-serif;">设置截屏大小</span>
    CGSize sizeC=CGSizeMake(kWidth, kSize.height);
    UIGraphicsBeginImageContext(sizeC);
    
    
    [_drawView.layer renderInContext:UIGraphicsGetCurrentContext()];
    //获取图片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    completion(image);
    
    /**
     *  将图片保存到本地相册
     */
    UIImageWriteToSavedPhotosAlbum(image, self , @selector(image:didFinishSavingWithError:contextInfo:), nil);//保存图片到照片库
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    if (error == nil) {
        

        
        
        UIAlertController *aleart=[UIAlertController alertControllerWithTitle:@"提示" message:@"已存入手机相册" preferredStyle:UIAlertControllerStyleAlert];
         __strong __typeof(self) strongSelf = self;
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (!strongSelf.drawView.photoManager)
            {
                strongSelf.drawView.photoManager =[[SelectPhotoManager alloc]init];
            }
            [strongSelf.drawView.photoManager startSelectPhotoWithImageName:@"选择头像"];
          
            //选取照片成功
            self.drawView.photoManager.successHandle=^(SelectPhotoManager *manager,UIImage *image)
            {
                
//                mySelf.headImage.image=image;
                //保存到本地
                NSData *data = UIImagePNGRepresentation(image);
                if(data==nil)
                {
                    return ;
                }
                [strongSelf.drawView.lines removeAllObjects];
                [strongSelf.drawView setNeedsDisplay];
                
               
                
                UIImage *backImage =image;
                strongSelf.view.layer.contents=(id)backImage.CGImage;
                
                 strongSelf.view.layer.backgroundColor = [UIColor clearColor].CGColor;
                [backImage resizableImageWithCapInsets:UIEdgeInsetsMake(25, 25, 25, 25) resizingMode:UIImageResizingModeTile];
                
                 strongSelf.drawView.backgroundColor=[UIColor colorWithPatternImage:backImage];
            };
            
        }];
        
        [okAction setValue:[UIColor orangeColor] forKey:@"titleTextColor"];
        [aleart addAction:okAction];
        [self presentViewController:aleart animated:YES completion:nil];
        
        
        
        
        
        
    }else{

        
        
        
        
        UIAlertController *aleart=[UIAlertController alertControllerWithTitle:@"提示" message:@"保存失败" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [okAction setValue:[UIColor orangeColor] forKey:@"titleTextColor"];
        [aleart addAction:okAction];
        [self presentViewController:aleart animated:YES completion:nil];
    }
    
}


@end
