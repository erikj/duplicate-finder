# DuplicateFinder

## objectives

- find duplicate files based on md5 sum
- input: directory(ies)
- output:
  - grouped lists of duplicate files
  - human-readable file sizes of duplicate files
  - counts of dirs and files scanned

- internal data structure(s)
  - `md5[sum] = [file1,file2,…]`

## prospective

sha1 or md5 based on input flag

## implementation

### ruby

<http://www.rubydoc.info/stdlib/digest/1.9.3/Digest/MD5>

