# Result Data Breakdown

The results of the MRZ scan are returned in the parsedMRZ object documented below. You can extract all properties directly since they are public to the class.

See [ResultsViewController.swift](../XavierDemoiOS/XavierDemoiOS/ResultsViewController.swift) for examples of using the parsedMRZ object in a view controller.

## XavierField

#### `documentType`

The document type.

#### `countryCitizen`

The code of the country the traveler is a citizen of. Also known as nationality.

#### `givenName`

The given or first name of the traveler.

#### `surname`

The surname, last name, or family name of the traveler

#### `documentNumber`

The document number of the traveler.

#### `countryIssue`

The issuing country code for the document.

#### `dateBirth`

The date of birth of the traveler. This is returned in **YYMMDD** format.

#### `sex`

The sex of the traveler.

#### `dateExpiration` 

The date of expiration of the document. This is returned in **YYMMDD** format.

#### `optionalData` (optional field)

The optional data for two or three line MRZs.

#### `optionalData2` (optional field)

The second optional data for three line MRZs. Found on the second line of the three line MRZ.

#### `stateIssue`

The the issuing state code for Enhanced Driver Licenses.

#### `documentImage`

The photo of the document used to capture the MRZ data.

#### `rawMRZ`

The unparsed MRZ read by Xavier.

#### `documentNumberCheckDigit`

The check digit for the document number.

#### `dateBirthCheckDigit`

The check digit for the date of birth.

#### `dateExpirationCheckDigit`

The checkdigit for the expiration date of the document.

#### `optionalDataCheckDigit` (optional field)

The check digit for the optional data.

#### `compositeCheckDigit`

The check digit over the document number, birth datem expiration date, optional data, and their check digits.
