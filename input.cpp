#include "input.h"
#include <QDebug>

Register::Register(QObject *parent) : QObject(parent)
{
    m_database = QSqlDatabase::database();
}

bool Register::login(QString username, QString password)
{
    QSqlQuery query1;
    query1.prepare("SELECT username, password FROM players WHERE username = :username AND password = :password");
    query1.bindValue(":username", username);
    query1.bindValue(":password", password);

    if (!query1.exec()) {
        qDebug() << "Query failed!";
        return false;
    }

    if (query1.next()) {
//        qwsname = name;
        qDebug() << "Login successful!";
        return true;
    }
    else {
        qDebug() << "Login failed!";
        return false;
    }
}

bool Register::registerUser(QString username, QString password)
{
    QString fullname;
    QSqlQuery query;

    // Check if the username already exists in the database
    query.prepare("SELECT username FROM players WHERE username = :username");
    query.bindValue(":username", username);

    if (!query.exec()) {
        qDebug() << "Query failed!";
        return false;
    }

    if (query.next()) {
        qDebug() << "Username already exists!";
        return false;
    }

    // Insert the new user into the database
    query.prepare("INSERT INTO players username = :username AND password = :password");
    query.bindValue(":username", username);
    query.bindValue(":password", password);
    if (!query.exec()) {
        qDebug() << "Registration failed!";
        return false;
    }

    qDebug() << "Registration successful!";
    return true;
}

bool Register::updateTechnicalHighScore(QString username, int score) {
    QSqlQuery query;
    query.prepare("UPDATE players SET technicalhighscore = :score WHERE username = :username");
    query.bindValue(":score", score);
    query.bindValue(":username", username);

    if (!query.exec()) {
        qDebug() << "Failed to update technical high score!";
        return false;
    }

    qDebug() << "Technical high score updated!";
    return true;
}

int Register::getTechnicalHighScore(QString username, int score) {
    QSqlQuery query;
    query.prepare("SELECT technicalhighscore FROM players WHERE username = :username AND score = :score");
    query.bindValue(":username", username);

    if (!query.exec()) {
        qDebug() << "Failed to retrieve technical high score!";
        return -1;
    }

    if (query.next()) {
        int highscore = query.value(0).toInt();
        qDebug() << "Retrieved technical high score: " << highscore;
        return highscore;
    } else {
        qDebug() << "Technical high score not found!";
        return -1;
    }
}

void Register::updateHighScore(QString username, int score)
{
    QSqlQuery query;
    query.prepare("UPDATE players SET highscore = :score WHERE username = :username");
    query.bindValue(":score", score);
    query.bindValue(":username", username);

    if (!query.exec()) {
        qDebug() << "Update highscore failed!";
    } else {
        qDebug() << "Highscore updated successfully!";
    }
}
