char * const cp; ( * 读成 pointer to ) 
cp is a const pointer to char 

const char * p; 
p is a pointer to const char; 

char const * p;

同上因为C++里面没有const*的运算符，所以const只能属于前面的类型。 
C++标准规定，const关键字放在类型或变量名之前等价的。

const int n=5;    //same as below
int const m=10;

const int *p;    //same as below  const (int) * p
int const *q;    // (int) const *p


char ** p1; 
//    pointer to    pointer to    char 
const char **p2;
//    pointer to    pointer to const char 
char * const * p3;
//    pointer to const pointer to    char 
const char * const * p4;
//    pointer to const pointer to const char 
char ** const p5;
// const pointer to    pointer to    char 
const char ** const p6;
// const pointer to    pointer to const char 
char * const * const p7;
// const pointer to const pointer to    char 
const char * const * const p8;
// const pointer to const pointer to const char

说到这里，我们可以看一道以前Google的笔试题：
const char *p="hello";       
foo(&p);  // 函数foo(const char **pp)下面说法正确的是［］
A.函数foo()不能改变p指向的字符串内容。
B.函数foo()不能使指针p指向malloc生成的地址。
C.函数foo()可以使p指向新的字符串常量。
D.函数foo()可以把p赋值为 NULL。

至于这道题的答案是众说纷纭。针对上面这道题，我们可以用下面的程序测试：
#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
void foo(const char **pp)
{
//    *pp=NULL;
//    *pp="Hello world!";
        *pp = (char *) malloc(10);
        snprintf(*pp, 10, "hi google!");
//       (*pp)[1] = 'x';
}
int
main()
{
    const char *p="hello";
    printf("before foo %s/n",p);
    foo(&p);
    printf("after foo %s/n",p);
    p[1] = 'x';
    return;
}
结论如下：
  
1 在foo函数中，可以使main函数中p指向的新的字符串常量。
2 在foo函数中，可以使main函数中的p指向NULL。
3 在foo函数中，可以使main函数中的p指向由malloc生成的内存块，并可以在main中用free释放，但是会有警告。但是注意，即使在foo中让p指向了由malloc生成的内存块，但是仍旧不能用p[1]='x';这样的语句改变p指向的内容。
4 在foo中，不能用(*pp)[1]='x';这样的语句改变p的内容。
所以，感觉gcc只是根据const的字面的意思对其作了限制，即对于const char*p这样的指针，不管后来p实际指向malloc的内存或者常量的内存，均不能用p[1]='x'这样的语句改变其内容。但是很奇怪，在foo里面，对p指向malloc的内存后，可以用snprintf之类的函数修改其内容。


C++ 中常量引用、指向常量的指针、常量指针的区别
先初步了解引用、指针的一些注意事项。
引用并非对象
引用必须初始化
引用只能绑定在对象上，而不能与字面值或某个表达式的计算结果绑定在一起
类型要严格匹配
int &a = 10;             //错误：引用类型的初始值必须是一个对象  
  
double a = 3.14;  
int &b = a;              //错误：此处引用类型的初始值必须是int型对象

指针本身就是对象
指针的类型要和它指向的对象严格匹配 
double dval;  
double *pd = &dval;      //正确  
double *pd2 = pd;        //正确  
  
int *pi = pd;            //错误：指针pi的类型和pd的类型不匹配  
pi = &dval;              //错误：试图把double型对象的地址赋给int型指针  

有例外：引入const 限定符
常量引用
初始化常量引用时允许用任意表达式作为初始值 
int i = 42;  
const int &r1 = i;       //正确：允许将const int & 绑定到一个普通int对象上  
const int &r2 = 42;      //正确  
const int &r3 = r1 * 2;  //正确  
int &r4 = r1 * 2;        //错误  
  
double dval = 3.14;  
const int &ri = dval;    //正确  
//等价于  
const int temp = dval;  
const int &ri = temp;  
  
int i = 42;  
int &r1 = i;  
const int &r2 = i;  
r1 = 0;                  //正确  
r2 = 0;                  //错误  

