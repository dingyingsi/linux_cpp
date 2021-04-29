#include <iostream>
#include <stdlib.h>

using namespace std;

class Complex {
private:
    double a, b;
public:
    Complex();
    Complex(double a, double b);
    friend Complex operator + (Complex &c1, Complex &c2);
    friend Complex operator - (Complex &c1, Complex &c2);
    friend Complex operator * (Complex &c1, Complex &c2);
    friend Complex operator / (Complex &c1, Complex &c2);
    friend Complex operator % (Complex &c1, Complex &c2);

    friend void print(Complex &c1);
};

Complex::Complex() {
    this->a = 0;
    this->b = 0;
}

Complex::Complex(double a, double b) {
    this->a = a;
    this->b = b;
}

Complex operator + (Complex &c1, Complex &c2) {
    Complex c;
    c.a = c1.a + c2.a;
    c.b = c1.b + c2.b;
    return c;
}

Complex operator - (Complex &c1, Complex &c2) {
    Complex c;
    c.a = c1.a - c2.a;
    c.b = c1.b - c2.b;
    return c;
}

Complex operator * (Complex &c1, Complex &c2) {
    Complex c;
    c.a = c1.a + c2.a;
    c.b = c1.b + c2.b;
    return c;
}

Complex operator / (Complex &c1, Complex &c2) {
    Complex c;
    c.a = c1.a / c2.a;
    c.b = c1.b / c2.b;
    return c;
}

Complex operator % (Complex &c1, Complex &c2) {
    Complex c;
    int aa = static_cast<double>(c1.a);
    int ab = static_cast<double>(c2.a);

    int ba = static_cast<double>(c1.b);
    int bb = static_cast<double>(c2.b);

    c.a = aa % ab;
    c.b = ba % bb;

    return c;
}

void print(Complex &c1) {
    cout << c1.a << " + " << c1.b << "i" << endl;
}

int main(int argc, char** argv) {

    Complex c1(10, 20);
    Complex c2(30, 40);

    Complex c3 = c1 + c2;
    print(c3);

    c3 = c1 - c2;
    print(c3);

    c3 = c1 * c2;
    print(c3);

    c3 = c1 / c2;
    print(c3);

    c3 = c1 % c2;
    print(c3);
}