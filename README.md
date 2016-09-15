Patience
=================

[![License](https://img.shields.io/github/license/rockbarato/Patience.svg)](http://opensource.org/licenses/MIT)
![Plaform](https://img.shields.io/badge/platform-iOS-2886FD.svg)
![Language](https://img.shields.io/badge/language-Swift%203.0-F48041.svg)
[![Tag](https://img.shields.io/github/tag/rockbarato/Patience.svg)](https://github.com/rockbarato/Patience)


## Installation

> Instead of adding the source files directly to your project, you may want to consider using [CocoaPods](http://cocoapods.org/) to manage your dependencies. Follow the instructions on the CocoaPods site to install the gem, and specify `Patience` as a dependency in your `Podfile` with:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, "8.0"

target "TargetName" do
	pod 'Patience', '~> 2.0'
end
```
But if you want to do it the old fashioned way, just add `Patience.swift` file directly to your project.

## Requirements

* iOS 8.0 and above
* Swift 3.0

## Usage

```swift
Patience.show(self.view)
```
or if you are implementing it on a UITableView you can do:

``````swift
Patience.show(self.view, true)
```
You can dismiss the loader in this way:

```swift
Patience.hide()
```

## TODO

* More customization
* Redraw on rotate

## Collaboration

Feel free to collaborate with ideas, issues and/or pull requests.

## License
Patience is available under the [MIT](http://opensource.org/licenses/MIT) license. See the LICENSE file for more info.
