#include <iostream>
#include <ceres/ceres.h>
#include "printparamscallback.h"

using namespace std;

class PolyFit
        : public ceres::CostFunction
{
public:
    PolyFit(double const* observations, int nobservations):CostFunction() {
        // Each observation will produce one residual.
        // Assume the observations are for times 0, 1, 2, ...
        set_num_residuals(nobservations);
        // One parameter block with 3 free variables
        this->mutable_parameter_block_sizes()->push_back(3);
        this->observations = observations;
    }

    virtual ~PolyFit() {}
    virtual bool Evaluate(double const* const* parameters,
                          double* residuals,
                          double** jacobians) const {

        double a = parameters[0][0];
        double b = parameters[0][1];
        double c = parameters[0][2];
        for (int t = 0; t < this->num_residuals(); t++) {
            double mx = this->observations[t];
            double x = a + b*t + c*t*t;
            residuals[t] = x - mx;
        }
        //cout << "Evaluating at a=" << a << " b=" << b << " c=" << c << endl;
        if (jacobians != NULL && jacobians[0] != NULL) {
            // Ceres wants to know the derivatives.
            // This is getting messy!
            //cout << "Evaluating derivative at a=" << a << " b=" << b << " c=" << c << endl;
            for (int t = 0; t < this->num_residuals(); t++) {
                // df/da (t) = 1
                jacobians[0][t*parameter_block_sizes()[0] + 0] = 1;
                // df/db (t) = t
                jacobians[0][t*parameter_block_sizes()[0] + 1] = t;
                // df/db (t) = t*t;
                jacobians[0][t*parameter_block_sizes()[0] + 2] = t*t;
                //cout << "Adsf" << endl;
            }
        }
        return true;
    }
private:
    double const* observations;
};


void example_polyfit()
{
    double a = 10, b=10, c=10; // Initial guess
    double params[] = {a, b, c}; // initial guess

    // "observations", taken from the polynomial p(x) = 10 + 5*t + 2*t^2, with uniform noise from -2 to 2.
    // Python code: observations = 10 + 5*numpy.linspace(0,99,100) + 2* numpy.linspace(0,99,100)**2 + (numpy.random.random(100)-.5)*2
    //double observations[] = {9.61485199453,16.3904095922,27.3379351435,43.784662931,61.9556496284,85.436242365,112.446001779,143.604332112,178.627371357,217.398610492,259.964675421,307.762473688,358.041440164,412.395433887,471.106708258,535.757181694,601.85060885,672.44562201,747.302028361,826.747554248,909.820803251,996.858703803,1087.8749649,1182.09006436,1282.17619704,1385.8759064,1492.07427196,1603.96378293,1718.42236191,1836.77085004,1960.45656169,2086.16769842,2218.1030151,2352.33490438,2492.13603915,2634.15288273,2782.48480872,2933.37220554,3088.76297992,3246.99132483,3410.18875374,3576.19858193,3747.34496714,3923.60941733,4101.93669809,4285.91685623,4472.13519919,4662.73434191,4858.96085699,5057.35711046,5260.79820964,5466.62304853,5677.04752122,5892.43327521,6112.07145353,6335.84290988,6561.54590014,6793.77376293,7027.75450478,7266.07328589,7509.22038353,7757.32146611,8008.51422234,8262.32752892,8522.86733065,8785.81698379,9051.40177596,9323.75721908,9598.45990406,9876.43287638,10159.734097,10447.6862468,10737.316046,11033.5096588,11331.7054689,11634.1289225,11941.4134993,12253.6800236,12568.1783992,12887.9572771,13210.190505,13536.8718361,13868.9542715,14203.5403126,14542.2736057,14884.1090435,15231.1519304,15583.846936,15937.0978432,16296.0949195,16659.045643,17027.72858,17398.8427279,17772.1637077,18151.2632716,18534.7228911,18922.3154239,19312.4371896,19707.4311846,20107.5715636};
    // These are the exact values
    double observations[] = {10.0,17.0,28.0,43.0,62.0,85.0,112.0,143.0,178.0,217.0,260.0,307.0,358.0,413.0,472.0,535.0,602.0,673.0,748.0,827.0,910.0,997.0,1088.0,1183.0,1282.0,1385.0,1492.0,1603.0,1718.0,1837.0,1960.0,2087.0,2218.0,2353.0,2492.0,2635.0,2782.0,2933.0,3088.0,3247.0,3410.0,3577.0,3748.0,3923.0,4102.0,4285.0,4472.0,4663.0,4858.0,5057.0,5260.0,5467.0,5678.0,5893.0,6112.0,6335.0,6562.0,6793.0,7028.0,7267.0,7510.0,7757.0,8008.0,8263.0,8522.0,8785.0,9052.0,9323.0,9598.0,9877.0,10160.0,10447.0,10738.0,11033.0,11332.0,11635.0,11942.0,12253.0,12568.0,12887.0,13210.0,13537.0,13868.0,14203.0,14542.0,14885.0,15232.0,15583.0,15938.0,16297.0,16660.0,17027.0,17398.0,17773.0,18152.0,18535.0,18922.0,19313.0,19708.0,20107.0};
    ceres::Problem problem;

    //problem.AddResidualBlock(new PolyFit(observations, 100), NULL, &a, &b, &c);
    problem.AddResidualBlock(new PolyFit(observations, 100), NULL, params);

    ceres::Solver::Options options;
    options.max_num_iterations = 50;

    options.linear_solver_type = ceres::DENSE_QR;
    options.minimizer_progress_to_stdout = true;

    PrintParamsCallback callback(params, 3);
    options.callbacks.push_back(&callback);

    ceres::Solver::Summary summary;
    ceres::Solve(options, &problem, &summary);
    cout << summary.BriefReport() << endl;
    cout << params[0] <<" + " << params[1] <<"*t + " << params[2] << "*t^2" << endl;
}
