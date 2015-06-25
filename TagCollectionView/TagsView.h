//
//  TagsView.h
//  TagCollectionView
//
//  Created by snackbaby on 15/6/24.
//  Copyright (c) 2015年 snackbaby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagsView : UIView
- (instancetype)initWithTagStrings:(NSArray *)tagsArray FrameWidth:(CGFloat)frameWidth RowHeight:(CGFloat)rowHeight;
- (void)reloadViewWithTagsArray:(NSArray *)tagsArray;

@end
