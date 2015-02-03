# dinclusion
 Simple file inclusion in D programs.

# How to use
To create a inclusion-file with utility *dinclusion* run the following command at a command prompt:

`dinclusion file1 file2 ... fileN`

After the command, the utility will create appropriate files with names file1.di, file2.di etc.

# The use in the project.

For use in the project file, edit the D interface files. 
After editing, add command `import file1, file2, ..., fileN;` in import section of your project and compile project with following command:

`dmd your_d_project file1.di file2.di .. fileN.di`
