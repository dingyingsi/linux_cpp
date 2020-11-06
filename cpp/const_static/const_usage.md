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








const 定义的常量在超出其作用域之后其空间会被释放，而 static 定义的静态常量在函数执行后不会释放其存储空间。
static 表示的是静态的。类的静态成员函数、静态成员变量是和类相关的，而不是和类的具体对象相关的。即使没有具体对象，也能调用类的静态成员函数和成员变量。一般类的静态函数几乎就是一个全局函数，只不过它的作用域限于包含它的文件中。
在 C++ 中，static 静态成员变量不能在类的内部初始化。在类的内部只是声明，定义必须在类定义体的外部，通常在类的实现文件中初始化，如：double Account::Rate = 2.25; 
static 关键字只能用于类定义体内部的声明中，定义时不能标示为 static。
在 C++ 中，const 成员变量也不能在类定义处初始化，只能通过构造函数初始化列表进行，并且必须有构造函数。
const 数据成员 只在某个对象生存期内是常量，而对于整个类而言却是可变的。因为类可以创建多个对象，不同的对象其 const 数据成员的值可以不同。所以不能在类的声明中初始化 const 数据成员，因为类的对象没被创建时，编译器不知道 const 数据成员的值是什么。
const 数据成员的初始化只能在类的构造函数的初始化列表中进行。要想建立在整个类中都恒定的常量，应该用类中的枚举常量来实现，或者static cosnt。
class Test{
public:
    Test():a(0){}
    enum {size1=100,size2=200};
private:
    const int a;//只能在构造函数初始化列表中初始化
    static int b;//在类的实现文件中定义并初始化
    conststatic int c;//与 static const int c;相同。
};
 
int Test::b=0;//static成员变量不能在构造函数初始化列表中初始化，因为它不属于某个对象。
cosnt intTest::c=0;//注意：给静态成员变量赋值时，不需要加static修饰符，但要加cosnt。
cosnt 成员函数主要目的是防止成员函数修改对象的内容。即 const 成员函数不能修改成员变量的值，但可以访问成员变量。当方法成员函数时，该函数只能是 const 成员函数。
static 成员函数主要目的是作为类作用域的全局函数。不能访问类的非静态数据成员。类的静态成员函数没有 this 指针，这导致：
1、不能直接存取类的非静态成员变量，调用非静态成员函数。
2、不能被声明为 virtual。
关于 static、const、static cosnt、const static 成员的初始化问题
1、类里的const成员初始化：
在一个类里建立一个 const 时，不能给他初值。
class foo{
public:
    foo():i(100){}
private:
    const int i=100;//error!!!
};
//或者通过这样的方式来进行初始化
foo::foo():i(100){}
2、类里的 static 成员初始化：
类中的 static 变量是属于类的，不属于某个对象，它在整个程序的运行过程中只有一个副本，因此不能在定义对象时 对变量进行初始化，就是不能用构造函数进行初始化，其正确的初始化方法是：
数据类型 类名::静态数据成员名=值；
class foo{
public:
    foo();
private:
staticint i;
};
 
intfoo::i=20;
这表明：
1、初始化在类体外进行，而前面不加static，以免与一般静态变量或对象相混淆 
2、初始化时不加该成员的访问权限控制符private、public等 
3、初始化时使用作用域运算符来表明它所属的类，因此，静态数据成员是类的成员而不是对象的成员。 
3、类里的 static cosnt 和 const static 成员初始化
这两种写法的作用一样，为了便于记忆，在此值说明一种通用的初始化方法：
class Test{
public:
    static const int mask1;
    conststatic int mask2;
};
constTest::mask1=0xffff;
constTest::mask2=0xffff;
//它们的初始化没有区别，虽然一个是静态常量一个是常量静态。静态都将存储在全局变量区域，其实最后结果都一样。可能在不同编译器内，不同处理，但最后结果都一样。
完整实例
实例
#ifdef A_H_
#define A_H_
#include <iostream>
usingnamespace std;
class A{
    public:
        A(int a);
        staticvoid print();//静态成员函数
    private:
        static int aa;//静态数据成员的声明
        staticconst int count;//常量静态数据成员（可以在构造函数中初始化）
        const int bb;//常量数据成员
};
 
