# Brastlewark

Brastlewark is an app that shows you in a friendly way all the citizens from **'Brastlewark'** the best gnome's town in the world. With this app, you can see their name, age, weight, friends, and other useful information that helps heroes with their adventures. Remember that the photos showed are not real photos from the population because they appreciate their privacy.
You can find more info in the statement section. 

## The App
Brastlewark-app has two main screens, one with the purpose of **list** all the gnomes with reduced details where you can *filter by name* and another one for the visualization of a gnome in *particular*.
<br>
<p align="center">
<img src="https://raw.githubusercontent.com/guidofa/brastlewark/dev/Brastlewark/Brastlewark/SupportingFiles/Screenshots/Launch.png" width="250">
<img src="https://raw.githubusercontent.com/guidofa/brastlewark/dev/Brastlewark/Brastlewark/SupportingFiles/Screenshots/List.png" width="250">
<img src="https://raw.githubusercontent.com/guidofa/brastlewark/dev/Brastlewark/Brastlewark/SupportingFiles/Screenshots/Detail.png" width="250">
</p>
<br>

## Technical details and how to run it
The app is made with Swift using VIPER architecture and Xcode 12.4 as IDE, if you want to run it clone the project and run 'Pod install' on the folder that contains the 'podfile' file. More info at https://cocoapods.org/ the iOS deployment target is 14.4.

## Design details
### Color Pallete (Hexa codes)
* #E8DED2
* #A3D2CA
* #5EAAA8
* #056676

### Fonts
* Montserrat
* AmaticSC

## Thirdparty libraries used in this project
Kingfisher: Used for images management (cache and loaders) https://github.com/onevcat/Kingfisher

Swiftlint:  A tool to enforce Swift style and conventions. https://github.com/realm/SwiftLint

Lottie: is a mobile library for Android and iOS that natively renders vector-based animations and art in real-time with minimal code. https://github.com/airbnb/lottie-ios

## Statement
`Our team is playing a fantasy role-playing game and every time the heroes they play arrive at a town, they have the issue they don't know the local population and what they can do to help them on their adventures.
This is one of these times, our heroes just arrived at a Gnome town called Brastlewark. To facilitate trade with the local population they need an easy way to browse all the inhabitants details. We've found a server providing all the census data of Brastlewark at the following address:
https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json
Gnomes in this town are not really social because they have too much work to do. That's the reason they can have more than one job and might have few or even no friends at all. They also appreciate their privacy so they've used some random images from internet, not specifically optimized for mobile devices, for their profile. (They are very modern in some aspects and they have smartphones and access to internet for instance).
Please write an Android / iOS / Hybrid application to help our team browse and be able to see the details of those inhabitants.
Specifications
 Retrieve data from the URL provided
 Show this data in the most user-friendly way you could think. Keep in mind our heroes will be quite busy dealing with Orcs, so apps have to be really simple and easy to use. At least would be good to quickly browse (and even filter) all the individuals and be able to see the details of each one.
 Document all libraries used and explain the reason you’ve used that library.
 Test the app: add the most important test you think it is needed.
Bonus:
 Be creative!
 UI must not blocked by network connections or long operations
 Images coming from network cached to improve performance
 Error handling
 Avoid using third party libraries for basic functionality (we want to see you know the basics!)
 Use third party libraries for extended functionality
 Snappiness & responsiveness over sluggishness & idleness
 Determine gender of gnomes (just joking on this one but feel free to make your guess)
 Test the app` 

## Copyright
1. Icons from www.flaticon.es/.
1. Animations from www.lottiefiles.com 
1. Fonts from https://fonts.google.com<br>
***Copyright © 2021 Guido Fabio***
