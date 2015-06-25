//
//  ViewController.m
//  TagCollectionView
//
//  Created by snackbaby on 15/6/23.
//  Copyright (c) 2015年 snackbaby. All rights reserved.
//

#import "ViewController.h"
#import "GroupTagsCollectionViewCell.h"
#import "ERJustifiedFlowLayout.h"
#import "UICollectionViewRightAlignedLayout.h"
#import "TagsView.h"

@interface ViewController ()
{

    NSMutableArray *tagsArray;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tagsArray = [NSMutableArray array];
    [tagsArray addObject:@"管理"];
//    [tagsArray addObject:@"VIP收费用户、"];
//    [tagsArray addObject:@"重要用户、"];
//    [tagsArray addObject:@"hehe、"];
//    [tagsArray addObject:@"made、"];
//    [tagsArray addObject:@"管理、"];
//    [tagsArray addObject:@"V、"];
//    [tagsArray addObject:@"重要用户、"];
//    [tagsArray addObject:@"hehe、"];
//    [tagsArray addObject:@"made、"];
//    [tagsArray addObject:@"管理、"];
//    [tagsArray addObject:@"VIP收费用户、"];
//    [tagsArray addObject:@"重要用户、"];
//    [tagsArray addObject:@"hehe、"];
//    [tagsArray addObject:@"made、"];
//    [tagsArray addObject:@"管理、"];
//    [tagsArray addObject:@"VIP收费用户、"];
//    [tagsArray addObject:@"重要用户重要用户重要用户重要用户重要用户重要用户重要用户重要用户重要用户重要用户重要用户重要用户重要用户重要用户重要用户、"];
//    [tagsArray addObject:@"hehe、"];
//    [tagsArray addObject:@"mademademademademademademademademademademademademademade"];
//    [tagsArray addObject:@"管理管理管理管理、"];
//    [tagsArray addObject:@"管理管理管理管理收费用户、"];
//    [tagsArray addObject:@"重要用户、"];
//    [tagsArray addObject:@"hehe、"];
//    [tagsArray addObject:@"made、"];
//    [tagsArray addObject:@"管理、"];
//    [tagsArray addObject:@"VIP收费用户、"];
//    [tagsArray addObject:@"重要用户、"];
//    [tagsArray addObject:@"hehe、"];
//    [tagsArray addObject:@"made、"];
//    [tagsArray addObject:@"管理、"];
//    [tagsArray addObject:@"VIP收费用户、"];
//    [tagsArray addObject:@"重要用户、"];
//    [tagsArray addObject:@"hehe、"];
//    [tagsArray addObject:@"made、"];
//    [tagsArray addObject:@"管理、"];
//    [tagsArray addObject:@"VIP收费用户、"];

    

    TagsView *view = [[TagsView alloc] initWithTagStrings:tagsArray FrameWidth:self.view.frame.size.width - 100 RowHeight:15];
    [self.view addSubview:view];
    

    CGRect frame = view.frame;
    frame.origin.y = 160;
    view.frame = frame;
    view.backgroundColor = [UIColor redColor];
    
//    [tagsArray addObject:@"管理管理管理管理收费用户、"];
    
    [view reloadViewWithTagsArray:tagsArray];


    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







@end
