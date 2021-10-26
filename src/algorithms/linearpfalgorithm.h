#ifndef LINEARPFALGORITHM_H
#define LINEARPFALGORITHM_H

#include "pfalgorithm.h"

class LinearPFAlgorithm : public PFAlgorithm
{
public:
    LinearPFAlgorithm(Field& field);
    void step();
    bool isDone();
private:
    size_t curI = 0;
    size_t curJ = 0;
};

#endif // LINEARPFALGORITHM_H
