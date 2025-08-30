# **Basic Syntax**

```bash
awk 'pattern { action }' file
```

* **pattern** → decides which lines to match
* **action** → what to do with matched lines (default: `{ print $0 }` → print the whole line)

---

## **Common Usage**

* `$0` → entire line
* `$1, $2, ...` → first, second, etc. fields (columns)
* `NF` → number of fields in current line
* `NR` → current record (line) number
* `FNR` → current record number per file
* `FS` → input field separator (default: space/tab)
* `OFS` → output field separator (default: space)
* `RS` → input record separator (default: newline)
* `ORS` → output record separator (default: newline)

---

## **Patterns**

* `/regex/` → match lines with regex
* `BEGIN { ... }` → run before reading input
* `END { ... }` → run after reading input
* `condition` → run action if condition true (e.g., `$3 > 10`)

---

## **Actions**

* `print` → print fields or strings
* `printf` → formatted output (like C `printf`)
* `{ ... }` → group multiple statements

---

## **Operators**

* Arithmetic: `+ - * / % ^`
* Comparison: `== != > < >= <=`
* Logical: `&& || !`
* Assignment: `= += -= *= /= %= ++ --`
* String concatenation: `"foo" "bar"` → `"foobar"`

---

## **Built-in Functions**

* **String**:

  * `length(str)` → length of string
  * `tolower(str)` → lowercase
  * `toupper(str)` → uppercase
  * `substr(str, m, n)` → substring
  * `index(str, sub)` → position of substring
  * `split(str, arr, sep)` → split string into array
  * `match(str, regex)` → return position if regex matches
* **Math**:

  * `sin(x), cos(x), exp(x), log(x), sqrt(x), int(x), rand(), srand()`
* **Other**:

  * `system(cmd)` → run shell command
  * `getline` → read next input line

---

## **Examples**

### Print entire file

```bash
awk '{ print }' file
```

### Print first column

```bash
awk '{ print $1 }' file
```

### Print first & third columns, separated by a comma

```bash
awk '{ print $1, $3 }' OFS="," file
```

### Print line numbers with lines

```bash
awk '{ print NR, $0 }' file
```

### Print lines where 3rd column > 100

```bash
awk '$3 > 100 { print $0 }' file
```

### Count lines

```bash
awk 'END { print NR }' file
```

### Print only lines matching regex

```bash
awk '/error/ { print }' file
```

### Sum values in 2nd column

```bash
awk '{ sum += $2 } END { print sum }' file
```

### Average of 2nd column

```bash
awk '{ sum += $2 } END { print sum/NR }' file
```

### Change field separator (CSV)

```bash
awk -F, '{ print $1, $3 }' file.csv
```

### Replace delimiter in output

```bash
awk -F, '{ print $1, $2 }' OFS="|" file.csv
```
