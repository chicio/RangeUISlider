# Change Log
All changes to RangeUISlider will be documented in this file.

## [3.0.1](https://github.com/chicio/RangeUISlider/releases/tag/3.0.1)
Release date: 2021-10-06.

#### Added
- Xcode 13 support

## [3.0.0](https://github.com/chicio/RangeUISlider/releases/tag/3.0.0)
Release date: 2021-03-04.

#### Added
- new public api to read all the UI components of RangeUISlider
- new knobs label UI components

## [2.0.2](https://github.com/chicio/RangeUISlider/releases/tag/2.0.2)
Release date: 2021-02-17.

#### Fixed
- `defaultValueLeftKnob` and `defaultValueRightKnob` now are settedn when changed programmatically

## [2.0.1](https://github.com/chicio/RangeUISlider/releases/tag/2.0.1)
Release date: 2021-02-10.

#### Fixed
- `rangeNotSelectedColor` was not working. Added guard on gradient colors to avoid the creation of useless layers.

## [2.0.0](https://github.com/chicio/RangeUISlider/releases/tag/2.0.0)
Release date: 2021-02-03.

#### Added
- SwiftUI support: new `RangeSlider` SwiftUI component
- Unit test + UI Tests: safer refactoring.
- Test plans: UI test for multiple devide configuration (e.g. test RTL) 
- Added SwiftLint: introduced code style standards.
- Added Codebeat: start to measure code quality
- Refactoring to improve internal structure (code quality and ability to introduct new features)

## [1.13.0](https://github.com/chicio/RangeUISlider/releases/tag/1.13.0)
Release date: 2021-01-03.

#### Added
- New UI Test target to check custom behaviour of RangeUISlider
- Added UI Test plans to CI
- New Unit test target to test classes that contains extracted logic from RangeUISlider main class
- Added unit test target to CI
- Added support for RTL

## [1.12.1](https://github.com/chicio/RangeUISlider/releases/tag/1.12.1)
Release date: 2020-12-04.

#### Fixed
- scaleMinValue and scaleMaxValue can be set programmatically even after RangeUISlider view is already attached to a view hierarchy

## [1.12.0](https://github.com/chicio/RangeUISlider/releases/tag/1.12.0)
Release date: 2020-10-09.

#### Added
- Programmatic api to change the knob values
- Now Minimum iOS version is 9.0
- Github Actions as CI

## [1.11.0](https://github.com/chicio/RangeUISlider/releases/tag/1.11.0)
Release date: 2019-09-24.

#### Added
- SPM support

## [1.10.0](https://github.com/chicio/RangeUISlider/releases/tag/1.10.0)
Release date: 2019-04-10.

#### Added
- New step increment feature

## [1.9.0](https://github.com/chicio/RangeUISlider/releases/tag/1.9.0)
Release date: 2019-04-01.

#### Added
- Upgrade to Swift 5  
- New method `rangeChangeStarted` in `RangeUISliderDelegate`

## [1.8.0](https://github.com/chicio/RangeUISlider/releases/tag/1.8.0)
Release date: 2019-03-20.

#### Added
- Swift 4.2 compatibility (thanks to [sjongejan](https://github.com/sjongejan))

## [1.7.0](https://github.com/chicio/RangeUISlider/releases/tag/1.7.0)
Release date: 2018-09-01.

#### Added
- RangeUISlider became a open class
- RangeUISlider could be set entirely in a programmatic way

## [1.6.0](https://github.com/chicio/RangeUISlider/releases/tag/1.6.0)
Release date: 2018-05-03.

#### Added
- Now it is possible to set the default starting value for left and right knob programmatically.
- Now it is possible to set the min and max scale of the range programmatically.

## [1.5.0](https://github.com/chicio/RangeUISlider/releases/tag/1.5.0)
Release date: 2017-10-01.

#### Updated
- Upgrade to XCode 9 and Swift 4.
- Removed unused comments.
- Improved code style.

#### Fixed
- Fixed a bug that prevents the user from moving the knobs if both of them were placed at a margin of the bar.

## [1.1.0](https://github.com/chicio/RangeUISlider/releases/tag/1.1.0)
Release date: 2017-06-02.

#### Added
- Default starting value for left and right knob.

## [1.0.2](https://github.com/chicio/RangeUISlider/releases/tag/1.0.2)
Release date: 2017-04-05.

#### Added
- Improved dragging of knobs, now more smooth and efficient.

## [1.0.1](https://github.com/chicio/RangeUISlider/releases/tag/1.0.1)
Release date: 2017-04-04.

#### Added
- Change folder structure.
- Added swift package manager support.

## [1.0.0](https://github.com/chicio/RangeUISlider/releases/tag/1.0.0)
Release date: 2017-04-03.

#### Added
- Initial release.
