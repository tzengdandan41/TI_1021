#ifndef DEMOFUNCTION_H
#define DEMOFUNCTION_H

#include <QObject>

class DemoFunction: public QObject
{
    Q_OBJECT
public:
    DemoFunction();
    Q_INVOKABLE QString callme();
};

#endif // DEMOFUNCTION_H
