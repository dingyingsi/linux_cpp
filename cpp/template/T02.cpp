#include <iostream>

using namespace std;

template <typename T> class BoVector {
private:
    T arr[1000];
    int size;
public:
    BoVector():size(0) {}
    void push(T x) {
        arr[size] = x;
        size++;
    }
    void print() const {
        for (int i = 0; i < size; i++) {
            cout << arr[i] << endl;
        }
    }

};

int main(int argc, char** argv) {
    BoVector<int> bv;
    bv.push(2);
    bv.push(5);
    bv.push(8);
    bv.push(9);
    bv.print();

    return EXIT_SUCCESS;
}
