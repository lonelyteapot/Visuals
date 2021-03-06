#ifndef FIELD_H
#define FIELD_H

#include "cell.h"

#include <vector>


class Field
{
public:
    Field(size_t nrows, size_t ncols);
    size_t nrows() { return mRows; };
    size_t ncols() { return mCols; };
    size_t size() { return mCols * mRows; };
    Cell& at(size_t idx);
    Cell& at(size_t y, size_t x);
    void clear();
    void randomize();
    void createRow(const int index);
    void removeRow(const int index);
    void createCol(const int index);
    void removeCol(const int index);

private:
    size_t mRows, mCols;
    std::vector<Cell> mCells;
};

#endif // FIELD_H
