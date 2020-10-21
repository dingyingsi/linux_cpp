#include<iostream>
#include<cmath>
#include <iomanip>

using namespace std;

using std::setw;

class Matrix {               //定义矩阵类

protected:
    int index;
    double *matrixA;

public:
    Matrix(int dims = 4)    //构造函数
    {
        index = dims;                 //保护数据赋值
        matrixA = new double[index * index];        //动态内存分配
    }

    ~Matrix() { //内存释放
        delete[] matrixA;
    }

    void setMatrix(double *rmatr) { //设置矩阵值
        for (int i = 0; i < index * index; i++) {
            *(matrixA + i) = rmatr[i]; //矩阵成员赋初值
        }
    }

    void printM(); //显示矩阵
};

class Linequ : public Matrix { //线性方程组类

public:
    Linequ(int dims = 4) : Matrix(dims) {
        sums = new double[dims];
        solu = new double[dims];
    }

    ~ Linequ();

    void setLinequ(double *a, double *b); //方程赋值
    void printL(); //显示方程
    int solve();  //高斯消元法求解
    void showX();  //输出方程的解
private:
    double *sums;
    double *solu;
};

void Matrix::printM() { //显示矩阵的元素
    cout << "The Matrix is:" << endl;
    for (int i = 0; i < index; i++) {
        for (int j = 0; j < index; j++)
            cout << *(matrixA + i * index + j) << " ";
        cout << endl;
    }
}

Linequ::~Linequ() {
    delete[] sums;
    delete[] solu;
}

void Linequ::setLinequ(double *a, double *b) { //方程赋值

    setMatrix(a);

    for (int i = 0; i < index; i++) {
        sums[i] = b[i];
    }
}

void Linequ::printL() {  //显示方程
    cout << "The Line eqution is : " << endl;

    cout.setf(ios::left, ios::adjustfield);

    for (int i = 0; i < index; i++) {
        for (int j = 0; j < index; j++) {
            cout << setw(7) << *(matrixA + i * index + j);
        }
        cout << setw(14) << sums[i] << endl;
    }
}

void Linequ::showX() {                          //输出方程的解
    cout << "The Result is: " << endl;
    for (int i = 0; i < index; i++) {
        cout << "X[" << i << "]=" << solu[i] << endl;
    }
}

int Linequ::solve() {                             //解线性方程组
    int l, k, i, j, is, p, q, m = 0;
    double d, t;
    l = 1;
    for (k = 0; k <= index - 2; k++) {                     //消去过程
        d = 0.0;
        for (i = k; i <= index - 1; i++) {  // iterate rows
            for (j = k; j <= index - 1; j++) {
                t = fabs(matrixA[i * index + j]);  // iterate elements
                if (t > d) {  // max element
                    d = t;
                    is = i;
                }
            }
        }
        if (d + 1.0 == 1.0) {
            l = 0; // flag: all zero elements
        }
        if (l == 0) {
            cout << "fail" << endl;
            return (0);
        }
        d = matrixA[k * index + k];
        if (d == 0) {
            m++;
            d = matrixA[(k + m) * index + k];
            is = k + m;
        }
        if (is != k) {
            for (j = k; j <= index - 1; j++) {
                p = k * index + j;
                q = is * index + j;
                t = matrixA[p];
                matrixA[p] = matrixA[q];
                matrixA[q] = t;
            }
            t = sums[k];
            sums[k] = sums[is];
            sums[is] = t;
        }
        d = matrixA[k * index + k];

        for (j = k; j <= index - 1; j++) { // every element devided by / d
            p = k * index + j;
            matrixA[p] = matrixA[p] / d;
        }
        sums[k] = sums[k] / d;

        for (i = k + 1; i <= index - 1; i++) {
            for (j = k + 1; j <= index - 1; j++) {
                p = i * index + j;
                matrixA[p] = matrixA[p] - matrixA[i * index + k] * matrixA[k * index + j];
            }
            sums[i] = sums[i] - matrixA[i * index + k] * sums[k];
        }
    }
    d = matrixA[(index - 1) * index + index - 1];
    if (fabs(d) + 1.0 == 1.0) {
        cout << "fail" << endl;
        return (0);
    }

    solu[index - 1] = sums[index - 1] / d;                        //回代过程
    for (i = index - 2; i >= 0; i--) {
        t = 0.0;
        for (j = i + 1; j <= index - 1; j++)
            t = t + matrixA[i * index + j] * solu[j];
        solu[i] = sums[i] - t;
    }
}

int main()                                                  //主函数
{
    // double a[]= {2,-0.5,-0.5,0, -0.5,2,0,-0.5, -0.5,0,2,-0.5, 0,-0.5,-0.5,2};
    // double b[4]={0,3,3,0};
    double a[] = {
            8, 2, 1, 2.5,
            1, 8, -0.5, 2,
            1.5, 2, 8, -1,
            1, 0.5, 0.7, 8
    };
    double b[4] = {
            1.5,
            -3,
            -4.5,
            3.2
    };

    Linequ equl(4);
    equl.setLinequ(a, b);
    equl.printL();

    if (equl.solve()) {
        equl.showX();
    } else {
        cout << "Fail" << endl;
    }

    return EXIT_SUCCESS;
}