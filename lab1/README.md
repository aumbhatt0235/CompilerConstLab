# *Lex* : Lexical Analyzer Generator

### Installation: Linux Debian-based system.
##### 1. Install flex (a version of Lex).
```bash
sudo apt-get install flex
```
##### 2. Install Bison.
```bash
sudo apt-get install bison
```
### Program Structure
```C
%{
    // declarations
%}

%%
    // translations
%%

// auxillary procedures
```