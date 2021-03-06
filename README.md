# WeatherExplorer

## About the APP
The app is architected using the principles of SOLID and PACT, I believe that this is sufficient to get a clear understanding of the code and how to navigate through it. Also, the app is written in Swift 5

In the app you will find the following structure:
* WeatherExplorer - All the app code is in there
* WeatherExploreTests - All the Unit Tests

## Thought Process
You can follow my thought process, architecture diagrams, and some explanations about technical decisions on the [PR history](https://github.com/raafaelima/CountyExplorer/pulls?q=is%3Apr).

## TechDetails
The architecture chosen is the Clean/Onion Architecture, plus MVP design pattern for UI/Interaction, to keep the things as simple as possible.
I'm using Fastlane to automate the tests and lint executions and Carthage as a dependency manager. 
Also, following libraries are used to support:

>```bash
>XCode Version 13.0 (13A233)
>iOS: 13.4
>Swift Version: 5
>Realm: 10.18.0
>```

## High-Level Architecture

![GeneralArch](https://user-images.githubusercontent.com/7543763/140629600-7c81d021-1ab8-43b0-88fd-1770667d243e.png)


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

4. Setup Environment *
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
