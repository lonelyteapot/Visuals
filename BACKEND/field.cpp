#include "field.h"

#include <cstdlib>
#include <ctime>

Field::Field(size_t width, size_t height)
    : mWidth(width),
      mHeight(height),
      mCells(width * height)
{
}

Cell &Field::at(size_t idx)
{
    if (idx < 0 || idx >= size()) {
        // Out of field bounds
        return NULL_CELL;
    }
    return mCells[idx];
}

Cell &Field::at(size_t y, size_t x)
{
    return at(y * mWidth + x);
}

void Field::clear()
{
    for (size_t idx=0; idx < size(); ++idx) {
        at(idx).state = Cell::EMPTY;
    }
}

void Field::randomize()
{
    if (size() == 0)
        return;
    for (size_t idx=0; idx < size(); ++idx) {
        at(idx).state = (std::rand() % 10 < 7 ? Cell::EMPTY : Cell::WALL);
    }
    at(std::rand() % size()).state = Cell::TARGET;
}
