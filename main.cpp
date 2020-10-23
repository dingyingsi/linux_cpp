#include <iostream>
#include <iomanip>

using namespace std;

class GaussJordanAlgrithmn {
private:
    float a[50][50];
    int n;
public:
    void accept() {
        cout << "Enter no. of variables: ";
        cin >> n;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n + 1; j++) {
                if (j == n) {
                    cout << "Constant no." << i << " = ";
                } else {
                    cout << "a[" << i << "][" << j << "] = ";
                }
                cin >> a[i][j];
            }
        }
    }

    void display() {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n + 1; j++) {
                if (j == n) {
                    cout << left << setw(20) << a[i][j] << endl;
                } else {
                    cout << left << setw(14) << a[i][j];
                }
            }
        }
        cout << endl;
    }

    void gauss()//converting augmented matrix to row echelon form
    {
        float temp; //Line 1
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                temp = a[j][i] / a[i][i]; //Line 2
                for (int k = i; k < n + 1; k++) {
                    a[j][k] -= temp * a[i][k]; //Line 3
                    //a[j][k]-=a[j][i]*a[i][k]/a[i][i];//Line 4
                }
            }
        }
    }

    void jordan() {//converting to reduced row echelon form
        float temp;
        for (int i = n - 1; i >= 0; i--) {

            for (int j = i - 1; j >= 0; j--) {
                temp = a[j][i] / a[i][i];
                for (int k = n; k >= i; k--) {
                    a[j][k] -= temp * a[i][k];
                }
            }
        }

        float x[n];
        for (int i = 0; i < n; i++) { //making leading coefficients zero
            x[i] = 0;
        }
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n + 1; j++) {
                if (x[i] == 0 && j != n) {
                    x[i] = a[i][j];
                }
                if (x[i] != 0) {
                    a[i][j] /= x[i];
                }
            }
        }
    }

    void credits() {
        for (int i = 0; i < n; i++) {
            cout << "x" << i << " = " << a[i][n] << endl;
        }
    }

};

int main() {
    GaussJordanAlgrithmn gaussJordanAlgrithmn;
    gaussJordanAlgrithmn.accept();
    cout << "Augmented matrix: " << endl;
    gaussJordanAlgrithmn.display();
    gaussJordanAlgrithmn.gauss();
    cout << "Row echelon form: " << endl;
    gaussJordanAlgrithmn.display();
    gaussJordanAlgrithmn.jordan();
    cout << "Reduced row echelon form: " << endl;
    gaussJordanAlgrithmn.display();
    cout << "Solution: " << endl;
    gaussJordanAlgrithmn.credits();

    return EXIT_SUCCESS;
}