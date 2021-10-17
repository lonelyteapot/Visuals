#ifndef PATHFINDINGALGORITHM_H
#define PATHFINDINGALGORITHM_H

#include "field.h"


class PathFindingAlgorithm
{
public:
    Field& field;

    PathFindingAlgorithm(Field& field);
    virtual void step();
    virtual bool isDone();
};

#endif // PATHFINDINGALGORITHM_H
