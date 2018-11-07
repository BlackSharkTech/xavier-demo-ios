# Customization 

Customization allows you to customize the UI of Xavier so that it fits your app's needs.

See `TBD` for an example of how to customize your Xavier experience.

## Bounding Box

The bounding box is the rectangle in the camera view that the user puts their document in.

#### `boundingBoxSearchingColor: UIColor`

This defines the color of the box while Xavier is searching for a valid MRZ. The default is `UIColor.white`. 

#### `boundingBoxFoundColor: UIColor`

This defines the color of the box while Xavier has found a potentially valid MRZ.. The default is `UIColor.green`.

## X (close) Button

The close button is the button at the top left of the screen. Clicking this button will quit Xavier.

#### `closeButtonColor: UIColor`

This defines the color of the close button. The default is `UIColor.white`.

Note: The close button cannot be disabled on iOS as there would be no other way to exit the scanner.

## Flash Button

The flash button is button at the top right of the screen. Clicking this button toggles the flashlight/torch.

#### `flashOnButtonColor: UIColor`

This defines the color of the flashlight icon when the flashlight is ON. The default is `UIColor.yellow`.

#### `flashOnButtonImage: UIImage`

This defines the icon for the flashlight when the flashlight is ON. The default is `UIImage(named: "flashOn")` which is similar to the native iOS flash icon. 

#### `flashOffButtonColor: UIColor`

This defines the color of the flashlight icon when the flashlight is OFF. The default is `UIColor.white`.

#### `flashOffButtonImage: UIImage`

This defines the icon for the flashlight when the flashlight is OFF. The default is `UIImage(named: "flashOff")` which is similar to the native iOS flash icon.

#### `flashButtonEnabled: Bool`

This defines whether the flash button is enabled or not. If not enabled, the button is not visible and the flashlight cannot be enabled. The default is `true`.

## Instruction Text

The instruction text is the text under the bounding box.

#### `instructionTextEnabled: Bool`

This defines whether the instructions text is enabled or not. This text is only visible in portrait mode. If not enabled, there is no text under the bounding box. The default is `true`.

#### `instructionText: String`

This defines the text for the text under the bounding box. The default is `Position the document in the box above.`.
    
#### `instructionTextColor: UIColor`

This defines the color of the instruction text. The default is `UIColor.white`.

#### `instructionTextFont: UIFont`

This defines the font for the instruction text. The default is `UIFont.systemFont(ofSize: UIFont.systemFontSize)`.

## Toast

The toast that is displayed when the scanner has found a potentially valid MRZ.

#### `toastEnabled: Bool`

This defines whether the toast is enabled or not. If not enabled, nothing is displayed while the scanner is processing. The default is `true`.

#### `toastText: String`

This defines the text inside of the toast. The default is `Processing document scan...`.

#### `toastTextColor: UIColor`

This defines the color of the text inside of the toast. The default is `UIColor.white`.

#### `toastTextFont: UIFont`

This defines the font of the text inside of the toast. The default is `UIFont.systemFont(ofSize: UIFont.systemFontSize)`.

## Camera Negative Space Background

The camera negative space background is the space surrounding the bounding box.

#### `cameraNegativeSpaceBackgroundEnabled: Bool`

This defines whether the camera negative space background is enabled or not. If not enabled, the space surrounding the bounding box is compeltely transparent. The default is `true`.

#### `cameraNegativeSpaceBackgroundColor: UIColor`

This defines the color (and opacity) for the camera negative space background. The default is `UIColor.black.withAlphaComponent(0.6)`.

