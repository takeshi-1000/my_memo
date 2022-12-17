//C++の入出力オブジェクトを
//使用するのに必要
#include <iostream>

int main()
{
    const char *str1 = "Hello";
    const char *str2 = "World";
    int number = 10;

    //文字列も数値もそのまま出力可能
    std::cout << str1 << " " << str2 << " " << number << "\n";

    getchar();
}
