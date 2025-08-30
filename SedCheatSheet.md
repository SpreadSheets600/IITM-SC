# **Basic Syntax**

```bash
sed [options] 'command' file
```

* `command`: The operation to perform on the input text.
* `file`: The file to apply the operation to (if omitted, `sed` reads from `stdin`).

## **Common Commands**

* **`s/pattern/replacement/`**: Substitute `pattern` with `replacement`.

  * Example: `sed 's/old/new/'` replaces the first occurrence of `old` with `new`.
  * **Flags**:

    * `g`: Replace all occurrences in a line (global).
    * `p`: Print lines where a substitution occurred.
    * `i`: Case-insensitive matching.

  **Example**:

  ```bash
  sed 's/old/new/g' file.txt  # Replace all occurrences of 'old' with 'new'
  ```

* **`d`**: Delete matching lines.

  * Example: `sed '/pattern/d'` deletes lines containing `pattern`.

  **Example**:

  ```bash
  sed '/^#/d' file.txt  # Delete lines starting with #
  ```

* **`p`**: Print lines matching the pattern (often used with `-n`).

  * Example: `sed -n '/pattern/p'` prints lines that match `pattern`.

  **Example**:

  ```bash
  sed -n '/error/p' file.txt  # Print lines that contain 'error'
  ```

* **`a\text`**: Append text after a matching line.

  * Example: `sed '/pattern/a\text'` appends `text` after lines containing `pattern`.

  **Example**:

  ```bash
  sed '/^$/a\This is a new line' file.txt  # Append a line after an empty line
  ```

* **`i\text`**: Insert text before a matching line.

  * Example: `sed '/pattern/i\text'` inserts `text` before lines containing `pattern`.

  **Example**:

  ```bash
  sed '/^$/i\This is a header' file.txt  # Insert a line before an empty line
  ```

* **`c\text`**: Change a line with new text.

  * Example: `sed '/pattern/c\new text'` replaces lines containing `pattern` with `new text`.

  **Example**:

  ```bash
  sed '/foo/c\bar' file.txt  # Change lines with 'foo' to 'bar'
  ```

* **`y/abc/xyz/`**: Transliterate characters (replace each character in the first set with the corresponding character in the second set).

  * Example: `sed 'y/abc/xyz/'` replaces `a` with `x`, `b` with `y`, and `c` with `z`.

  **Example**:

  ```bash
  sed 'y/abc/xyz/' file.txt  # Replace 'a' with 'x', 'b' with 'y', 'c' with 'z'
  ```

* **`N`**: Append the next line of input into the pattern space (useful for multi-line operations).

  * Example: `sed 'N;s/\n/ /'` joins two lines into one by replacing the newline with a space.

  **Example**:

  ```bash
  sed 'N;s/\n/ /' file.txt  # Join two lines together with a space
  ```

## **Flags**

* **`-n`**: Suppress automatic printing of pattern space.

  * Used with `p` to selectively print lines.

  **Example**:

  ```bash
  sed -n '/pattern/p' file.txt  # Print lines matching 'pattern'
  ```

* **`-i`**: Edit the file in-place (modify the original file).

  * Example: `sed -i 's/old/new/' file.txt` modifies the file directly.

  **Example**:

  ```bash
  sed -i 's/foo/bar/' file.txt  # Replace 'foo' with 'bar' in file.txt
  ```

* **`-e`**: Allows multiple commands to be run in a single `sed` call.

  * Example: `sed -e 's/foo/bar/' -e 's/abc/xyz/' file.txt` applies two replacements.

  **Example**:

  ```bash
  sed -e 's/old/new/' -e 's/foo/bar/' file.txt  # Replace both 'old' and 'foo'
  ```

## **Addressing**

* **`line_number`**: Apply the command to specific lines.

  * Example: `sed '2s/foo/bar/'` replaces `foo` with `bar` only on line 2.

  **Example**:

  ```bash
  sed '2s/foo/bar/' file.txt  # Replace 'foo' with 'bar' on line 2 only
  ```

* **`/pattern/`**: Apply the command to lines matching a pattern.

  * Example: `sed '/pattern/s/old/new/'` replaces `old` with `new` on lines matching `pattern`.

  **Example**:

  ```bash
  sed '/foo/s/bar/baz/' file.txt  # Replace 'bar' with 'baz' only in lines containing 'foo'
  ```

* **`$`**: Apply the command to the last line.

  * Example: `sed '$s/foo/bar/'` replaces `foo` with `bar` on the last line.

  **Example**:

  ```bash
  sed '$s/foo/bar/' file.txt  # Replace 'foo' with 'bar' on the last line
  ```

### **Examples**

1. **Replace the first occurrence of "apple" with "orange"**:

   ```bash
   sed 's/apple/orange/' file.txt
   ```

2. **Replace all occurrences of "apple" with "orange" globally**:

   ```bash
   sed 's/apple/orange/g' file.txt
   ```

3. **Delete lines containing "error"**:

   ```bash
   sed '/error/d' file.txt
   ```

4. **Print lines that contain "important"**:

   ```bash
   sed -n '/important/p' file.txt
   ```

5. **Append "New Line" after lines containing "Section 1"**:

   ```bash
   sed '/Section 1/a\New Line' file.txt
   ```

6. **Replace "foo" with "bar" in the second line**:

   ```bash
   sed '2s/foo/bar/' file.txt
   ```

### **Useful Combinations**

* **In-place replacement with backup**:

  ```bash
  sed -i.bak 's/old/new/g' file.txt  # Modify file and create a backup (.bak)
  ```

* **Multiple commands with `-e`**:

  ```bash
  sed -e 's/old/new/' -e 's/foo/bar/' file.txt
  ```
