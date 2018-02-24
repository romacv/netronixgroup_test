Aptitude test for job applicants (iOS Developer) by [TestTask](https://github.com/netronixgroup/ios-dev/blob/master/TestTask.md)

## Setup & Run
To run this application you should do next steps:
1. Download ZIP of just clone repository by url
```
git clone https://github.com/romacv/netronixgroup_test.git
```
2. Open project file in XCode
```
netronixgroup_test.xcworkspace
```
3. Select netronixgroup_test target and any of simulator or real iOS Device 

<img src="https://raw.githubusercontent.com/romacv/netronixgroup_test/master/Screen%20Shot%202018-02-24%20at%2015.52.18.png" width="320">


## Unit tests
Project contain unit test for validate JSON response.
For example it have 3 methods:
```
func testEventDataGoodStructure() - With perfect JSON model response
func testEventDataNoMeasurements() - JSON model response missing Measurements array
func testEventDataWithoutUnit() - // JSON model response missing Unit value
```
You can try to launch each or together from netronixgroup_testTests.swift file.

<img src="https://raw.githubusercontent.com/romacv/netronixgroup_test/master/Screen%20Shot%202018-02-24%20at%2015.59.07.png" width="320">
