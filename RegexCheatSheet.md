# **Basic Syntax**

* `.`: Matches any single character except a newline.
* `^`: Anchors a match at the beginning of a string.
* `$`: Anchors a match at the end of a string.
* `[]`: Matches any one character within the brackets (e.g., `[aeiou]` matches any vowel).
* `[^]`: Matches any character not within the brackets (e.g., `[^0-9]` matches any non-digit).
* `|`: OR operator (e.g., `a|b` matches either 'a' or 'b').

## **Character Classes**

* `\d`: Matches any digit, equivalent to `[0-9]`.
* `\D`: Matches any non-digit, equivalent to `[^0-9]`.
* `\w`: Matches any word character (letters, digits, and underscores), equivalent to `[a-zA-Z0-9_]`.
* `\W`: Matches any non-word character, equivalent to `[^a-zA-Z0-9_]`.
* `\s`: Matches any whitespace character (spaces, tabs, line breaks).
* `\S`: Matches any non-whitespace character.
* `\b`: Matches a word boundary (between a word and a space).
* `\B`: Matches a non-word boundary.

## **Quantifiers**

* `*`: Matches 0 or more occurrences of the preceding element.
* `+`: Matches 1 or more occurrences of the preceding element.
* `?`: Matches 0 or 1 occurrence of the preceding element.
* `{n}`: Matches exactly `n` occurrences of the preceding element.
* `{n,}`: Matches `n` or more occurrences of the preceding element.
* `{n,m}`: Matches between `n` and `m` occurrences of the preceding element.

## **Grouping and Capturing**

* `()`: Groups expressions together and captures the matched text (e.g., `(abc)` matches "abc").
* `(?: ...)`: Groups expressions together but does not capture the matched text.
* `\1, \2, ...`: Refers to the captured groups (e.g., `\1` is the first captured group).

## **Escaping Special Characters**

* `\`: Escape character (e.g., `\.` matches a literal period, `\\` matches a backslash).

## **Anchors**

* `^`: Matches the start of the string.
* `$`: Matches the end of the string.

## **Lookahead and Lookbehind**

* `(?= ...)`: Positive lookahead (matches only if the pattern inside the parentheses can be matched after the current position).
* `(?! ...)`: Negative lookahead (matches only if the pattern inside the parentheses cannot be matched after the current position).
* `(?<= ...)`: Positive lookbehind (matches only if the pattern inside the parentheses can be matched before the current position).
* `(?<! ...)`: Negative lookbehind (matches only if the pattern inside the parentheses cannot be matched before the current position).

### **Examples**

* `\d{3}-\d{2}-\d{4}`: Matches a US social security number like `123-45-6789`.
* `\b\w+\b`: Matches a single word (sequences of alphanumeric characters).
* `[^a-zA-Z0-9]`: Matches any non-alphanumeric character.
* `\d{2,4}`: Matches a two to four digit number.
* `a{2,5}`: Matches "aa", "aaa", "aaaa", or "aaaaa".

### **Common Tasks**

* **Matching an email address**:
  `^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$`

* **Matching a URL**:
  `^(https?://)?(www\.)?[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$`

* **Matching a phone number (simple)**:
  `\d{3}-\d{3}-\d{4}`

* **Matching a date (MM/DD/YYYY)**:
  `^(0[1-9]|1[0-2])/(0[1-9]|[12][0-9]|3[01])/\d{4}$`
