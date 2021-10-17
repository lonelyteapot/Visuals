#include "field.h"

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
        return Cell::NULL_CELL;
    }
    return mCells[idx];
}

Cell &Field::at(size_t y, size_t x)
{
    return at(y * mWidth + x);
}
