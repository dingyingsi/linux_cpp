#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main(int argc, char** argv) {

    vector<int> vec;
    vec.push_back(4);
    vec.push_back(1);
    vec.push_back(8);

    vector<int>::iterator itr1 = vec.begin();
    vector<int>::iterator itr2 = vec.end();

    for (vector<int>::iterator itr = itr1; itr!= itr2; ++itr) {
        cout << *itr << " " ;
    }

    sort(itr1, itr2);

    for (vector<int>::iterator itr = itr1; itr!= itr2; ++itr) {
        cout << *itr << " " ;
    }


    cout << vec[2];
    cout << vec.at(2);

    for (int i; i < vec.size(); i++) {
        cout << vec[i] << " ";
    }
    for (vector<int>::iterator itr = vec.begin(); itr != vec.end(); ++itr) {
        cout << * itr << " ";
    }
    for (auto &&it : vec) {
        cout << it << "";
    }

    int *p = &vec[0];
    int value = p[2];

    if (vec.empty()) {
        cout << "Not possible \n";
    }

    cout << vec.size();
    vector<int> vec2(vec);
    vec.clear();
    vec2.swap(vec);





    return EXIT_SUCCESS;
}