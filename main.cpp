#include <iostream>
#include <ceres/ceres.h>

using namespace std;

extern void example_simple();
extern void example_polyfit();
extern void example_polyfit_partial();
extern void example_polyfit_numerical();
extern void example_polyfit_auto();


int main()
{
    //example_simple();
    example_polyfit();
    //example_polyfit_partial();
    //example_polyfit_numerical();
    //example_polyfit_auto();

    return 0;
}

