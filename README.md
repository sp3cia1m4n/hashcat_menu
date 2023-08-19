
# Hashcat Menu - Batch Script for Hash Cracking

## Table of Contents

- [Getting Started](#getting-started)
- [Usage](#usage)
- [Features](#features)
- [Contributing](#contributing)
- [Credits](#credits)

## Getting Started

To use this script, follow these steps:

1. Download the `hashcat-6.2.6.7z` file from the [Hashcat website](https://hashcat.net/files/hashcat-6.2.6.7z) and extract it.
2. Download the `rockyou.txt` wordlist from the [GitHub repository](https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt).
3. Place both the `hashcat.exe` and `rockyou.txt` files in the same directory as the script.
4. Run the `hashcat_menu.bat` script.

## Usage
The Hashcat Menu offers the following options:

![1](https://github.com/sp3cia1m4n/hashcat_menu/assets/92638468/298f0d21-cfd6-4d03-9b59-7216dd1cc533)

![2](https://github.com/sp3cia1m4n/hashcat_menu/assets/92638468/bcab5441-f731-456f-bf86-d761a4d728fc)

1. **Auto Detect Hashes:** Automatically detect hashes in the `hashes.txt` file and start cracking with rockyou.txt wordlist.
2. **Search for Hash:** Search for a specific hash name in the Hashcat's supported hash algorithms.
3. **Cracking:** Manually input a hash number and start the cracking process.
4. **Delete potfile:** Delete the potfile (the file storing cracked hashes).
5. **Open hash file:** Open the `hashes.txt` file in Notepad for editing.
6. **Display Last Cracked Hash:** Display the contents of the `hashcat.potfile`.
7. **Credits:** Show credits to the script creator.


## Features

- User-friendly menu interface.
- Automatic hash detection and cracking.
- Customizable wordlist support.
- Ability to search for supported hash names.
- Easy deletion of potfile and opening hash files.

## Contributing

Contributions are welcome! If you have suggestions, improvements, or bug fixes, please feel free to create a pull request.

1. Fork the repository.
2. Create a new branch for your feature or improvement.
3. Make your changes and commit them.
4. Push your changes to your fork.
5. Create a pull request describing your changes.

## Credits

This script was created by [Sp3cia1M4N](https://twitter.com/Sp3cia1M4N). Thank you for using this script!
