#include <iostream>
//Config.h is generated and configured by cmake 
#include "Config.h" 
#include <answer/answer.hpp>

int main(int argc, const char *argv[]) {
// this line is test for cmake configured header file
#ifdef USE_TEST
        std::cout << "User has set USE_TEST on!" << std::endl;
#endif
    for (;;) {
        std::cout << "What is the ultimate answer?" << std::endl;
        std::string answer;
        std::cin >> answer;
        auto expected_answer = answer::find_the_ultimate_answer();
        if (answer == expected_answer) {
            std::cout << "Correct!" << std::endl;
            break;
        }
    }
    return 0;
}
