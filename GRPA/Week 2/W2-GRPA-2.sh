script() {
mkdir dir_1 dir_2
touch dir_1/file_1
ln -s $(pwd)/dir_1/file_1 dir_2/file_2
}
