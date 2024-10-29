#include "calculator_engine.h"

#include <QJSEngine>

#include <iostream>


CalculatorEngine::CalculatorEngine(QObject *parent): QObject(parent)
{

}

QString CalculatorEngine::calculateExpr(const QString &expr) const
{
    QJSEngine engine;
    QJSValue res = engine.evaluate(expr);

    if (res.isError())
    {
        emit error("Expression is not valid.");
        return expr;
    }

    return res.toString();
}
