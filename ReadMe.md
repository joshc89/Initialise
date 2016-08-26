# Initialise

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


Simple initialisation and configuration in Swift.

## Summary

Create and configure programmatic UIKit components in concise initialisers:

	let headline = UILabel(configuration: .init(textStyle: .headline,  
		numberOfLines: 0))
		
	let subheadline = UILabel(configuration: .init(textStyle: .subHeadline, 
		textColor: .lightGray, 
		numberOfLines: 0))
	
	let stack = UIStackView(configuration: .init(arrangedSubViews: [headline, subheadline],
		axis: .vertical,
		spacing: 8.0))
		
		
[Parameter Objects] are given for the following classes.

* UIKit
	* `UILabel`
	* `UIImageView`
	* `UIStackView`
* Foundation
	* `NSDateFormatter`
	* `NSNumberFormatter`

[Documentation](https://joshc89.github.io/Initialise/) is available for all of these extensions.

If there are classes or parameters not covered please submit a pull request.

## Motivation

### Problem

Programmatic UI can have advantages over Storyboards however it can become cumbersome to configure all of the subviews if there are a lot of elements in the hierarchy. Configuring a single label might look something like this:

    class MyViewController: UIViewController {
 
        let label = UILabel()
 
        func viewDidLoad() {
            super.viewDidLoad()
 
 			label.font = UIFont.preferredFont(forTextStyle: .body)
            label.textColor = .lightGray
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
    	    label.font = UIFont.preferredFont(forTextStyle: .body)
            label.textColor = .lightGray
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
 
        let label = UILabel(configuration: .init(textColor: .lightGray, numberOfLines: 0))
 
 		func viewDidLoad() {
            super.viewDidLoad()
 
 			view.addSubview(label)
            // create constraints...
        }
    }

It also becomes possible to define fixed or flexible styles for your UI that you can reuse through the app:

	extension UILabel.Configuration {
 
    	static var headlineConfiguration: UILabel.Configuration {
        	return UILabel.Configuration(textStyle: .headline,
            	                         textColor: .red(),
                	                     numberOfLines: 0)
    	}
    	
    	static func headlineConfiguration(withAlignment: NSTextAlignment = .natural) -> UILabel.Configuration {
        	return UILabel.Configuration(textStyle: .headline,
            	                         textColor: .red,
            	                         textAlignment: withAlignment,
                	                     numberOfLines: 0)
    	}
	}
 
 	class MyViewController: UIViewController {
    	let headlineLabel = UILabel(configuration: .headlineConfiguration)
    	let centeredHeadlineLabel = UILabel(configuration: .headlineConfiguration(withAlignment: .center))
	}
	
This greatly simplifies programmatic UI creation allowing for cleaner code that is easier to write and reason about.

The same can be achieved for foundation classes:

	class MyViewController: UIViewController {
	
    	let readFormatter = DateFormatter(configuration: .RFC3339)
    	let writeFormatter = DateFormatter(configuration: .init(dateType: styled(date: .long, time: .medium),
                                                            locale: Locale(identifier: "en_GB"),
                                                            timeZone: TimeZone(identifier: "Europe/London")))))
	}	

## Credits

Thanks to the following authors whose posts inspired this library:

- Natasha The Robot: [Refactoring To: Parameter Objects](https://www.natashatherobot.com/parameter-objects/)
- Jesse Squires: [Enums as Configuration: The anti-pattern](http://www.jessesquires.com/enums-as-configs/)
- Jordan Morgan: [Swift Initialisation as Closures](https://medium.com/the-traveled-ios-developers-guide/swift-initialization-with-closures-5ea177f65a5#.i7xmervzc)

[Parameter Objects]: (https://www.natashatherobot.com/parameter-objects/)
[Configuration Models]: (http://www.jessesquires.com/enums-as-configs/)

 