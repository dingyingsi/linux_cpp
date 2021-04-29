#include <iostream>
#include <iomanip>
#include <cstdlib>

using namespace std;

/**
 * Gauss-Jordan算法解线性方程组
 * author: 丁应思
*/

class GaussJordanAlgrithmn {
private:
    // 声明存储矩阵的二维数组大小
    double matrix[20][20];
    // 存储线性方程组中未知数的个数
    int n;
public:

    /**
     * 初始化矩阵数据
    */
    void init_matrix() {
        cout << "线性方程组未知数个数:" << endl;
        cin >> n;
        for (int rowIndex = 0; rowIndex < n; rowIndex++) {
            cout << "线性方程组第" << rowIndex + 1 << "个方程的系数(空格分开):" << endl;
            for (int columnIndex = 0; columnIndex < n; columnIndex++) {
                cin >> matrix[rowIndex][columnIndex];
            }
        }

        cout << "线性方程组常数项列(空格分开):" << endl;
        for (int rowIndex = 0; rowIndex < n; rowIndex++) {
            cin >> matrix[rowIndex][n];
        }
    }

    /**
     * 打印当前内中中矩阵
    */
    void print_matrix() {
        for (int rowIndex = 0; rowIndex < n; rowIndex++) {
            for (int columnIndex = 0; columnIndex < n + 1; columnIndex++) {
                if (columnIndex == n) {
                    cout << left << setw(20) << matrix[rowIndex][columnIndex] << endl;
                } else {
                    cout << left << setw(14) << matrix[rowIndex][columnIndex];
                }
            }
        }
        cout << endl;
    }

    /**
     *	把原矩阵转换为上三解矩阵
    */
    void gauss_reduce()
    {
        double quotient = 0.0; // 用于存储消元用到的约数
        for (int rowIndex = 0; rowIndex < n; rowIndex++) {
            for (int columnIndex = rowIndex + 1; columnIndex < n; columnIndex++) {
                quotient = matrix[columnIndex][rowIndex] / matrix[rowIndex][rowIndex]; // 求出类似比值的约数
                for (int currentIndex = rowIndex; currentIndex < n + 1; currentIndex++) {
                    matrix[columnIndex][currentIndex] -= quotient * matrix[rowIndex][currentIndex]; // 主元所在列下面元素消为0元素
                }
            }
        }
    }

    /**
     *	把上三角矩阵转换为主对角线元素全为1的单位矩阵
    */
    void jordan_reduce() {
        double quotient = 0.0; // 用于存储消元用到的约数
        for (int rowIndex = n - 1; rowIndex >= 0; rowIndex--) { // 从最后一行开始循环
            for (int columnIndex = rowIndex - 1; columnIndex >= 0; columnIndex--) { // 从倒数第二行开始循环
                quotient = matrix[columnIndex][rowIndex] / matrix[rowIndex][rowIndex]; // 求出类似比值的约数
                for (int k = n; k >= rowIndex; k--) { // 系数连同常数项一块操作
                    matrix[columnIndex][k] -= quotient * matrix[rowIndex][k]; // 主元所在列上面元素消为0元素
                }
            }
        }

        double x[n];
        for (int i = 0; i < n; i++) {
            x[i] = 0;
        }
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n + 1; j++) {
                if (x[i] == 0 && j != n) {
                    x[i] = matrix[i][j];
                }
                if (x[i] != 0) {
                    matrix[i][j] /= x[i];
                }
            }
        }
    }

    /**
     * 打印线性方程组的解
    */
    void print_solution() {
        for (int i = 0; i < n; i++) {
            cout << "x" << i + 1 << " = " << matrix[i][n] << endl;
        }
    }

};

int main() {
    GaussJordanAlgrithmn *gaussJordanAlgrithmn = new GaussJordanAlgrithmn;

    gaussJordanAlgrithmn->init_matrix();
    cout << "线性方程组对应的增广矩阵为:" << endl;
    gaussJordanAlgrithmn->print_matrix();

    gaussJordanAlgrithmn->gauss_reduce();
    cout << "线性方程组经过Gauss消元后对应的上三角矩阵为:" << endl;
    gaussJordanAlgrithmn->print_matrix();

    gaussJordanAlgrithmn->jordan_reduce();
    cout << "线性方程组经过Jordan消元后对应的单位矩阵为:" << endl;
    gaussJordanAlgrithmn->print_matrix();

    cout << "线性方程组经过消元后解为:" << endl;
    gaussJordanAlgrithmn->print_solution();

    delete gaussJordanAlgrithmn;

    while (true) {
        if (getchar() == 'q') {
            return EXIT_SUCCESS;
        }
    }
}