int A::aa=0;//静态成员的定义+初始化
const int A::count=25;//静态常量成员定义+初始化
 
A::A(int a):bb(a){//常量成员的初始化
    aa+=1;
}
 
void A::print(){
    cout<<"count="<<count<<endl;
    cout<<"aa="<<aa<<endl;
}
 
#endif
 
void main(){
    A a(10);
    A::print();//通过类访问静态成员函数
    a.print();//通过对象访问静态成员函数
}
初始化位置
静态成员不能在类的定义里初始化（除int外）。不能在头文件里初始化。
比如定义了 myclass.h，一般放到 myclass.cpp 里初始化它。

C++ 类的静态成员(static)
静态成员的提出是为了解决数据共享的问题。实现共享有许多方法，如：设置全局性的变量或对象是一种方法。但是，全局变量或对象是有局限性的。这一章里，我们主要讲述类的静态成员来实现数据的共享。
静态数据成员
在类中，静态成员可以实现多个对象之间的数据共享，并且使用静态数据成员还不会破坏隐藏的原则，即保证了安全性。因此，静态成员是类的所有对象中共享的成员，而不是某个对象的成员。
使用静态数据成员可以节省内存，因为它是所有对象所公有的，因此，对多个对象来说，静态数据成员只存储一处，供所有对象共用。静态数据成员的值对每个对象都是一样，但它的值是可以更新的。只要对静态数据成员的值更新一次，保证所有对象存取更新后的相同的值，这样可以提高时间效率。
静态数据成员的使用方法和注意事项如下：
1、静态数据成员在定义或说明时前面加关键字 static。
2、静态成员初始化与一般数据成员初始化不同。静态数据成员初始化的格式如下：
　
<数据类型><类名>::<静态数据成员名>=<值>
这表明：
(1) 初始化在类体外进行，而前面不加static，以免与一般静态变量或对象相混淆。 
(2) 初始化时不加该成员的访问权限控制符private，public等。 
(3) 初始化时使用作用域运算符来标明它所属类，因此，静态数据成员是类的成员，而不是对象的成员。 
3、静态数据成员是静态存储的，它是静态生存期，必须对它进行初始化。
4、引用静态数据成员时，采用如下格式：
<类名>::<静态成员名>
如果静态数据成员的访问权限允许的话(即public的成员)，可在程序中，按上述格式来引用静态数据成员。
下面举一例子，说明静态数据成员的应用：
实例
#include …
class Myclass{
public:
    Myclass(int a, int b, int c);
    void GetNumber();
    void GetSum();
private:
    int A, B, C;
    static int Sum;
};
 
int Myclass::Sum = 0;
 
Myclass::Myclass(int a, int b, int c){
    A = a;
    B = b;
    C = c;
    Sum += A+B+C;
}
 
void Myclass::GetNumber(){
    cout<<"Number="<<a<<","<<b<<","<<c<<endl;
 }
 
void Myclass::GetSum(){
    cout<<"Sum="<<sum<<endl;
 }
 
void main(){
    Myclass M(3, 7, 10),N(14, 9, 11);
    M.GetNumber();
    N.GetNumber();
    M.GetSum();
    N.GetSum();
}
从输出结果可以看到Sum的值对M对象和对N对象都是相等的。这是因为在初始化M对象时，将M对象的三个int型数据成员的值求和后赋给了Sum，于是Sum保存了该值。在初始化N对象时，对将N对象的三个int型数据成员的值求和后又加到Sum已有的值上，于是Sum将保存另后的值。所以，不论是通过对象M还是通过对象N来引用的值都是一样的，即为54。
静态成员函数
静态成员函数和静态数据成员一样，它们都属于类的静态成员，它们都不是对象成员。因此，对静态成员的引用不需要用对象名。
在静态成员函数的实现中不能直接引用类中说明的非静态成员，可以引用类中说明的静态成员。如果静态成员函数中要引用非静态成员时，可通过对象来引用。下面通过例子来说明这一点。
实例
#include …
class M{
public:
    M(int a){
        A=a;
        B+=a;
    }
    
    static void f1(M m);
private:
    int A;
    static int B;
};
 
void M::f1(M m)
{
    cout<<"A="<<m.a<<endl;
    cout<<"B="<<b<<endl;
}
 
