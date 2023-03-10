# Package scanner 2

Package scanner for the nimble package list.

## Features

Can scan changed packages only and runs in offline mode by default.

Checks packages for:

* Duplicate and invalid names
* Missing alias targets
* Empty tags
* Invalid method
* Missing description or license
* Unavailable URLs
* Insecure URLs

## Compilation

```
nim c -d:release package_scanner.nim
```
No external dependencies required.

## Usage

```
package_scanner <packages.json> [--old=packages_old.json] [--check-urls]
```

If an old package list is specified only changed packages are checked.  
If `--check-urls` is specified URLs are tested for reachability.

## Copyright

Based on package_scanner.nim by Federico Ceratto

Released under [GPLv3 License](LICENSE.txt)
