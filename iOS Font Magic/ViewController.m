//
//  ViewController.m
//  iOS Font Magic
//
//  Created by Zev Eisenberg on 4/5/15.
//  Copyright (c) 2015 Zev Eisenberg. All rights reserved.
//

#import "ViewController.h"

// Font Names

static NSString* const kRalewayThin = @"Raleway-Thin";
static NSString* const kRalewayLight = @"Raleway-Light";
static NSString* const kRalewayExtraBold = @"Raleway-ExtraBold";
static NSString* const kRalewayBold = @"Raleway-Bold";
static NSString* const kRalewayRegular = @"Raleway";
static NSString* const kRalewaySemiBold = @"Raleway-SemiBold";
static NSString* const kRalewayHeavy = @"Raleway-Heavy";
static NSString* const kRalewayMedium = @"Raleway-Medium";
static NSString* const kRalewayExtraLight = @"Raleway-ExtraLight";

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self configureTitleLabels];
    [self configureTrackingLabels];
    [self configureFigureStyleLabels];
    [self configureBaselineAndCapHeightLabels];
}

- (void)configureTitleLabels
{
    for ( UILabel *titleLabel in self.titleLabels ) {
        titleLabel.font = [self.class sectionHeaderFont];
    }
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

// Fonts

+ (UIFont *)sectionHeaderFont
{
    return [UIFont fontWithName:kRalewayExtraLight size:24.0f];
}

@end
