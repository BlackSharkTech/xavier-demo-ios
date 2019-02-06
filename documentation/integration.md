# Integration
**Note: At this time, the Xavier Framework will not compile on the iOS Simulator, only on a real device.**
## Adding the Dependencies to your App

First, you will need to import the following dependencies:
 * [TesseractOCRSDKiOS](https://github.com/msgrizz/TesseractOCRSDKiOS)
 * [EVGPUImage2](https://github.com/BradLarson/GPUImage2)

If you are using [Cocoapods](https://cocoapods.org), add the following to your Podfile:
```
	pod 'TesseractOCRSDKiOS', '~> 4.0'
 	pod 'EVGPUImage2', '~> 0.2'
```
> Check out [our Podfile](../XavierDemoiOS/Podfile) for an example.

Once your Podfile is set up, run `pod install`.

## Adding the Xavier Framework to your App

1. Copy the [XavierFramework.framework](../XavierDemoiOS/XavierFramework.framework) into your project's root directory (*this should be the same directory as your Podfile or your xcproject file*)

2. Open your xcworkspace and click on your project in the file navigator on the left.

3. On your target’s **General** tab, click the + below Embedded Binary and select the XavierFramework.framework from Finder.

4. Clean and build your project and you should now be able to use any Xavier functions in your project.


## Recommended Settings

The depedencies we use have lots of Xcode warnings due to the new versions of Swift. 

1. If you use Pods, select the Pod project in the file navigator and go to the **Build Settings** tab.

2. Search for **Inhibit All Warnings** and change the value to **Yes**.

This will prevent Xcode from showing 900+ warnings whenever you build your app.

## Using Xavier in your App
#### MRZScanner Object
1. To launch the Xavier scanner, simply add `import XavierFramework` to the top of the view controller that you would like to launch the scanner from.

2. Create an instance of the MRZScanner object and update any customization options documented [here](./customization.md).

3. Call the start function on your customized MRZScanner, passing the presenting view controller as the first parameter and the license key as the second parameter.

Below is an example of launching the MRZScanner. To see this code in context of its surrounding view controller, see [HomeViewController.swift](../XavierDemoiOS/HomeViewController.swift).
```swift
    @objc func launchXavier(){
        let mrzScanner = MRZScanner()
        mrzScanner.start(self, licenseKey: "LICENSE_KEY_HERE")
    }
```
> The license key is specific to your OS and your bundle id and will be provided upon purchase. You can still run the scanner in development for testing purposes by entering any string, but there will be a message on the screen indicating that the key is for development use only and is not suitable for a release build. 

#### Xavier Scanner Delegate - Event Hooks
To interact with the Xavier Scanner in your app, create a XavierScannerDelegate implementation. This delegate has two functions that you can implement to handle interactions with the Xavier Scanner.

See [HomeViewController.swift](../XavierDemoiOS/XavierDemoiOS/HomeViewController.swift) for examples of using Xavier Scanner Delegate.

The handleResults function grabs the ParsedMRZ object when a scan is successful. You can handle the MRZ results here (e.g pass the data to another view controller or save a custom document object).
```swift
    func handleResults(results: ParsedMRZ) {
        print(results.documentType)
    }
```

The scanCancelled function is called when the scan is cancelled by the user through the close button in the top left of the scanner view. 
```swift
    func scanCancelled() {
        print("scan cancelled by user")
    }
```
