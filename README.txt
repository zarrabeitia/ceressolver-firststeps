
A few weeks ago, Google open sourced it's non-linear least squared solver.
I decided to learn how to use it, and to teach a few others who may 
encounter a least squared problem.

I wrote this code to learn how to use Ceres (and to learn how to use the QT Creator, but 
that's another topic). The problem I'm "solving" is very simple, it isn't even
non-linear (just a quadratic fitting). My goal was to focus on how to interface with Ceres:

- writing the full cost function and jacobian, as with most optimization packages, i.e, only one residual block (polyfit.cpp)
- splitting the full cont function into several, one per measurement, i.e, multiple residual blocks (polyfit_partial.cpp)
- using the numerical derivatives instead of writing the jacobian. A bit more cumbersome that other solvers. (polyfit_numerical.cpp)
- using automatic differentiation. First time I see a solver that includes an AD module. Kudos to the authors, I'm impressed. (polyfit_auto.cpp)
- using a loss function (Huber) to deal with outliers (polyfit_auto with the loss parameter).

YOU PROBABLY DON'T NEED and don't want this code.

To compile:

- You'll need ceres and glog. Download those, compile them, and place them in the "3rdparty" subdirectory. There are some files there already.
  The .a files will probably not work in your system, so you'll need to replace them, or to change the .pro file (or Makefile) to point at 
  the path where you have ceres ang glog.

