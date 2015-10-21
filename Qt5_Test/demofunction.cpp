#include "demofunction.h"
#include <QFont>
DemoFunction::DemoFunction()
{

}

QString DemoFunction::callme()
{
    QFont a("Arial", 50);
    return "Call C++ Function";
}

