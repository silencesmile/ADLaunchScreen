//
//  HomeViewController.m
//  LaunchScreen
//
//  Created by youngstar on 16/4/18.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "HomeViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "SixthViewController.h"
#import "SeventhViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor yellowColor];
    NSLog(@"HomeViewController");
    
    // 显示tabbar
    //第一个
    FirstViewController *firstVC=[[FirstViewController alloc] init];
    UINavigationController *naVC1=[[UINavigationController alloc] initWithRootViewController:firstVC];
    //title
    naVC1.tabBarItem.title=@"主页";
    //image
    naVC1.tabBarItem.image=[UIImage imageNamed:@"53-house.png"];
    //badgeValue
    // naVC1.tabBarItem.badgeValue=@"New";
    //设置选中的图片
    naVC1.tabBarItem.selectedImage=[UIImage imageNamed:@"icon_home.png"];
    //第二个
    SecondViewController *secondVC=[[SecondViewController alloc] init];
    UINavigationController *naVC2=[[UINavigationController alloc] initWithRootViewController:secondVC];
    naVC2.tabBarItem.title=@"团购";
    naVC2.tabBarItem.image=[UIImage imageNamed:@"shop.png"];
    naVC2.tabBarItem.badgeValue=@"22+";
    //第三个
    ThirdViewController *thirdVC=[[ThirdViewController alloc] init];
    UINavigationController *naVC3=[[UINavigationController alloc] initWithRootViewController:thirdVC];
    naVC3.tabBarItem.title=@"发现";
    naVC3.tabBarItem.image=[UIImage imageNamed:@"12-eye.png"];
    naVC3.tabBarItem.badgeValue=@"99+";
    //第四个
    FourthViewController *fourVC=[[FourthViewController alloc] init];
    UINavigationController *naVC4=[[UINavigationController alloc] initWithRootViewController:fourVC];
    naVC4.tabBarItem.title=@"钱包";
    naVC4.tabBarItem.image=[UIImage imageNamed:@"35-shopping-bag.png"];
    //第五个
    FifthViewController *fithVC=[[FifthViewController alloc] init];
    UINavigationController *naVC5=[[UINavigationController alloc] initWithRootViewController:fithVC];
    naVC5.tabBarItem.title=@"我的收藏";
    naVC5.tabBarItem.image=[UIImage imageNamed:@"28-star.png"];
    //第六个
    SixthViewController *sixthVC=[[SixthViewController alloc] init];
    UINavigationController *naVC6=[[UINavigationController alloc] initWithRootViewController:sixthVC];
    naVC6.tabBarItem.title=@"工具箱";
    naVC6.tabBarItem.image=[UIImage imageNamed:@"36-toolbox.png"];
    
    //第七个
    SeventhViewController *seventhVC=[[SeventhViewController alloc] init];
    UINavigationController *naVC7=[[UINavigationController alloc] initWithRootViewController:seventhVC];
    naVC7.tabBarItem.title=@"设置";
    naVC7.tabBarItem.image=[UIImage imageNamed:@"20-gear2.png"];
    
    self.viewControllers=@[naVC1,naVC2,naVC3,naVC4,naVC5,naVC6,naVC7];
    
    self.selectedIndex = 3;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