常量指针 
定义： 又叫常指针，可以理解为常量的指针，也即这个是指针，但指向的是个常量，这个常量是指针的值（地址），而不是地址指向的值。
关键点：
1.常量指针指向的对象不能通过这个指针来修改，可是仍然可以通过原来的声明修改；
2.常量指针可以被赋值为变量的地址，之所以叫常量指针，是限制了通过这个指针修改变量的值；
3.指针还可以指向别处，因为指针本身只是个变量，可以指向任意地址；

代码形式：
int const* p;  const int* p;

指针常量 
定义：本质是一个常量，而用指针修饰它。指针常量的值是指针，这个值因为是常量，所以不能被赋值。 
关键点：
1.它是个常量！
2.指针所保存的地址可以改变，然而指针所指向的值却不可以改变；
3.指针本身是常量，指向的地址不可以变化,但是指向的地址所对应的内容可以变化；

代码形式：
int* const p;

指向常量的常指针 
定义：指向常量的指针常量就是一个常量，且它指向的对象也是一个常量。
关键点：
1.一个指针常量，指向的是一个指针对象； 
2.它指向的指针对象且是一个常量，即它指向的对象不能变化； 
代码形式：
const int* const p;
那如何区分这几类呢? 带两个const的肯定是指向常量的常指针，很容易理解，主要是如何区分常量指针和指针常量:
一种方式是看 * 和 const 的排列顺序，比如
int const* p;    //const * 即常量指针
const int* p;    //const * 即常量指针
int* const p;    //* const 即指针常量
还一种方式是看const离谁近，即从右往左看，比如
int const* p;    //const修饰的是*p，即*p的内容不可通过p改变，但p不是const，p可以修改，*p不可修改；
const int* p;    //同上
int* const p;    //const修饰的是p，p是指针，p指向的地址不能修改，p不能修改，但*p可以修改；
实例
//-------常量指针-------
const int *p1 = &a;
a = 300;     //OK,仍然可以通过原来的声明修改值，
//*p1 = 56;  //Error,*p1是const int的，不可修改，即常量指针不可修改其指向地址
p1 = &b;     //OK,指针还可以指向别处，因为指针只是个变量，可以随意指向；

//-------指针常量-------//
int*  const p2 = &a;
a = 500;     //OK,仍然可以通过原来的声明修改值，
*p2 = 400;   //OK,指针是常量，指向的地址不可以变化,但是指向的地址所对应的内容可以变化
//p2 = &b;     //Error,因为p2是const 指针，因此不能改变p2指向的内容

//-------指向常量的常量指针-------//
const int* const p3 = &a;
//*p3 = 1;    //Error
//p3 = &b;    //Error
a = 5000;    //OK,仍然可以通过原来的声明修改值
在实际应用中，常量指针要比指针常量用的多，比如常量指针经常用在函数传参中，以避免函数内部修改内容。
size_t strlen(const char* src); //常量指针，src的值不可改变；
char a[] = "hello";
char b[] = "world";
size_t a1 = strlen(a);
size_t b1 = strlen(b);
虽然a、b是可以修改的，但是可以保证在strlen函数内部不会修改a、b的内容。
空指针、野指针
既然讲到了指针，那顺便说一下空指针、野指针的问题。
空指针就是保存地址为空的指针，使用指针时必须先判断是否空指针，很多问题都是这一步导致的。
野指针是在delete掉指针之后，没有置0，导致指针随意指向了一个内存地址，如果继续使用，会造成不可预知的内存错误。
另外指针的误用很容易造成BUG或者内存泄漏。
看代码：
//-------空指针-------//
int *p4 = NULL;
//printf("%d",*p4); //运行Error，使用指针时必须先判断是否空指针

//-------野指针（悬浮、迷途指针）-------//
int *p5 = new int(5);
delete p5;
p5 = NULL; //一定要有这一步
printf("%d",*p5);  //隐藏bug，delete掉指针后一定要置0，不然指针指向位置不可控，运行中可导致系统挂掉

//-------指针的内存泄漏-------//
int *p6 = new int(6);
p6 = new int(7); //p6原本指向的那块内存尚未释放，结果p6又指向了别处，原来new的内存无法访问，也无法delete了，造成memory leak