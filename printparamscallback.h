#ifndef PRINTPARAMSCALLBACK_H
#define PRINTPARAMSCALLBACK_H
#include "ceres/ceres.h"
#include <stdlib.h>
#include <iostream>

using namespace std;

class PrintParamsCallback: public ceres::IterationCallback {
public:
    PrintParamsCallback(double* params, int num_params):params(params), num_params(num_params) {}

    virtual ceres::CallbackReturnType operator()(const ceres::IterationSummary& summary);
private:
    double * params;
    int num_params;
};

#endif // PRINTPARAMSCALLBACK_H
