CREATE DATABASE NEX;
USE NEX;
CREATE TABLE developers (
    developer_name VARCHAR(100),
    PRIMARY KEY (developer_name)
);
CREATE TABLE categories (
    category_name VARCHAR(100),
    PRIMARY KEY (category_name)
);
CREATE TABLE functions (
    function_name VARCHAR(150),
    PRIMARY KEY (function_name)
);

CREATE TABLE data_types (
    data_type_name VARCHAR(50),
    PRIMARY KEY (data_type_name)
);

CREATE TABLE sources (
    source_url VARCHAR(255),
    PRIMARY KEY (source_url)
);

CREATE TABLE record_statuses (
    status_name VARCHAR(30),
    PRIMARY KEY (status_name)
);

CREATE TABLE currencies (
    currency_code VARCHAR(10),
    PRIMARY KEY (currency_code)
);

CREATE TABLE ai_tools (
    ai_tool_name VARCHAR(100),
    developer VARCHAR(100),
    purpose TEXT,
    free_version BOOLEAN,
    official_source VARCHAR(255),
    last_checked DATE,
    last_updated DATE,
    record_status VARCHAR(30),
    PRIMARY KEY (ai_tool_name)
);

CREATE TABLE tariffs (
    ai_tool_name VARCHAR(100),
    tariff_name VARCHAR(100),
    price DECIMAL(10,2),
    currency VARCHAR(10),
    payment_period VARCHAR(30),
    tariff_features TEXT,
    limitations TEXT,
    PRIMARY KEY (ai_tool_name, tariff_name)
);
CREATE TABLE ai_characteristics (
    ai_tool_name VARCHAR(100),
    category VARCHAR(100),
    main_function VARCHAR(150),
    data_type VARCHAR(50),
    PRIMARY KEY (
        ai_tool_name,
        category,
        main_function,
        data_type
    )
);


ALTER TABLE ai_tools
ADD FOREIGN KEY (developer)
REFERENCES developers(developer_name);

ALTER TABLE ai_tools
ADD FOREIGN KEY (official_source)
REFERENCES sources(source_url);

ALTER TABLE ai_tools
ADD FOREIGN KEY (record_status)
REFERENCES record_statuses(status_name);

ALTER TABLE tariffs
ADD FOREIGN KEY (ai_tool_name)
REFERENCES ai_tools(ai_tool_name);

ALTER TABLE tariffs
ADD FOREIGN KEY (currency)
REFERENCES currencies(currency_code);

ALTER TABLE ai_characteristics
ADD FOREIGN KEY (ai_tool_name)
REFERENCES ai_tools(ai_tool_name);

ALTER TABLE ai_characteristics
ADD FOREIGN KEY (category)
REFERENCES categories(category_name);
ALTER TABLE ai_characteristics
ADD FOREIGN KEY (main_function)
REFERENCES functions(function_name);
ALTER TABLE ai_characteristics
ADD FOREIGN KEY (data_type)
REFERENCES data_types(data_type_name);
INSERT INTO developers (developer_name)
VALUES
('OpenAI'),
('Anthropic'),
('Google'),
('DeepSeek'),
('Perplexity AI'),
('Mistral AI'),
('Alibaba Cloud'),
('xAI');
INSERT INTO categories (category_name)
VALUES
('Работа с текстом'),
('Программирование'),
('Работа с документами'),
('Работа с изображениями'),
('Поиск информации');
INSERT INTO functions (function_name)
VALUES
('Генерация и редактирование текста'),
('Генерация и анализ программного кода'),
('Анализ и создание текстов'),
('Анализ документов'),
('Генерация и анализ текста'),
('Анализ изображений'),
('Генерация ответов и рассуждение'),
('Генерация программного кода'),
('Поиск и анализ информации'),
('Генерация и обработка текста'),
('Генерация текста'),
('Генерация ответов'),
('Поиск и анализ актуальной информации');

