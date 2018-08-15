# SwiftFilesConstGen
Tool that generates a swift constants file from resource files names.

# Table of Contents
1. [Installation](#Installation)
2. [Demo](#Demo)
3. [Usage](#Usage)

## Overview

What you do:
```
guard let url = Bundle.main.url(forResource: "ErrorProneResourceFileNameWhichCanBeChangedWithouyNoticing", withExtension: nil) else {
	return
}
````

What you want to do:
```
guard let url = Bundle.main.url(forResource: Files.fileName, withExtension: nil) else {
	return
}
````
- Get safety for free.
- Autocomplete.
- Build errors when constants change.

![SwiftFilesConstGen overview](https://github.com/andreinagy/SwiftFilesConstGen/blob/master/overview.png)

## Installation
- Download swiftFilesConstGen.rb (eg. in the project's `bin/` folder)
- Make it executable (`chmod +x swiftFilesConstGen.rb`)
- ???
- Profit

Optionally you can add it as a build phase to get a fresh constants file.
```
"$PROJECT_DIR/bin/generateConstants.rb" -i "$PROJECT_DIR/Project/Resources/" -o "$PROJECT_DIR/Project/Generated/" -e json -n JSONFiles
```
- Script location: project's `bin` directory
- Input files location `Project/Resources/`
- Input files extension `json`
- Output location `Project/Generated/`
- Output file `JSONFiles-generated.swift`
- 

## Usage
Run in the terminal:
```
./swiftFilesConstGen -i path/to/files -o output/path -e json -n JSONFiles
```
- It searches for all files ending with `json` in `path/to/files`
- Creates `JSONFiles-generated.swift` containing constants with the files names.
- Handles replaces the spaces and hyphens with underscores. Files that start with a number get an `a` prepended.

## Sample output:
```
// Generated by swiftFilesConstGen
// Input directory: TestInput/
// Files extension: json
// Struct name: JSONFiles
// Do not modify manually

// swiftlint:disable all
struct JSONFiles {

    static let file_extension = "json"
    
    static let myOtherFile = "My--Other.File.json"
    static let myFile = "My-File.json"

}
// swiftlint:enable all
```
