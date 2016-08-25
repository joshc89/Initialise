# Initialise

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


Simple initialisation and configuration in Swift.

## Features

### TL;DR

Create and configure programmatic UIKit components in concise initialisers:

*Note: Swift 3 syntax is more concise*

	let headline = UILabel(configuration: UILabel.Configuration(textStyle: UIFontTextStyleHeadline,  
		numberOfLines: 0))
		
	let subheadline = UILabel(configuration: UILabel.Configuration(textStyle: UIFontTextStyleSubHeadline, 
		textColor: UIColor.lightGrayColor(), 
		numberOfLines: 0))
	
	let stack = UIStackView(configuration: UIStackView.Configuration(arrangedSubViews: [headline, subheadline],
		axis: .Vertical,
		spacing: 8.0))
		
		
[Parameter Objects] are given for the following classes.

* UIKit
	* `UILabel`
	* `UIImageView`
	* `UIStackView`
* Foundation

If there are classes or parameters not covered please submit a pull request.

## Motivation

### Problem

Programmatic UI can have advantages over Storyboards *Include details* however it can become cumbersome to configure all of the subviews if there are a lot of elements in the hierarchy. Configuring a single label might look something like this:

    class MyViewController: UIViewController {
 
        let label = UILabel()
 
        func viewDidLoad() {
            super.viewDidLoad()
 
 			label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
            label.textColor = UIColor.lightGrayColor()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(label)
            
            // create constraints...
        }
    }

As the number of elements grows so does the size of `viewDidLoad(_:)`, `init(...)`. One solution is to create a dedicated function that does all of this work however that still requires a lot of boilerplate code and separates the configuration of the variables from their initial definition.

*I also continually to forget `translatesAutoresizingMaskIntoConstraints = false` and it's not until you run and see nothing on screen that you have to work backwards and fix this.*

[Another approach](https://medium.com/the-traveled-ios-developers-guide/swift-initialization-with-closures-5ea177f65a5#.i7xmervzc) is to do the configuration within a closure initialiser:

	class MyViewController: UIViewController {
 
        let titleLabel: UILabel = {
        
	        let label = UILabel()
    	    label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
            label.textColor = UIColor.lightGrayColor()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        func viewDidLoad() {
            super.viewDidLoad()
 
 			view.addSubview(label)
            // create constraints...
        }
    }

This puts configuration close to definition but still includes a lot of boilerplate code.

### Solution

This library provides a collection of convenience initialisers for UIKit and Foundation classes using [Parameter Objects] as [Configuration Models] for each class. This allows for cleaner UI code:

	class MyViewController: UIViewController {
 
        let label = UILabel(configuration: UILabel.Configuration(textColor: UIColor.lightGrayColor(), numberOfLines: 0))
 
 		func viewDidLoad() {
            super.viewDidLoad()
 
 			view.addSubview(label)
            // create constraints...
        }
    }

It also becomes possible to define fixed or flexible styles for your UI that you can reuse through the app:

	extension UILabel.Configuration {
 
    	static var headlineConfiguration: UILabel.Configuration {
        	return UILabel.Configuration(textStyle: UIFontTextStyleHeadline,
            	                         textColor: UIColor.redColor(),
                	                     numberOfLines: 0)
    	}
    	
    	static func headlineConfiguration(alignment: NSTextAlignment = .Natural) -> UILabel.Configuration {
        	return UILabel.Configuration(textStyle: UIFontTextStyleHeadline,
            	                         textColor: UIColor.redColor(),
            	                         textAlignment: alignment,
                	                     numberOfLines: 0)
    	}
	}

	class MyViewController: UIViewController {
	
    	let headlineLabel = UILabel(configuration: UILabel.Configuration.headlineConfiguration)
    	
    	let centeredHeadlineLabel = UILabel(configuration: UILabel.Configuration.headlineConfiguration(.Center))
	}
	

 This syntax also becomes much neater in Swift 3:
 
 	class MyViewController: UIViewController {
    	let headlineLabel = UILabel(configuration: .headlineConfiguration)
    	let centeredHeadlineLabel = UILabel(configuration: .headlineConfiguration(.center))
	}
	
This greatly simplifies programmatic UI creation allowing for cleaner code that is easier to write and reason about.

## Credits

Thanks to the following authors whose posts inspired this library:

- @NatashaTheRobot: [Refactoring To: Parameter Objects][Parameter Objects]
- Jesse Squires: [Enums as Configuration: The anti-pattern][Parameter Objects]
- Jordan Morgan: [Swift Initialisation as Closures](https://medium.com/the-traveled-ios-developers-guide/swift-initialization-with-closures-5ea177f65a5#.i7xmervzc)

[Parameter Objects]: (https://www.natashatherobot.com/parameter-objects/)
[Configuration Models]: (http://www.jessesquires.com/enums-as-configs/)

 