//
//  FontMetrics.swift
//  AppCore
//
//  Created by MENG, Joel on 10/7/18.
//  Copyright © 2018 MENG, Joel. All rights reserved.
//

import UIKit

/**
 A struct that behaves in a similar manner to iOS11's `UIFontMetrics`. Rather then try to accommodate using `UIFontMetrics` if iOS 11
 and trying to duplicate the behavioru if iOS 10 - a standard behaviour was implemented.
*/

/// A struct that facilitates the sizing rules for a `UIFont` and can return the ideal font point size for a given `UIContentSizeCategory`
public struct FontMetrics {
    /// The default font point size. This is equal to the `UIContentSizeCategory.large`
    let baseSize: CGFloat

    /// The minimum point size the font can be regardless of the scale applied.
    let minimumPointSize: CGFloat

    /// The maximum point size the font can be regardless of the scale applied.
    let maximumPointSize: CGFloat?

    /// The maximum font scale that can be applied. Default is web `AA` compliant 200%.
    let maximumFontScale: CGFloat

    /// Bool whether to round to the nearest value for point sizes. Default is true
    let shouldRoundSizes: Bool

    /// Will initialize a new instance for the given text style
    ///
    /// - Parameters:
    ///   - baseSize: The base point size when rendering for the content size category `.large`
    ///   - minimumPointSize: The minimum point size the font can be regardless of the scale applied.
    ///   - maximumPointSize: The maximum point size the font can be regardless of the scale applied.
    ///   - maximumFontScale: The maximum font scale that can be applied
    public init(baseSize: CGFloat,
                minimumPointSize: CGFloat = 12,
                maximumPointSize: CGFloat? = nil,
                maximumFontScale: CGFloat = 200) {
        self.baseSize = baseSize
        self.minimumPointSize = minimumPointSize
        self.maximumPointSize = maximumPointSize
        self.maximumFontScale = maximumFontScale
        shouldRoundSizes = true
    }

    // swiftlint:disable cyclomatic_complexity
    /// Will return the ideal font point size for the given category
    ///
    /// - Parameter category: The category being rendered for
    /// - Returns: CGFloat
    public func fontPointSize(forCategory category: UIContentSizeCategory) -> CGFloat {
        var scaleFactor: CGFloat = 1
        switch category {
        case .extraSmall:
            scaleFactor -= (3 * decreaseStepDelta)
        case .small:
            scaleFactor -= (2 * decreaseStepDelta)
        case .medium:
            scaleFactor -= decreaseStepDelta
        case .extraLarge:
            scaleFactor += (increaseStepDelta / 2)
        case .extraExtraLarge:
            scaleFactor += increaseStepDelta
        case .extraExtraExtraLarge:
            scaleFactor += (2 * increaseStepDelta)
        case .accessibilityMedium:
            scaleFactor += (2.5 * increaseStepDelta)
        case .accessibilityLarge:
            scaleFactor += (3 * increaseStepDelta)
        case .accessibilityExtraLarge:
            scaleFactor += (4 * increaseStepDelta)
        case .accessibilityExtraExtraLarge:
            scaleFactor += (5 * increaseStepDelta)
        case .accessibilityExtraExtraExtraLarge:
            scaleFactor += (6 * increaseStepDelta)
        default:
            scaleFactor = 1
        }
        var idealSize: CGFloat = baseSize * scaleFactor
        if shouldRoundSizes {
            idealSize = scaleFactor > 1 ? floor(idealSize) : ceil(idealSize)
        }
        if let maximumPointSize = maximumPointSize {
            idealSize = min(idealSize, maximumPointSize)
        }
        return max(minimumPointSize, idealSize)
    }

    // swiftlint:enable cyclomatic_complexity

    // MARK: - Private helpers

    private var increaseStepDelta: CGFloat {
        guard let maximumPointSize = maximumPointSize else {
            return ((maximumFontScale - 100) / 6) / 100
        }
        let calculatedMaximumFontScale = (maximumPointSize / minimumPointSize) * 100
        return ((calculatedMaximumFontScale - 100) / 6) / 100
    }

    private var decreaseStepDelta: CGFloat {
        return 0.1
    }
}
