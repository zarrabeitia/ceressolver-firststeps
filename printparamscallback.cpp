#include "printparamscallback.h"

ceres::CallbackReturnType PrintParamsCallback::operator()(const ceres::IterationSummary& summary) {
    cout << "Params: ";
    for (int i = 0; i < num_params; i++) {
        cout << params[i] << ",";
    }
    cout << endl;
    return ceres::SOLVER_ABORT;
}