int M::B=0;
 
void main()
{
    M P(5),Q(10);
    M::f1(P); //调用时不用对象名
    M::f1(Q);
}
读者可以自行分析其结果。从中可看出，调用静态成员函数使用如下格式：
　　
<类名>::<静态成员函数名>(<参数表>);

C++ 中各种类型的成员变量的初始化方法
C++各种不同类型成员根据是否static、时候const类型的初始化方法不尽相同，java的语法就没有这么复杂，怪的得那么多人都跑去学Java了。以前面试时被人问到这个问题回答不出来，写代码时也经常搞乱了，这里翻了下书，总结一下。
//-----------------Test.h----------------------------
#pragma once
class Test
{
private :
    int var1;
    // int var11= 4; 错误的初始化方法
    const int var2 ;
    // const int var22 =22222; 错误的初始化方法
    static int var3;
    // static int var3333=33333; 错误，只有静态常量int成员才能直接赋值来初始化
    static const int var4=4444; //正确，静态常量成员可以直接初始化    
    static const int var44;
public:
    Test(void);
    ~Test(void);
};
//--------------------Test.cpp-----------------------------------
#include ".\test.h"
 
int Test::var3 = 3333333; //静态成员的正确的初始化方法
 
// int Test::var1 = 11111;; 错误静态成员才能初始化
// int Test::var2 = 22222; 错误
// int Test::var44 = 44444; // 错误的方法，提示重定义
Test::Test(void)：var1(11111),var2(22222)正确的初始化方法//var3(33333)不能在这里初始化
{
    var1 =11111; //正确, 普通变量也可以在这里初始化
    //var2 = 222222; 错误，因为常量不能赋值，只能在 "constructor initializer （构造函数的初始化列表）" 那里初始化
          
    var3 =44444; //这个赋值是正确的，不过因为所有对象一个静态成员，所以会影响到其他的，这不能叫做初始化了吧
}
Test::~Test(void){}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
有些成员变量的数据类型比较特别，它们的初始化方式也和普通数据类型的成员变量有所不同。这些特殊的类型的成员变量包括：
a. 常量型成员变量
b. 引用型成员变量
c. 静态成员变量
d. 整型静态常量成员变量
e. 非整型静态常量成员变量
对于常量型成员变量和引用型成员变量的初始化，必须通过构造函数初始化列表的方式进行。在构造函数体内给常量型成员变量和引用型成员变量赋值的方式是行不通的。
静态成员变量的初始化也颇有点特别。
参考下面的代码以及其中注释：
// Initialization of Special Data Member
#include <iostream>
using namespace std;     
 
class BClass
{
public:
    BClass() : i(1),ci(2), ri(i) // 对于常量型成员变量和引用型成员变量，必须通过    
    {                // 参数化列表的方式进行初始化。在构造函数体内进行赋值的方式，是行不通的。
    } 
 
    voidprint_values()
    {
        cout<< "i =\t" << i << endl;
        cout<< "ci =\t" << ci << endl;
        cout<< "ri =\t" << ri << endl;
        cout<< "si =\t" << si << endl;
        cout<< "csi =\t" << csi << endl;
        cout<< "csi2 =\t" << csi2 << endl;
        cout<< "csd =\t" << csd << endl;
    }
 
private:
    inti; // 普通成员变量
    constint ci; // 常量成员变量
    int&ri; // 引用成员变量
    staticint si; // 静态成员变量
    //staticint si2 = 100; // error: 只有静态常量成员变量，才可以这样初始化
    staticconst int csi; // 静态常量成员变量
    staticconst int csi2 = 100; // 静态常量成员变量的初始化(Integral type) (1)
    staticconst double csd; // 静态常量成员变量(non-Integral type)
    //staticconst double csd2 = 99.9; // error: 只有静态常量整型数据成员才可以在类中初始化
};
// 静态成员变量的初始化(Integral type)
int BClass::si = 0;
// 静态常量成员变量的初始化(Integral type)
const int BClass::csi = 1;
// 静态常量成员变量的初始化(non-Integral type)
const double BClass::csd = 99.9;
 
// 在初始化(1)中的csi2时，根据Stanley B. Lippman的说法下面这行是必须的。
// 但在VC2003中如果有下面一行将会产生错误，而在VC2005中，下面这行则可有可无，这个和编译器有关。
const int BClass::csi2;
 
