# HamburgerBerg

## User perspective: What could be added or improved?
- Dark mode 
- Proper design with animation
- Search for beer by name
- Filter beer with some properties
- Add beer of the day
- Favorite a beer
- Offline ussage
- Add more accessbility (e.g. announce voice over when something changed)
- Long press on one element in list gives you a preview of the detailed page
- Rating system for a beer
- etc.

## Technical perspective: What could be added or improved?
- Add more Unit tests
- Add UI test 
- Add async/await
- Add Sourcery that generate automatic mocks
- Add CI
- Modulize the different UIViews more
- Extract the business logic or services into a package, so logic can be used in different apps
- Much better error presentation for the user
- Check of Network availability with Alamofire
- SwiftLint
- SwiftUIPreviews for different devices, color scheme and dark mode
- Snapshot test for designer with different font sizes
- Make use of Assercatalog (darkmode, color, design elements)
- etc.

## Packages I used (Alamofire)
There are pro and cons for both options. Normally I'm big fan of creating my own Network Service especially when it's a new starting project. Normally we should really be cautious when implementing a new Dependency. We have to think about the maintenance, code quality, continuous development and so on. But in the case of Alamofire it's well maintained, widely used and especially it's tested. If I choose to create my own Network Layer, I've really to think through how I want to build my Network layer, that can cause bugs, cost time etc.

Conclusion:
I decided to use Alamofire, it would make totally sense to use the known Network Framework Alamofire, that can be reused in different Projects. Since the work would happen in an agency, where you have different projects, it would be best to use the known framework instead of reinventing the wheel over and over again. Another  option would be to create a package, that can be reused, but as I said, in this case, Alamofire is well tested. And one bonus point would be: It's a new challenge for me, I never worked with Alamofire ;) And instead of building a new network layer I could spend more time on other tasks. 😄



## How to install?
Download Xcode 12 beta 5 and run the app on the iOS 15 Simulator. There could be some problems, because I coded it in the `M1` machine.

## How to run tests?
In the original state there were 3 different schemes (`HamburgerBerg`, `UnitTests` and `UITests`)
For running all tests in the app select `HamburgBerg` and press `cmd + u`.
My reason to have different schemes to run only specific tests that I care. When I develop a feature or refactor something, I only want to run the unit tests. In the future you could add scheme `SnapshotTests`.

## Simple prototype
![Simulator Screen Shot - iPhone 12 Pro - 2021-09-05 at 01 20 33](https://user-images.githubusercontent.com/8395044/132110241-9e49cdfb-036e-4bdb-8e10-a4f3121f968b.png)

