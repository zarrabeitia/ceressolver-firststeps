#include <iostream>
#include <ceres/ceres.h>

using namespace std;

extern void example_simple();
extern void example_polyfit();
extern void example_polyfit_partial();
extern void example_polyfit_numerical();
extern void example_polyfit_auto(ceres::LossFunction * loss = NULL);


int main()
{
    //example_simple();
    //example_polyfit();
    //example_polyfit_partial();
    //example_polyfit_numerical();
    example_polyfit_auto();
    ceres::LossFunction *loss = new ceres::HuberLoss(1.0);
    example_polyfit_auto(loss);
    delete loss;

    return 0;
}

