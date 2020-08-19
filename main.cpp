#include <iostream>
#include <cmath>

using namespace std;


struct Person {

    int b[5];
    int c;
};

int main(int argc, char **argv) {

    Person person;

    person.b[1] = 1;
    person.c = 10;

    cout << sizeof(double ) << endl;

    cout << sizeof(Person) << endl;

    return EXIT_SUCCESS;
}



