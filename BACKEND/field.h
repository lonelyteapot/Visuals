#ifndef FIELD_H
#define FIELD_H

#include "cell.h"

#include <vector>


class Field
{
public:
    Field(size_t width, size_t height);
    size_t width() { return mWidth; };
    size_t height() { return mHeight; };
    size_t size() { return mWidth * mHeight; };
    Cell& at(size_t idx);
    Cell& at(size_t y, size_t x);
    void clear();
    void randomize();

private:
    size_t mWidth, mHeight;
    std::vector<Cell> mCells;
};

#endif // FIELD_H
