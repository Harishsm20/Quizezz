#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtSql>
#include "input.h"





int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    // Register the Register class for use in QML
    qmlRegisterType<Register>("com.example.login", 1, 0, "Register");

    // Set up the SQLite database connection with the new database name
    QSqlDatabase m_database = QSqlDatabase::addDatabase("QSQLITE");
    m_database.setDatabaseName("C:/Users/jaisu/Downloads/DB.Browser.for.SQLite-3.12.2-win32/DB Browser for SQLite/input.db");

    if (!m_database.open()) {
        qDebug() << "Failed to open database!";
        return -1;
    }

    // Create the new table if it doesn't already exist
    QSqlQuery query;
    if (!query.exec("CREATE TABLE IF NOT EXISTS players (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT, highscore INTEGER)")) {
        qDebug() << "Failed to create table!";
        return -1;
    }

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
