//
//  TagsView.m
//  TagCollectionView
//
//  Created by snackbaby on 15/6/24.
//  Copyright (c) 2015年 snackbaby. All rights reserved.
//

#import "TagsView.h"

@implementation TagsView
{
    UICollectionView *_collectionView;
    NSArray *_tagsArray;
    NSMutableArray *_tagWidthsArray;
    CGFloat _rowHeight;
    CGFloat _frameWidth;
    NSMutableArray *_totalRowTagsArray;
    
}
- (instancetype)initWithTagStrings:(NSArray *)tagsArray FrameWidth:(CGFloat)frameWidth RowHeight:(CGFloat)rowHeight
{
    self = [super init];
    if (self) {
        _totalRowTagsArray = [NSMutableArray new];
        _tagWidthsArray = [NSMutableArray new];
        _rowHeight = rowHeight;
        _frameWidth = frameWidth;
        [self reloadViewWithTagsArray:tagsArray];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)reloadViewWithTagsArray:(NSArray *)tagsArray
{
    _tagsArray = tagsArray;
    int row = [self totalRowOfTags];
    self.frame = CGRectMake(0, self.frame.origin.y, _frameWidth, row * _rowHeight);

    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)obj;
            [view removeFromSuperview];
        }
    }];
    for (NSArray *array in _totalRowTagsArray) {
        UILabel *lastLabel = array.lastObject;
        NSString *string = lastLabel.text;
        string = [string substringToIndex:string.length - 1];
        lastLabel.text = string;
        CGRect lastLabelFrame = lastLabel.frame;
        CGFloat rightInterVal = _frameWidth - lastLabelFrame.origin.x - lastLabelFrame.size.width;
        for (UILabel *label in array) {
            CGRect frame = label.frame;
            frame.origin.x += rightInterVal;
            label.frame = frame;
            [self addSubview:label];
        }
    }
}

- (int)totalRowOfTags
{
    [_tagWidthsArray removeAllObjects];
    [_totalRowTagsArray removeAllObjects];
    int row = 1;
    NSInteger totalWidthOfRow = 0;
    NSInteger totalX = 0;
    NSInteger totalY = 0;
    NSMutableArray *rowArray = [NSMutableArray new];
    [_totalRowTagsArray addObject:rowArray];
    for (NSInteger i = 0; i < _tagsArray.count; i++) {
        NSString *string = _tagsArray[i];
        NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14], NSFontAttributeName,nil];
        CGRect size = [string boundingRectWithSize:CGSizeMake(320, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:attributesDictionary context:nil];
        
        int tempWidth = ceil(size.size.width);
        if (_frameWidth < tempWidth) {
            tempWidth = _frameWidth;
        }
        [_tagWidthsArray addObject:@(tempWidth)];
        totalWidthOfRow += tempWidth;
        if (totalWidthOfRow >= _frameWidth) {
            totalWidthOfRow = tempWidth;
            totalX = tempWidth;
            totalY = row * _rowHeight;
            row++;
            rowArray = [NSMutableArray new];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, totalY, tempWidth, _rowHeight)];
            label.text = string;
            label.font = [UIFont systemFontOfSize:14];
            [rowArray addObject:label];
            [_totalRowTagsArray addObject:rowArray];
        }else {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(totalX, totalY, tempWidth, _rowHeight)];
            label.text = string;
            label.font = [UIFont systemFontOfSize:14];
            [rowArray addObject:label];
            totalX += tempWidth;
        }
    }
    return row;
}

@end
