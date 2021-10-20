#include "fieldmodel.h"

#include <iostream>


FieldModel::FieldModel(Field& field)
    : field(field)
{
}

int FieldModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return field.height();
}

int FieldModel::columnCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return field.width();
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
