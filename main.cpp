
#include <iostream>

#include <iomanip>

#include <cmath>
#include <cstring>

using namespace std;

int rows, columns, i, j, k;

double matrix[15][15], temp[15], quotient;

int main(int argc, char **argv) {

    cout << "请问所输入的系数矩阵行数为：";
    cin >> rows;
    cout << "请问所输入的系数矩阵列数为：";
    cin >> columns;

    if (rows <= 0 || columns <= 0) {
        cout << "输入的格式有误！" << endl;
    }

    for (i = 0; i < rows; i++) {

        cout << "请输入第" << i + 1 << "行的系数(空格隔开, 回车结束)：";

        for (j = 0; j < columns; j++) {
            cin >> matrix[i][j];
        }
    }

    cout << "请输入未知向量的值：";

    for (i = 0; i < rows; i++) {
        cin >> matrix[i][columns];
    }

    cout << "该方程组的增广矩阵为:\n";

    for (i = 0; i < rows; i++) {
        for (j = 0; j < columns + 1; j++) {
            cout << matrix[i][j] << " ";
        }

        cout << endl;
    }


    for (k = 0; k < columns - 1; k++) { //找列主元最大值

        double maxValue = 0;
        int maxValueIndex = 0;

        for (i = k; i < columns; i++) {
            if (fabs(matrix[i][k]) > maxValue) {
                maxValue = fabs(matrix[i][k]);
                maxValueIndex = i;
            }
        }

        if (matrix[maxValueIndex][k] == 0) {
            cout << "无法计算" << endl;
            return EXIT_FAILURE;
        }

        if (k != maxValueIndex) { //将子矩阵中maxValue所在的行与子矩阵中第一行交换行
            for (i = 0; i < rows + 1; i++) {
                temp[i] = matrix[k][i];
                matrix[k][i] = matrix[maxValueIndex][i];
                matrix[maxValueIndex][i] = temp[i];
            }
        }

        cout << "选取列主元后的矩阵:" << endl;

        for (i = 0; i < rows; i++) {
            for (j = 0; j < columns + 1; j++) {
                cout << matrix[i][j] << " ";
            }
            cout << endl;
        }

        // 消元
        for (i = k + 1; i < rows; i++) {
            quotient = matrix[i][k] / matrix[k][k]; // 求出商
            for (j = 0; j < columns + 1; j++) { // 将子矩阵中的行中每一个元素相减操作
                matrix[i][j] = matrix[i][j] - quotient * matrix[k][j]; // 消元具体操作
            }
        }

        cout << "进行消元操作后的矩阵: " << endl;

        for (i = 0; i < rows; i++) {
            for (j = 0; j < columns + 1; j++) {
                cout << matrix[i][j] << " ";
            }
            cout << endl;
        }
    }

    // 将temp清0，准备存放解向量
    memset(temp, 0, 15 * sizeof(double));

    // 从矩阵最后一行开始回代求解
    for (i = rows - 1; i >= 0; i--) {
        quotient = 0;
        for (k = 0; k < columns; k++) {
            quotient = quotient + temp[k] * matrix[i][k];
        }
        // 回代求解
        temp[i] = (matrix[i][columns] - quotient) / matrix[i][i];
    }

    cout << "将线性方程组的解向量进行由列转置为行得出解为：" << endl;

    //输出方程组的解
    for (i = 0; i < rows; i++) {
        // 6位小数与考试输出求一致
        cout << "x" << i + 1 << " = " << fixed << setprecision(6) << temp[i] << endl;
    }


    return EXIT_SUCCESS;
}