#include "field.h"

#include <cstdlib>
#include <ctime>
#include <iostream>

Field::Field(size_t nrows, size_t ncols)
    : mRows(nrows),
      mCols(ncols),
      mCells(ncols * nrows)
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
    return at(y * mCols + x);
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

void Field::resize(size_t rows, size_t cols)
{
    if (cols < mCols) {
        size_t newIdx = 0;
        for (size_t i=0; i < mRows; ++i) {
            for (size_t j=0; j < cols; ++j) {
                mCells[newIdx++] = mCells[i*mCols + j];
            }
        }
    }
    mCells.resize(rows * cols);
    if (cols > mCols) {
        for (size_t i=rows; i-- > 0; ) {
            for (size_t j=mCols; j < cols; ++j) {
                mCells[i*cols + j] = Cell();
            }
            for (size_t j=mCols; j-- > 0; ) {
                mCells[i*cols + j] = mCells[i*mCols + j];
            }
        }
    }
    mRows = rows;
    mCols = cols;
}
