#ifndef PFALGORITHM_H
#define PFALGORITHM_H

#include "src/objects/field.h"


class PFAlgorithm
{
public:
    Field& field;

    PFAlgorithm(Field& field);
    virtual void step() = 0;
    virtual bool isDone() = 0;
};

#endif // PFALGORITHM_H
