USE HomeLibrary;
GO

PRINT N'=== HomeLibrary deploy: Start insert default data ===';

INSERT INTO Books
(
    Title,
    Author,
    PublicationYear,
    Contents
)
VALUES
(
    N'CLR via C#',
    N'Джеффри Рихтер',
    2022,
    N'
    <contents>
        <chapter number="1">
            <title>Основы CLR</title>
        </chapter>
        <chapter number="2">
            <title>Управление памятью</title>
            <chapter number="2.1">
                <title>Garbage Collector</title>
            </chapter>
            <chapter number="2.2">
                <title>Работа с объектами</title>
            </chapter>
        </chapter>
        <chapter number="3">
            <title>Потоки выполнения</title>
        </chapter>
    </contents>'
),
(
    N'ASP.NET Core в действии',
    N'Эндрю Лок',
    2023,
    N'
    <contents>
        <chapter number="1">
            <title>Введение в ASP.NET Core</title>
        </chapter>
        <chapter number="2">
            <title>Middleware</title>
        </chapter>
        <chapter number="3">
            <title>MVC архитектура</title>
            <chapter number="3.1">
                <title>Controllers</title>
            </chapter>
            <chapter number="3.2">
                <title>Razor Views</title>
            </chapter>
        </chapter>
    </contents>'
),
(
    N'SQL Server для разработчиков',
    N'Иван Иванов',
    2021,
    N'
    <contents>
        <chapter number="1">
            <title>Основы SQL</title>
        </chapter>
        <chapter number="2">
            <title>Хранимые процедуры</title>
        </chapter>
        <chapter number="3">
            <title>Транзакции</title>
        </chapter>
        <chapter number="4">
            <title>Индексы</title>
        </chapter>
    </contents>'
),
(
    N'Паттерны проектирования',
    N'Эрих Гамма',
    1995,
    N'
    <contents>
        <chapter number="1">
            <title>Что такое паттерны</title>
        </chapter>
        <chapter number="2">
            <title>Порождающие паттерны</title>
        </chapter>
        <chapter number="3">
            <title>Структурные паттерны</title>
        </chapter>
        <chapter number="4">
            <title>Поведенческие паттерны</title>
        </chapter>
    </contents>'
),
(
    N'Чистый код',
    N'Роберт Мартин',
    2020,
    N'
    <contents>
        <chapter number="1">
            <title>Хороший код</title>
        </chapter>
        <chapter number="2">
            <title>Имена</title>
        </chapter>
        <chapter number="3">
            <title>Функции</title>
        </chapter>
        <chapter number="4">
            <title>Комментарии</title>
        </chapter>
    </contents>'
);
GO

PRINT N'=== HomeLibrary deploy: End insert default data ===';