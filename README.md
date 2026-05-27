### Hexlet tests and linter status:
[![Actions Status](https://github.com/zerg959/devops-for-developers-project-76/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/zerg959/devops-for-developers-project-76/actions)


## Доступ к приложению
- **Балансировщик (HTTPS):** [https://hub959.ru](https://hub959.ru)
- **Прямой доступ Web1:** `http://109.68.212.60:3000`
- **Прямой доступ Web2:** `http://46.19.64.62:3000`

---

##  Описание
Проект автоматизирует подготовку двух веб-серверов и деплой приложения **Redmine** в Docker-контейнерах с помощью Ansible. Трафик распределяется через балансировщик нагрузки Timeweb Cloud с терминированием TLS.


## Предварительные требования
- Локальная машина с Linux/macOS/WSL
- Установленный `ansible-core` (2.12+)
- Доступ по SSH к целевым серверам под пользователем `root`
- Аккаунт в облачном провайдере для настройки балансировщика и DNS

##  Инструкции и команды

### 1. Настройка SSH-доступа
Сгенерируйте ключ (если ещё нет) и скопируйте на серверы:
```bash
ssh-keygen -t ed25519 -f ~/.ssh/ansible_deploy -N ""
ssh-copy-id -i ~/.ssh/ansible_deploy.pub root@ваш_ip
ssh-copy-id -i ~/.ssh/ansible_deploy.pub root@ваш_ip
```
### 2. Подготовка окружения и серверов
```bash
make prepare
```
### 3. Деплой приложения
Запустите развёртывание Redmine:
```bash
make deploy
```
### 4. Проверка работоспособности
```bash
# Проверка доступности хостов
ansible -i inventory.ini webservers -m ping
```
## Конфигурация

Все настраиваемые параметры вынесены в group_vars/all.yml:
- redmine_port - Внешний порт приложения - 3000
- redmine_db_password - Пароль базы данных PostgreSQL - redmine123
- redmine_secret_key - Секретный ключ - super_secret_key_2026
- ansible_user - Пользователь для SSH - root