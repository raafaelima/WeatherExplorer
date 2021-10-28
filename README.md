# CountriesExplorer

## About the APP
The app is architected using the principles of SOLID and PACT, I believe that this is sufficient to get a clear understanding of the code and how to navigate through it. Also, the app is written in Swift 5

In the app you will find the following structure:
* CountyExplorer - All the app code is in there
* CountyExploreTests - All the Unit Tests
* CountyExploreUITests - All The UiTests

## TechDetails
I'm using Fastlane to automate the tests and lint executions.
I use Carthage as a dependency manager and the following libraries are used to support:

>```bash
>XCode Version 13.0 (13A233)
>Swift Version: 5
>```

## Getting Started
1. macOS Big Sur 11.6 or higher
2. Install [HomeBrew](http://brew.sh/)
3. Setup up the environment (be sure to fill the vars)
>
>```bash
># Needed for fastlane
>export LC_ALL=en_US.UTF-8
>export LANG=en_US.UTF-8
>```

4. Setup Enviroment *
>
>```bash
>make setup
>```

  This will install the following tools (if not present)
  >
  >0. brew packages - rbenv and swiftlint
  >0. ruby 2.6.2, bundler, gems referred in the Gemfile.lock

## Running

1. Run the tests

>
>```bash
>make test
>```

2. List all targets with documentation
>
>```bash
>make
>```

## References
[PACT](https://www.thoughtworks.com/pt/insights/blog/write-quality-mobile-apps-any-architecture)

[Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
