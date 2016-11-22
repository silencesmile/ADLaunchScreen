//
//  TableViewController.m
//  LaunchScreen
//
//  Created by youngstar on 16/4/18.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "TableViewController.h"
#import "BBLaunchAdMonitor.h"
#import "AFURLSessionManager.h"
#import "AppDelegate.h"
#import "ChildGestureRecognizer.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //这一步是获取LaunchScreen.storyboard里的UIViewController,UIViewController 的identifer是LaunchScreen
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LaunchScreen"];
    UIView *launchView = viewController.view;
    UIImageView  * Imageview= [[UIImageView  alloc]initWithFrame:[UIScreen mainScreen].bounds];
    Imageview.userInteractionEnabled = YES;
    
    ChildGestureRecognizer *recommendProTap = [[ChildGestureRecognizer alloc]initWithTarget:self action:@selector(trumpeAction:)];
//    recommendProTap.TrumpetModel = model;
    recommendProTap.numberOfTapsRequired = 1;
    recommendProTap.numberOfTouchesRequired = 1;
    [Imageview addGestureRecognizer:recommendProTap];

    [launchView addSubview:Imageview];
    [self.view addSubview:launchView];
    
    
    
    //这一步是获取上次网络请求下来的图片，如果存在就展示该图片，如果不存在就展示本地保存的名为test的图片
    NSMutableData * data = [[NSUserDefaults standardUserDefaults]objectForKey:@"imageu"];
    if (data.length>0) {
        Imageview.image = [UIImage imageWithData:data];
    }else{
        
        Imageview.image = [UIImage imageNamed:@"Test"];
    }
    
    
    //下面这段代码，是调用AFN下载文件的方法，异步
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL *URL = [NSURL URLWithString:@"http://s16.sinaimg.cn/large/005vePOgzy70Rd3a9pJdf&690"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
        NSLog(@"error:%@", error);
        
        NSData * image = [NSData dataWithContentsOfURL:filePath];
        [[NSUserDefaults standardUserDefaults]setObject:image forKey:@"imageu"];
        
        
    }];
    [downloadTask resume];
    
    
    
    //这段代码，可以实现第二张图片有3D的动画效果，动画结束后，进行同步的网络请求，请求的是广告页图片
    [UIView animateWithDuration:6.0f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        
        
        launchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.5f, 1.5f, 1.0f);
    } completion:^(BOOL finished) {
        [launchView removeFromSuperview];
//        
        NSString * ad_imgUrl  = @"http://www.uimaker.com/uploads/allimg/121217/1_121217093327_1.jpg";
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [BBLaunchAdMonitor showAdAtPath:ad_imgUrl
                                 onView:appDelegate.window.rootViewController.view
                           timeInterval:5
                       detailParameters:@{@"carId":@(12345), @"name":@"奥迪-品质生活"}];
        [launchView removeFromSuperview];
        
        
        
    }];
  }

- (void)trumpeAction:(UIGestureRecognizer *)gestureRecognizer{
    
    NSLog(@"广告位。。。。。。。。。。。。");
}

@end
