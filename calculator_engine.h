#ifndef CALCULATOR_ENGINE_H
#define CALCULATOR_ENGINE_H

#include <QObject>

class CalculatorEngine: public QObject
{
    Q_OBJECT

public:
    explicit CalculatorEngine(QObject *parent);

    Q_INVOKABLE QString calculateExpr(const QString &expr) const;

signals:
    void error(const QString &description) const;
};

#endif // CALCULATOR_ENGINE_H
