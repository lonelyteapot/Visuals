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
