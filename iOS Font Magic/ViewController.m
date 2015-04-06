//
//  ViewController.m
//  iOS Font Magic
//
//  Created by Zev Eisenberg on 4/5/15.
//  Copyright (c) 2015 Zev Eisenberg. All rights reserved.
//

#import "ViewController.h"

@import CoreText.SFNTLayoutTypes;

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

static NSString* const kHelveticaNeueRegular = @"HelveticaNeue";

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

// Baseline & Cap Height

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *capHeightNumberLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *capHeightOtherLabels;

@property (weak, nonatomic) IBOutlet UILabel *capHeightLabelAlignedToCapTops;

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

    // Tight tracking: letters close together
    self.trackingLabelTight.attributedText = stringTight;

    // Default Tracking
    self.trackingLabelDefault.attributedText = stringDefault;

    // Wide (or Loose) Tracking: letters far apart
    self.trackingLabelWide.attributedText = stringWide;
}

- (void)configureFigureStyleLabels
{
    // Proportional: numbers are different widths
    // Lining: numbers are “uppercase” (all the same height, sitting on the baseline)
    self.figureStyleLabelProportionalLining.font = [self.class fontWithName:kRalewayRegular
                                                                       size:18.0f
                                                                 numberCase:kUpperCaseNumbersSelector
                                                              numberSpacing:kProportionalNumbersSelector];

    // Proportional: numbers are different widths
    // Oldstyle: numbers are “lowercase” (different heights, some descend below the baseline)
    self.figureStyleLabelProportionalOldstyle.font = [self.class fontWithName:kRalewayRegular
                                                                         size:18.0f
                                                                   numberCase:kLowerCaseNumbersSelector
                                                                numberSpacing:kProportionalNumbersSelector];


    // Using Helvetica Neue here, because it has tabular figures and Raleway does not.
    // Tabular: numbers are all the same width, so they line up vertically in columns
    // Lining: numbers are “uppercase” (all the same height, sitting on the baseline)
    self.figureStyleLabelTabularLining.font = [self.class fontWithName:kHelveticaNeueRegular
                                                                  size:18.0f
                                                            numberCase:kUpperCaseNumbersSelector
                                                         numberSpacing:kMonospacedNumbersSelector];

}

- (void)configureBaselineAndCapHeightLabels
{
    for ( UILabel *label in self.capHeightNumberLabels ) {
        label.font = [self.class fontWithName:kRalewayBold
                                         size:80.0f
                                   numberCase:kLowerCaseNumbersSelector
                                numberSpacing:kProportionalNumbersSelector];
    }

    for ( UILabel *label in self.capHeightOtherLabels ) {
        label.font = [UIFont fontWithName:kRalewayRegular size:18.0f];
    }
}

// Fonts

+ (UIFont *)sectionHeaderFont
{
    return [UIFont fontWithName:kRalewayHeavy size:24.0f];
}

/**
 *  Generated an attributes dictionary for an @c NSAttributedString that specifies a font, size, and tracking.
 *
 *  @param fontName The name of the font. The same as what you would pass to -[UIFont fontWithName:size:].
 *  @param size     The font size, in points. Must be greater than 0.0.
 *  @param tracking The amount of tracking, in thousandths of an em. This is to ease translation from the tracking measurement from Adobe apps.
 *
 *  @return A dictionary to be used as attributes in an @c NSAttributedString.
 */
+ (NSDictionary *)fontDictionaryWithFontNamed:(NSString *)fontName size:(CGFloat)size tracking:(CGFloat)tracking
{
    NSParameterAssert(fontName != nil);
    NSParameterAssert(fontName.length > 0);

    NSParameterAssert(size > 0.0f);

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

/**
 *  Equivalent to +[UIFont fontWithName:size:], but with the ability to specify the number case and spacing
 *
 *  @param name          The name of the font. The same as what you would pass to -[UIFont fontWithName:size:].
 *  @param size          The font size, in points. Must be greater than 0.0.
 *  @param numberCase    The number case type. One of the k*CaseNumbersSelector constants from @c SFNTLayoutTypes.h.
 *  @param numberSpacing The number spacing type. One of the k*NumbersSelector constants from @c SFNTLayoutTypes.h.
 *
 *  @return A @c UIFont instance with the specified number case and spacing, if it is supported with this font.
 */
+ (UIFont *)fontWithName:(NSString *)name size:(CGFloat)size numberCase:(int)numberCase numberSpacing:(int)numberSpacing
{
    NSParameterAssert(name);
    NSParameterAssert(name.length > 0);
    NSParameterAssert(size > 0.0f);

    NSParameterAssert(numberCase == kUpperCaseNumbersSelector
                      || numberCase == kLowerCaseNumbersSelector);

    NSParameterAssert(numberSpacing == kMonospacedNumbersSelector
                      || numberSpacing == kProportionalNumbersSelector
                      || numberSpacing == kThirdWidthNumbersSelector
                      || numberSpacing == kQuarterWidthNumbersSelector);

    // To use the values in this dictionary, you must
    // @import CoreText.SFNTLayoutTypes;
    NSDictionary *numberCaseDictionary = @{
                                           UIFontFeatureTypeIdentifierKey: @(kNumberCaseType),
                                           UIFontFeatureSelectorIdentifierKey: @(numberCase),
                                           };

    NSDictionary *numberSpacingDictionary = @{
                                              UIFontFeatureTypeIdentifierKey: @(kNumberSpacingType),
                                              UIFontFeatureSelectorIdentifierKey: @(numberSpacing),
                                              };

    NSDictionary *attributes = @{
                                 UIFontDescriptorNameAttribute: name,
                                 UIFontDescriptorFeatureSettingsAttribute: @[ numberCaseDictionary, numberSpacingDictionary ],
                                 };

    UIFontDescriptor *descriptor = [UIFontDescriptor fontDescriptorWithFontAttributes:attributes];
    UIFont *font = [UIFont fontWithDescriptor:descriptor size:size];
    return font;
}

@end
