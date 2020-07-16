SETTINGS_FILE="${PROJECT_ROOT_DIR}/tviewer_py/settings.py"
DB_FILE_PATH="${DATA_DIR}/db.sqlite3"
MANAGE_PY="${PROJECT_ROOT_DIR}/manage.py"

TVIEWER_LOG_FILE_PATH="${LOG_DIR}/tviewer.log"
MIGRATION_LOG_FILE_PATH="${LOG_DIR}/migration.log"
#STATIC_LOG="${PROJECT_ROOT_DIR}/collectstatic.log"


#sed -i 's|DEBUG = True|DEBUG = False|' ${SETTINGS_FILE}
sed -i "s|'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),|'NAME': '${DB_FILE_PATH}',|" ${SETTINGS_FILE}

#python ${MANAGE_PY} collectstatic -v0 --noinput 2>&1 | tee -a ${STATIC_LOG} 
python ${MANAGE_PY} makemigrations 2>&1 | tee -a ${MIGRATION_LOG_FILE_PATH}
python ${MANAGE_PY} migrate 2>&1 | tee -a ${MIGRATION_LOG_FILE_PATH}
python ${MANAGE_PY} runserver 0.0.0.0:80 #2>&1 >> ${TVIEWER_LOG_FILE_PATH} &
#tail -f -n 100 ${TVIEWER_LOG_FILE_PATH}
