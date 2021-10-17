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

    State state;
    Cell(State state = EMPTY);

    static Cell NULL_CELL;
};

#endif // CELL_H
