#ifndef CELL_H
#define CELL_H


class Cell
{
public:
    enum State {
        EMPTY,
        WALL,
        TARGET,
        VISITED,
    };

    State state = EMPTY;
    Cell();
};

#endif // CELL_H
