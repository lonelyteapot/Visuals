#ifndef FIELDMODEL_H
#define FIELDMODEL_H

#include <QAbstractTableModel>

#include "src/objects/field.h"

class FieldModel : public QAbstractTableModel
{
    Q_OBJECT

public:
    enum Roles {
        StateRole = Qt::UserRole + 1
    };

    FieldModel(Field& field);

    int rowCount(const QModelIndex &parent) const;
    int columnCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    bool setData(const QModelIndex &index, const QVariant &value, int role);
    QHash<int, QByteArray> roleNames() const;
    Q_INVOKABLE void resize(int rows, int cols);
    Q_INVOKABLE void setStateAt(int row, int col, Cell::State state);

public slots:
    void clearField();
    void randomizeField();

private:
    Field& field;
};

#endif // FIELDMODEL_H
