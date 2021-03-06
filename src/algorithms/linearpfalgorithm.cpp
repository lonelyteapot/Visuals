#include "linearpfalgorithm.h"

LinearPFAlgorithm::LinearPFAlgorithm(Field& field)
    : PFAlgorithm(field)
{
}

void LinearPFAlgorithm::step() {
    field.at(curI, curJ).state = Cell::VISITED;
    if (++curJ >= field.ncols()) {
        curI += 1;
        curJ = 0;
    }
}

bool LinearPFAlgorithm::isDone()
{
    auto curCell = field.at(curI, curJ);
    return (&curCell == &NULL_CELL) || (curCell.state == Cell::TARGET);
}
