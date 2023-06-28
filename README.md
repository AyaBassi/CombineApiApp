# CombineApiApp
1.    What is root class in swift
The root class in swift is call the NSObject. It is the class where all the other classes in swift are derived from. SwfitObject is an internal class provided by the swift runtime and serves as the ultimate parent swift classes.

It is not normally possible to directly access the NSObject class in a typical project. It exists in the background to provide the fundamental functionalities in swift. It facilitates the main functionalities and features that extended by all other classes like memory management and basic methods. 

When a class is created in swift it automatically inherits from this root class without explicitly specifying it. This enables the new class with the base functionalities. In most cases there is no need to directly interact with the root class.

If needed it can be used to create your own memory management system, but this is very advanced.



2.    What is optionals

Optionals are a way for a variable to hold either nil or some value. An optional can have two possibilities. Either there is a value which you can unwrap it to access it, or there is no value at all. 
In objective-c optionals only works for objects, but not structures, basic types, or enumeration values.

You use a question mark,”?”, to make a variable optional. Optionals can safely be unwrapped with optional binding. If and while statements can be used to extract the value and assign it to a temporary constant or variable. Also, we can used guard let statements to unwrap an optional. We can also force unwrap an optional with an exclamation mark, “!” which is not ideal, because if there is no value the program will crash. 


3.    Different initialisers

Designated initialisers and convenience intiailisers.

init(<#parameters#>) {
   <#statements#>
}

convenience init(<#parameters#>) {
   <#statements#>
}


Member wise initialisers for Structure types
Initialiser delegation for Value Types used with self.init only from within an intialiser.
Initialiser inheritance and Overriding
Automatic Initialiser Inheritance 
Failable Initailzers
Required Initializers


4.    Class vs struct

Classes have Inheritance, whereas structs do not support inheritance. Type casting enables you to check and interpret the type of a class instance at runtime. De-initialisers enable an instance of a class to free up any resources it has assigned. Reference counting allows more than one reference to a class instance. The additional capabilities that class support come at the cost of increased complexity. 
Unlike classes all structures get an automatic generated member-wise initializer. 
Structures and Enumerations are value types unlike class types which are reference types. Value types are copied when it is assigned to a variable or constant, or when it is passed to a function. All swift basic types such as integers, floating-point numbers, Booleans, strings, arrays, and dictionaries are value types and created as structures under the hood. 

Classes are reference types and are not copied when assigned to a variable or constant, or when they are passed to a function. For classes we can use the identity operator “===” as multiple constants or variables can refer to the same instance of a class.

Class instances are stored on the heap, structures properties are stored on the stack.
Classes are not fully thread-safe, whereas structure is always thread-safe or singleton. 



5.    How do you write tests

You can write test cases by importing the XCTest Frame work which is created and supported by apple. Then you can create a class and inheriting from XCTestCase class. You then need to create functions that do testing and the function name needs to start with "test". 
There are two functions that you can use to help your code and that is "override setUpWithError()throws {}".  This function is called before each test function is called. The other function is called "override func tearDownWithError() throws {}" and this function is called after each test method is returned. First funtion is usually used to initialise required instances and the second function is used to clean up the instances. 
You can also get access to your main project by importing your porject through "@testable import YourProjectName". 
There are three main ways of testing API calling functionalities. Faking, mocking, and stubbing. These ways are used to avoid actual outside your machine api calls. The purpose is to mainly test the functionalities that you use for checking correctness of decoding data, error handling accuracies and so on.

You can also test your logic in view model. 
Having dependency inversion, with dependency injection can help to implement testing easier.


6.    Different App States
Apple has defined 5 execution states
 



Not running:  The app is not running. Or the app has been terminated. 
Inactive: The is  is in the foreground, but doesn’t receive any events.
Active: The app is running, and this is the normal mode, when the user is interacting with it.
Background: The app is running, but it’s not presented on the screen. In this state, you should do short tasks and return the control back to the OS.
Suspended: The app is in the device’s memory, but not doing anything. The OS may remove these apps.

Among these 5 app states only the Inactive, Active, and Background states are considered as the running states. 
 
You can use the following Notifications which have been provided by the system at anywhere you want by registering them. 
- UIApplicationWillEnterForegroundNotification
- UIApplicationDidEnterBackgroundNotification
- UIApplicationDidFinishLaunchingNotification
- UIApplicationDidBecomeActiveNotification 
- UIApplicationWillResignActiveNotification 
- UIApplicationWillTerminateNotification 


7. Escaping vs non escaping

Closures by default are non-escaping. Closure that escapes a function they are passed into mean that the function can return without executing the closure’s code meaning the escaping closure can be suspended or paused and run at a later point. You can mark a closure with an @escaping just before the closure type declaration to make it an escaping.  

