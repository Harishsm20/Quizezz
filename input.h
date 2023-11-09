#include<QFile>
#include<QDebug>
#ifndef INPUT_H
#define INPUT_H
#include <QObject>
#include <QtSql>

class Register : public QObject
{
Q_OBJECT
public:
explicit Register(QObject *parent = nullptr);
// void writeData();
signals:
public slots:
bool login(QString username, QString password);
bool registerUser(QString username, QString password);
int getTechnicalHighScore(QString username,int score);
bool updateTechnicalHighScore(QString username, int score);
void updateHighScore(QString username, int score);

private:
QSqlDatabase m_database;
};


#endif // Register_H
