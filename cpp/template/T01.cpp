
#include <iostream>
#include <cmath>

using namespace std;

template <typename T> T square(T x) {
    return x * x;
}

int main(int argc, char **argv) {

    cout << square<int>(5) << endl;
    cout << square<int>(5.5) << endl;

    return EXIT_SUCCESS;
}