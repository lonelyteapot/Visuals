#ifndef PFALGORITHM_H
#define PFALGORITHM_H

#include "BACKEND/field.h"


class PFAlgorithm
{
public:
    Field& field;

    PFAlgorithm(Field& field);
    virtual void step();
    virtual bool isDone();
};

#endif // PFALGORITHM_H
