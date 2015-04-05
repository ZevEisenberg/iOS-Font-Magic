//
//  ViewController.m
//  iOS Font Magic
//
//  Created by Zev Eisenberg on 4/5/15.
//  Copyright (c) 2015 Zev Eisenberg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// Titles

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *titleLabels;

// Tracking

@property (weak, nonatomic) IBOutlet UILabel *trackingLabelTight;
@property (weak, nonatomic) IBOutlet UILabel *trackingLabelDefault;
@property (weak, nonatomic) IBOutlet UILabel *trackingLabelWide;

// Figure Style

@property (weak, nonatomic) IBOutlet UILabel *figureStyleLabelProportionalLining;
@property (weak, nonatomic) IBOutlet UILabel *figureStyleLabelProportionalOldstyle;
@property (weak, nonatomic) IBOutlet UILabel *figureStyleLabelTabularLining;
@property (weak, nonatomic) IBOutlet UILabel *figureStyleLabelTabularOldstyle;

// Baseline & Cap Height

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *capHeightNumberLabels;

@property (weak, nonatomic) IBOutlet UILabel *capHeightLabelAlignedToTop1;
@property (weak, nonatomic) IBOutlet UILabel *capHeightLabelAlignedToBottom;
@property (weak, nonatomic) IBOutlet UILabel *capHeightLabelAlignedToTop2;
@property (weak, nonatomic) IBOutlet UILabel *capHeightLabelAlignedToBaseline1;
@property (weak, nonatomic) IBOutlet UILabel *capHeightLabelAlignedToCapTops;
@property (weak, nonatomic) IBOutlet UILabel *capHeightLabelAlignedToBaseline2;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *numberCapHeightConstraint;

@end

@implementation ViewController

- (void)awakeFromNib
{
    [self configureTitleLabels];
    [self configureTrackingLabels];
    [self configureFigureStyleLabels];
    [self configureBaselineAndCapHeightLabels];
}

- (void)configureTitleLabels
{

}

- (void)configureTrackingLabels
{

}

- (void)configureFigureStyleLabels
{

}

- (void)configureBaselineAndCapHeightLabels
{

}

@end
