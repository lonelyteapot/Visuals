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
    while (mRows < rows) {
        createRow(mRows % 2 ? mRows : 0);
    }
    while (mRows > rows) {
        removeRow(mRows % 2 ? 0 : mRows-1);
    }
    while (mCols < cols) {
        createCol(mCols % 2 ? mCols : 0);
    }
    while (mCols > cols) {
        removeCol(mCols % 2 ? 0 : mCols-1);
    }
}

void Field::createRow(const int index)
{
    mCells.resize((mRows+1) * mCols);
    for (int j = mCols - 1; j >= 0; --j) {
        for (int i = mRows; i > index; --i) {
            mCells[i*mCols + j] = mCells[(i-1)*mCols + j];
        }
        mCells[index*mCols + j] = {};
    }
    mRows += 1;
}

void Field::removeRow(const int index)
{
    mRows -= 1;
    for (int j = 0; j < mCols; ++j) {
        for (int i = index; i < mRows; ++i) {
            mCells[i*mCols + j] = mCells[(i+1)*mCols + j];
        }
    }
    mCells.resize(mRows * mCols);
}

void Field::createCol(const int index)
{
    mCells.resize(mRows * (mCols+1));
    for (int i = mRows - 1; i >= 0; --i) {
        for (int j = mCols; j >= index; --j) {
            mCells[i*(mCols+1) + j] = mCells[i*mCols + j - 1];
        }
        mCells[i*(mCols+1) + index] = {};
        for (int j = index-1; j >= 0; --j) {
            mCells[i*(mCols+1) + j] = mCells[i*mCols + j];
        }
    }
    mCols += 1;
}

void Field::removeCol(const int index)
{
    mCols -= 1;
    for (int i = 0; i < mRows; ++i) {
        for (int j = 0; j < index; ++j) {
            mCells[i*mCols + j] = mCells[i*(mCols+1) + j];
        }
        for (int j = index; j < mCols; ++j) {
            mCells[i*mCols + j] = mCells[i*(mCols+1) + j + 1];
        }
    }
    mCells.resize(mRows * mCols);
}

