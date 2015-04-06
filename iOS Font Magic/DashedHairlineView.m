//
//  DashedHairlineView.m
//  iOS Font Magic
//
//  Created by Zev Eisenberg on 4/5/15.
//  Copyright (c) 2015 Zev Eisenberg. All rights reserved.
//

#import "DashedHairlineView.h"

@implementation DashedHairlineView

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    const CGFloat dash[2] = { 5.0f, 5.0f }; // pattern 6 times “solid”, 5 times “empty”
    CGContextSetLineDash(ctx, 0, dash, 2);

    CGContextSetLineWidth(ctx, CGRectGetHeight(self.bounds));
    CGContextMoveToPoint(ctx, 0.0f, CGRectGetHeight(self.bounds) / 2.0f);
    CGContextAddLineToPoint(ctx, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) / 2.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokePath(ctx);
}

@end
