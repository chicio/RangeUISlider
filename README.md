# RangeUISlider

[![Build Status](https://travis-ci.org/chicio/RangeUISlider.svg?branch=master)](https://travis-ci.org/chicio/RangeUISlider.svg?branch=master)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/chicio/RangeUISlider/master/LICENSE.md)
[![Supported platform](https://img.shields.io/badge/platforms-iOS-orange.svg)](https://img.shields.io/badge/platforms-iOS-orange.svg)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/RangeUISlider.svg)](https://cocoapods.org/pods/RangeUISlider)
[![CocoaPods Doc Coverage Percentage](https://img.shields.io/cocoapods/metrics/doc-percent/RangeUISlider.svg)](https://cocoapods.org/pods/RangeUISlider)
[![CocoaPods Download](https://img.shields.io/cocoapods/dt/RangeUISlider.svg)](https://img.shields.io/cocoapods/dt/RangeUISlider.svg)

A highly customizable iOS range selection slider, developed using autolayout and completely customizable using IBDesignabled and IBInspectable.

***

### Installation

There are two ways to install RangeUISlider in your project: manual installation of as a framework.

**Manual installation**

To manually install RangeUISlider simply drag and drop the <a href="https://github.com/chicio/RangeUISlider/blob/master/Source/RangeUISlider.swift">RangeUISlider.swift</a> file inside your project.

**Framework**

RangeUISlider is available also as a custom framework. To install follow the standard procedure used to install a custom cocoa touch framework 
(simply drag the RangeUISlider.xcodeproj inside your project and add it to the Embedded Binaries/Linked Frameworks and Libraries section of your 
project. See the demo project for a complete example of the setup of the framework.

**CocoaPods**

RangeUISlider is also available as a pod on <a href="https://cocoapods.org/pods/RangeUISlider">CocoaPods</a>.
Add the dependency to your Podfile similar to the following:

```
target 'MyApp' do
    pod 'RangeUISlider', '~> 1.0'
end
```

and then run pod install (or pod update).

***

### Usage

The step needed to use RangeUISlider are:

 - drag a UIView into you storyboard
 - set RangeUISlider as custom class of that view
   - **IMPORANT: set also the Module to RangeUISlider if you used cocoapods or the framework version during installation**
 - start editing using interface builder
	
<a href="https://www.youtube.com/watch?v=Lorvozz-1HU" target="_blank">Here</a> you can find a video tutorial.	
	
<p align="center">
<a href="https://www.youtube.com/watch?v=Lorvozz-1HU" target="_blank"><img src="https://raw.githubusercontent.com/chicio/RangeUISlider/master/Screenshots/tutorial.png"></a>
</p>

To get the current values from the slider, set its delegate property.
The delegate of the RangeUISlider must implement the ```RangeUISliderDelegate``` protocol, that has two methods:

```swift

/**
 Calls the delegate when the user is changing the range by moving the knobs.
     
 - parameter minValueSelected: the minimum value selected.
 - parameter maxValueSelected: the maximum value selected.
 - parameter slider: the slider on which the range has been modified.
 */
 @objc optional func rangeIsChanging(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider)
    
/**
 Calls the delegate when the user has finished the change of the range.
    
 - parameter minValueSelected: the minimum value selected.
 - parameter maxValueSelected: the maximum value selected.
 - parameter slider: the slider on which the range has been modified.
 */
 @objc func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider)

```
***

### Customizable property

This is the list of the current customizable property of the RangeUISlider directly from Interface Builder using IBDesignable/IBInspectable:

 - range selected color
 - range selected image (override range selected color property)
 - range selected edge inset top, left, bottom, right (used only if range selected image has been setted)
 - range selected gradient color 1 (override range selected color and image)
 - range selected gradient color 1 (override range selected color and image)
 - range selected gradient start point (used only if range selected gradients color has been choosed)
 - range selected gradient end point (used only if range selected gradients color has been choosed)
 - range not selected color
 - range not selected image (override range not selected color property)
 - range not selected edge inset top, left, bottom, right (used only if range not selected image has been setted)
 - range not selected gradient color 1 (override range not selected color and image)
 - range not selected gradient color 1 (override range not selected color and image)
 - range not selected gradient start point (used only if range not selected gradients color has been choosed)
 - range not selected gradient end point (used only if range not selected gradients color has been choosed)
 - left knob width
 - left knob height
 - left knob corners radius 
 - left knob color
 - left knob image (override color) 
 - left knob shadow opacity
 - left knob shadow color
 - left knob shadow offset
 - left knob shadow radius
 - left knob gradient color 1 (override left knob color and image)
 - left knob gradient color 2 (override left knob color and image)
 - left knob gradient start point (used only if left knob gradients color has been choosed)
 - left knob gradient end point (used only if left knob gradients color has been choosed)
 - left knob border width
 - left knob border color
 - right knob width
 - right knob height
 - right knob corners radius 
 - right knob color
 - right knob image (override color) 
 - right knob shadow opacity
 - right knob shadow color
 - right knob shadow offset
 - right knob shadow radius
 - right knob gradient color 1 (override right knob color and image)
 - right knob gradient color 2 (override right knob color and image)
 - right knob gradient start point (used only if right knob gradients color has been choosed)
 - right knob gradient end point (used only if right knob gradients color has been choosed) 
 - right knob border width
 - right knob border color
 - bar height 
 - bar leading distance from container view
 - bar trailing distance from container view
 - bar cornes
 - bar shadow opacity
 - bar shadow color
 - bar shadow offset
 - bar shadow radius
 - bar border width
 - bar border color
 - container corners

***

### Examples

In the following screenshot you can find some examples of the level of customization that it is possible to reach. You can find this example in the demo project.

<p align="center">
<img width="318" height="588" hspace="50" src="https://raw.githubusercontent.com/chicio/RangeUISlider/master/Screenshots/01-mixed.gif">
<img src="https://raw.githubusercontent.com/chicio/RangeUISlider/master/Screenshots/02-only-colors.gif">
</p>
<p align="center">
<img hspace="50"src="https://raw.githubusercontent.com/chicio/RangeUISlider/master/Screenshots/03-only-images.gif">
<img src="https://raw.githubusercontent.com/chicio/RangeUISlider/master/Screenshots/04-only-gradients.gif">
</p>
