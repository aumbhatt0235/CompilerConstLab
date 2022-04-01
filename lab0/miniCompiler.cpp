#include <iostream>
#include <fstream>
#include <vector>
#include <string>

using namespace std;

bool search(string s, vector<string> lines) {
	for(int i=0; i<lines.size(); ++i) {
		if(lines[i] == s)
			return true;
	}
	return false;
}

int checkVar(vector<string> lines) {
	vector<string> var;
	for(int i=0; i<lines.size(); ++i) {
		int j=0;
		while(j < lines[i].length()) {
			char c = lines[i].at(j);
			if(c == ' ' || c == ';' || c == '\t') {
				lines[i] = lines[i].erase(j, 1);
			}
			++j;
		}
		// cout << lines[i] << endl;

		int equal = lines[i].find("=");
		int plus = lines[i].find("+");

		string c;
		if((plus != string::npos) && (equal != string::npos)){
		//	cout << lines[i] << endl;
			c = lines[i].substr(0, equal);
			if(!search( "int" + c, lines ) && isalpha(c.at(0))) {
				cout << "\nCompilation failed : Unknown Variable " << c << endl;
				return -1;
			}
			c = lines[i].substr(equal+1, plus-equal-1);
			if(!search( "int" + c, lines) && isalpha(c.at(0))) {
				cout << "\nCompilation failed : Unknown Variable " << c << endl;
				return -1;
			}
			c = lines[i].substr(plus+1);
			if(!search( "int" + c, lines) && isalpha(c.at(0))) {
				cout << "\nCompilation failed : Unknown Variable " << c << endl;
				return -1;
			}
			break;
		}
	}
	return 0;
}

int main(int argc, char **argv) {

	string line;
	fstream f1;
	vector<string> lines;
	
	f1.open("test.c", ios::in);

	if(!f1) {
		cout << "\nError : Unable to open file.";
		exit(0);
	}

	while(getline(f1, line)) {
		cout << line << endl;
		lines.push_back(line);
	
	}
	f1.close();

	if(checkVar(lines) != -1)
		cout << "\nCompilation Successful.\n";

	return 0;
}
