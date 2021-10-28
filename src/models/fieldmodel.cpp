#include "fieldmodel.h"


FieldModel::FieldModel(Field& field)
    : field(field)
{
}

int FieldModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return field.nrows();
}

int FieldModel::columnCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return field.ncols();
}

QVariant FieldModel::data(const QModelIndex &index, int role) const
{
    if (role == StateRole) {
        return field.at(index.row(), index.column()).state;
    }
    return QVariant();
}

bool FieldModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (role == StateRole) {
        auto newState = value.value<Cell::State>();
        auto& oldState = field.at(index.row(), index.column()).state;
        if (newState == oldState)
            return false;
        oldState = newState;
        emit dataChanged(index, index, {role});
        return true;
    }
    return false;
}

QHash<int, QByteArray> FieldModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[StateRole] = "state";
    return roles;
}

void FieldModel::resize(int rows, int cols)
{
    QModelIndex parent {};
    if (rows < 0) rows = 0;
    if (cols < 0) cols = 0;
    auto oldRows = rowCount(parent);
    auto oldCols = columnCount(parent);

    if (rows > oldRows)      beginInsertRows(parent, oldRows, rows-1);
    else if (rows < oldRows) beginRemoveRows(parent, rows, oldRows-1);
    if (cols > oldCols)      beginInsertColumns(parent, oldCols, cols-1);
    else if (cols < oldCols) beginRemoveColumns(parent, cols, oldCols-1);

    field.resize(rows, cols);

    if (rows > oldRows)      endInsertRows();
    else if (rows < oldRows) endRemoveRows();
    if (cols > oldCols)      endInsertColumns();
    else if (cols < oldCols) endRemoveColumns();
}

void FieldModel::resizeVer(const int rows)
{
    const QModelIndex parent {};
    while (field.nrows() < rows) {
        const int index = field.nrows() % 2 ? 0 : field.nrows();
        beginInsertRows(parent, index, index);
        field.createRow(index);
        endInsertRows();
    }
    while (field.nrows() > rows) {
        const int index = field.nrows() % 2 ? field.nrows() - 1 : 0;
        beginRemoveRows(parent, index, index);
        field.removeRow(index);
        endRemoveRows();
    }
}

void FieldModel::resizeHor(const int cols)
{
    const QModelIndex parent = QModelIndex();
    while (field.ncols() < cols) {
        const int index = field.ncols() % 2 ? 0 : field.ncols();
        beginInsertColumns(parent, index, index);
        field.createCol(index);
        endInsertColumns();
    }
    while (field.ncols() > cols) {
        const int index = field.ncols() % 2 ? field.ncols() - 1 : 0;
        beginRemoveColumns(parent, index, index);
        field.removeCol(index);
        endRemoveColumns();
    }
}

void FieldModel::setStateAt(int row, int col, Cell::State state)
{
    setData(index(row, col), state, Roles::StateRole);
}

void FieldModel::clearField()
{
    field.clear();
    emit dataChanged(
                index(0, 0),
                index(field.nrows()-1, field.ncols()-1),
                {StateRole}
                );
}

void FieldModel::randomizeField()
{
    field.randomize();
    emit dataChanged(
                index(0, 0),
                index(field.nrows()-1, field.ncols()-1),
                {StateRole}
                );
}
