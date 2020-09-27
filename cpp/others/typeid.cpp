#include <iostream>
#include <cmath>

using namespace std;

int main(int argc, char **argv) {


    char c = 'c';
    int a = 4;
    float f = 3.14;
    double d = 1.212;


    cout << typeid(c + a/(int)d + f).name() << endl;

    return EXIT_SUCCESS;
}
