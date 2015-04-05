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
    NSString *trackingTextTight = self.trackingLabelTight.text;
    NSString *trackingTextDefault = self.trackingLabelDefault.text;
    NSString *trackingTextWide = self.trackingLabelWide.text;

    // Tracking of 0 = no tracking
    // Tracking of 1000 = 1 em wider tracking
    // Tracking of -1000 = 1 em tighter tracking
    NSDictionary *attributesTight = [self.class fontDictionaryWithFontNamed:kRalewayRegular
                                                                       size:18.0f
                                                                   tracking:-80.0f];

    NSDictionary *attributesDefault = [self.class fontDictionaryWithFontNamed:kRalewayRegular
                                                                         size:18.0f
                                                                     tracking:0.0f];

    NSDictionary *attributesWide = [self.class fontDictionaryWithFontNamed:kRalewayRegular
                                                                      size:18.0f
                                                                  tracking:250.0f];

    NSAttributedString *stringTight = [[NSAttributedString alloc] initWithString:trackingTextTight
                                                                      attributes:attributesTight];

    NSAttributedString *stringDefault = [[NSAttributedString alloc] initWithString:trackingTextDefault
                                                                        attributes:attributesDefault];

    NSAttributedString *stringWide = [[NSAttributedString alloc] initWithString:trackingTextWide
                                                                     attributes:attributesWide];

    self.trackingLabelTight.attributedText = stringTight;
    self.trackingLabelDefault.attributedText = stringDefault;
    self.trackingLabelWide.attributedText = stringWide;
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

+ (NSDictionary *)fontDictionaryWithFontNamed:(NSString *)fontName size:(CGFloat)size tracking:(CGFloat)tracking
{
    NSParameterAssert(fontName != nil);
    NSParameterAssert(fontName.length > 0);

    UIFont *font = [UIFont fontWithName:fontName size:size];

    NSAssert(font != nil, @"Font name must result in a valid font.");

    // Formula for converting Adobe Illustrator/Photoshop Tracking values to a value that’s compatible with NSKernAttributeName.
    // Adobe software measures tracking in thousandths of an em, where an em is the width of a capital letter M.
    // NSAttributedString treats the point size of the font as 1 em.
    CGFloat convertedTracking = font.pointSize * (tracking / 1000.0f);

    NSDictionary *attributes = nil;
    if ( font ) { // guard against nil font in dictionary
        attributes = @{
                       NSFontAttributeName: font,
                       NSKernAttributeName: @(convertedTracking),
                       };
    }
    return attributes;
}

@end
