#include <iostream>
#include <ceres/ceres.h>

using namespace std;

class SimpleCostFunction
          : public ceres::SizedCostFunction<1, /* One residual */
                                            1  /* and one free variable */ >
{
public:
    virtual ~SimpleCostFunction() {}
    virtual bool Evaluate(double const* const* parameters,
                          double* residuals,
                          double** jacobians) const {
        double x = parameters[0][0];
        // f(x) = (10 - x)
        residuals[0] = (10 - x);
        cout << "Evaluating at x=" << x << endl;
        if (jacobians != NULL) {
            // Ceres wants to know the derivatives.
            // Fortunately, the function is a polynomial, so it is very easy to find:
            // f'(x) = -1
            cout << "Evaluating derivative at x=" << x << endl;
            jacobians[0][0] = -1;
        }
        return true;
    }
};

void example_simple()
{
    double x = 1; // Initial guess
    ceres::Problem problem;

    problem.AddResidualBlock(new SimpleCostFunction(), NULL, &x);

    ceres::Solver::Options options;
    options.max_num_iterations = 5;

    options.linear_solver_type = ceres::DENSE_QR;
    options.minimizer_progress_to_stdout = true;

    ceres::Solver::Summary summary;
    ceres::Solve(options, &problem, &summary);
    cout << summary.BriefReport() << endl;
    cout << "x: " << x << endl;
}