int main(void)
{
    BClassb_class;
    b_class.print_values(); 
    return0;
}

c++ 静态成员小结,c++,static
类中的静态成员真是个让人爱恨交加的特性。我曾经在面试时，被主考官抓住这个问题一阵穷追猛打，直把我问的面红耳赤，败下阵来。所以回来之
后，我痛定思痛，决定好好总结一下静态类成员的知识点，以便自己在以后面试中，在此类问题上不在被动。 
静态类成员包括静态数据成员和静态函数成员两部分。 
静态数据成员
类体中的数据成员的声明前加上static关键字，该数据成员就成为了该类的静态数据成员。和其他数据成员一样，静态数据成员也遵守public/protected/private访问规则。同时，静态数据成员还具有以下特点： 
1.静态数据成员的定义。 
静态数据成员实际上是类域中的全局变量。所以，静态数据成员的定义(初始化)不应该被放在头文件中。 （声明vs.定义（初始化）） 其定义方式与全局变量相同。举例如下： 
xxx.h文件 
class base{ 
private: 
    static const int _i;//声明，标准c++支持有序类型在类体中初始化,但vc6不支持。 
}; 
 
xxx.cpp文件 
const int base::_i=10;//定义(初始化)时不受private和protected访问限制.
注：不要试图在头文件中定义(初始化)静态数据成员。在大多数的情况下，这样做会引起重复定义这样的错误。即使加上#ifndef #define #endif 或者 #pragma once 也不行。 
2.静态数据成员被类的所有对象所共享，包括该类派生类的对象。即派生类对象与基类对象共享基类的静态数据成员。举例如下： 
class base{ 
public : 
    static int _num;//声明 
}; 
int base::_num=0;//静态数据成员的真正定义 
 
class derived:public base{ }; 
 
main() 
{ 
    base a; 
    derived b; 
    a._num++; 
    cout<<"base class static data number_num is"<<a._num<<endl; 
    b._num++; 
    cout<<"derived class static datanumber _num is"<<b._num<<endl; 
} 
// 结果为1,2;可见派生类与基类共用一个静态数据成员。
3.静态数据成员可以成为成员函数的可选参数，而普通数据成员则不可以。举例如下： 
class base{ 
public : 
    static int _staticVar; 
    int _var; 
    void foo1(int i=_staticVar);//正确,_staticVar为静态数据成员 
    void foo2(int i=_var);//错误,_var为普通数据成员 
};
4.静态数据成员的类型可以是所属类的类型，而普通数据成员则不可以。普通数据成员的只能声明为所属类类型的指针或引用。举例如下： 
class base{ 
public : 
    static base_object1;//正确，静态数据成员 
    base _object2;//错误 
    base *pObject;//正确，指针 
    base &mObject;//正确，引用 
};
5.这个特性，我不知道是属于标准c++中的特性，还是vc6自己的特性。 
静态数据成员的值在const成员函数中可以被合法的改变。举例如下： 
class base{ 
public: 
    base(){
        _i=0;
        _val=0;
    } 
 
    mutable int _i; 
    static int _staticVal; 
    int _val; 
    void test() const{//const 成员函数 
        _i++;//正确，mutable数据成员 
        _staticVal++;//正确，static数据成员 
        _val++;//错误 
    } 
}; 
int base::_staticVal=0;
静态成员函数 
静态成员函数没有什么太多好讲的。 
1.静态成员函数的地址可用普通函数指针储存，而普通成员函数地址需要用类成员函数指针来储存。举例如下： 
class base{ 
    static int func1(); 
    int func2(); 
}; 
 
int (*pf1)()=&base::func1;//普通的函数指针 
int (base::*pf2)()=&base::func2;//成员函数指针
2.静态成员函数不可以调用类的非静态成员。因为静态成员函数不含this指针。 
3.静态成员函数不可以同时声明为 virtual、const、volatile函数。举例如下：
class base{ 
    virtual static void func1();//错误 
    static void func2() const;//错误 
    static void func3() volatile;//错误 
};
最后要说的一点是，静态成员是可以独立访问的，也就是说，无须创建任何对象实例就可以访问。