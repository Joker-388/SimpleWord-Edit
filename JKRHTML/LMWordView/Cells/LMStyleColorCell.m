//
//  LMStyleColorCell.m
//  SimpleWord
//
//  Created by Chenly on 16/5/13.
//  Copyright © 2016年 Little Meaning. All rights reserved.
//

#import "LMStyleColorCell.h"
#import "LMColorPickerView.h"

@interface LMStyleColorCell () <LMColorPickerViewDataSource, LMColorPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *colorDisplayView;
@property (weak, nonatomic) IBOutlet LMColorPickerView *colorPickerView;

@end

@implementation LMStyleColorCell
{
    CAShapeLayer *_lineLayer;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!_lineLayer) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        shapeLayer.lineJoin = kCALineJoinRound;
        shapeLayer.lineDashPattern = @[@5, @2];
        shapeLayer.lineWidth = 1.f;
        _lineLayer = shapeLayer;
        [self.layer addSublayer:_lineLayer];
    }
    
    _colors = @[
                [UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1],
                [UIColor colorWithRed:102/255.f green:102/255.f blue:102/255.f alpha:1],
                [UIColor colorWithRed:243/255.f green:118/255.f blue:84/255.f alpha:1],
                [UIColor colorWithRed:255/255.f green:215/255.f blue:147/255.f alpha:1],
                [UIColor colorWithRed:15/255.f green:114/255.f blue:173/255.f alpha:1],
                ];
    
    self.colorPickerView.dataSource = self;
    self.colorPickerView.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.colorPickerView.hidden = !selected;
    _lineLayer.hidden = !selected;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if (!self.selected) {
        return;
    }
    
    CGRect layerFrame = rect;
    layerFrame.origin.x = 20.f;
    layerFrame.origin.y = 60.f;
    layerFrame.size.width -= 20.f * 2;
    layerFrame.size.height = 1.f;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0.5f)];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(layerFrame), 0.5f)];
    _lineLayer.path = path.CGPath;
    _lineLayer.frame = layerFrame;
}

- (void)setColors:(NSArray *)colors {
    _colors = [colors copy];    
    [self.colorPickerView reloadData];
}

#pragma mark - set Color

- (void)setSelectedColor:(UIColor *)selectedColor {
    if (self.colors.count == 0) {
        return;
    }
    [self.colors enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqual:selectedColor]) {
            _selectedColor = selectedColor;
            self.colorDisplayView.backgroundColor = selectedColor;
            [self.colorPickerView selectIndex:idx];
            *stop = YES;
        }
    }];
}

#pragma mark - <LMColorPickerViewDataSource, LMColorPickerViewDelegate>

- (NSInteger)lm_numberOfColorsInColorPickerView:(LMColorPickerView *)pickerView {
    return self.colors.count;
}

- (UIColor *)lm_colorPickerView:(LMColorPickerView *)pickerView colorForItemAtIndex:(NSInteger)index {
    return self.colors[index];
}

- (void)lm_colorPickerView:(LMColorPickerView *)pickerView didSelectColor:(UIColor *)color {
    self.colorDisplayView.backgroundColor = color;
    [self.delegate lm_didChangeStyleSettings:@{LMStyleSettingsTextColorName: color}];
}

@end