INSERT INTO data_types (data_type_name)
VALUES
('Текст'),
('Изображения'),
('Файлы');
INSERT INTO sources (source_url)
VALUES
('https://chatgpt.com/'),
('https://claude.ai/'),
('https://gemini.google.com/'),
('https://chat.deepseek.com/'),
('https://www.perplexity.ai/'),
('https://chat.mistral.ai/'),
('https://chat.qwen.ai/'),
('https://grok.com/');
INSERT INTO record_statuses (status_name)
VALUES
('Актуальная'),
('Требует проверки');
INSERT INTO currencies (currency_code)
VALUES
('USD'),
('EUR');
INSERT INTO ai_tools
(ai_tool_name, developer, purpose, free_version,
official_source, last_checked, last_updated, record_status)
VALUES
('ChatGPT', 'OpenAI',
'Работа с текстом, анализ информации и создание контента',
1, 'https://chatgpt.com/',
'2026-10-16', '2026-10-16', 'Актуальная'),
('Claude', 'Anthropic',
'Работа с текстом, документами и программным кодом',
1, 'https://claude.ai/',
'2026-10-16', '2026-10-16', 'Актуальная'),
('Gemini', 'Google',
'Работа с текстом, изображениями и другими типами данных',
1, 'https://gemini.google.com/',
'2026-10-16', '2026-10-16', 'Актуальная'),
('DeepSeek', 'DeepSeek',
'Работа с текстом, рассуждения и программирование',
1, 'https://chat.deepseek.com/',
'2026-10-16', '2026-10-16', 'Актуальная'),
('Perplexity', 'Perplexity AI',
'Поиск и анализ информации',
1, 'https://www.perplexity.ai/',
'2026-10-16', '2026-10-16', 'Актуальная'),
('Mistral Le Chat', 'Mistral AI',
'Работа с текстом, поиск информации и генерация ответов',
1, 'https://chat.mistral.ai/',
'2026-10-16', '2026-10-16', 'Актуальная'),
('Qwen', 'Alibaba Cloud',
'Работа с текстом, изображениями и программным кодом',
1, 'https://chat.qwen.ai/',
'2026-10-16', '2026-10-16', 'Актуальная'),
('Grok', 'xAI',
'Работа с текстом, поиск и анализ информации',
1, 'https://grok.com/',
'2026-10-16', '2026-10-16', 'Актуальная');
INSERT INTO tariffs
(ai_tool_name, tariff_name, price, currency,
payment_period, tariff_features, limitations)
VALUES
('ChatGPT', 'Free', 0, 'USD', 'Месяц',
'Базовый доступ к сервису',
'Есть ограничения по использованию'),
('Claude', 'Free', 0, 'USD', 'Месяц',
'Работа с текстом и файлами',
'Ограниченное количество запросов'),
('Gemini', 'Free', 0, 'USD', 'Месяц',
'Работа с текстом и изображениями',
'Часть расширенных возможностей недоступна'),
('DeepSeek', 'Free', 0, 'USD', 'Месяц',
'Работа с текстом и программным кодом',
'Возможны ограничения при высокой нагрузке'),
('Perplexity', 'Free', 0, 'USD', 'Месяц',
'Поиск информации и ответы со ссылками',
'Ограниченный доступ к расширенным функциям'),
('Mistral Le Chat', 'Free', 0, 'EUR', 'Месяц',
'Работа с текстом и генерация ответов',
'Ограничения бесплатной версии'),
('Qwen', 'Free', 0, 'USD', 'Месяц',
'Работа с текстом, изображениями и кодом',
'Ограничения бесплатного доступа'),
('Grok', 'Free', 0, 'USD', 'Месяц',
'Работа с текстом и поиск информации',
'Ограничения по количеству запросов');
INSERT INTO ai_characteristics
(ai_tool_name, category, main_function, data_type)
VALUES
('ChatGPT', 'Работа с текстом',
'Генерация и редактирование текста', 'Текст'),
('ChatGPT', 'Программирование',
'Генерация и анализ программного кода', 'Текст'),
('Claude', 'Работа с текстом',
'Анализ и создание текстов', 'Текст'),
('Claude', 'Работа с документами',
'Анализ документов', 'Файлы'),
('Gemini', 'Работа с текстом',
'Генерация и анализ текста', 'Текст'),

('Gemini', 'Работа с изображениями',
'Анализ изображений', 'Изображения'),

('DeepSeek', 'Работа с текстом',
'Генерация ответов и рассуждение', 'Текст'),
('DeepSeek', 'Программирование',
'Генерация программного кода', 'Текст'),
('Perplexity', 'Поиск информации',
'Поиск и анализ информации', 'Текст'),
('Mistral Le Chat', 'Работа с текстом',
'Генерация и обработка текста', 'Текст'),
('Qwen', 'Работа с текстом',
'Генерация текста', 'Текст'),
('Qwen', 'Работа с изображениями',
'Анализ изображений', 'Изображения'),
('Grok', 'Работа с текстом',
'Генерация ответов', 'Текст'),
('Grok', 'Поиск информации',
'Поиск и анализ актуальной информации', 'Текст');
INSERT INTO ai_tools (ai_tool_name)
VALUES ('TestAI');
UPDATE ai_tools
SET purpose = 'Тестовая запись'
WHERE ai_tool_name = 'TestAI';
DELETE FROM ai_tools
WHERE ai_tool_name = 'TestAI';
CREATE USER 'nex_content_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE
ON NEX.*
TO 'nex_content_manager'@'localhost';
CREATE USER 'nex_analyst'@'localhost';
GRANT SELECT
ON NEX.*
TO 'nex_analyst'@'localhost';


CREATE USER 'nex_admin'@'localhost';

GRANT ALL PRIVILEGES
ON NEX.*
TO 'nex_admin'@'localhost';
CREATE USER 'nex_user'@'localhost';
GRANT SELECT
ON NEX.*
TO 'nex_user'@'localhost';


USE NEX;
DESCRIBE ai_tools;
DESCRIBE tariffs;
DESCRIBE ai_characteristics;
DESCRIBE developers;
DESCRIBE categories;
DESCRIBE functions;
DESCRIBE data_types;
DESCRIBE sources;
DESCRIBE record_statuses;
DESCRIBE currencies;
