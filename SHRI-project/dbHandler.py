import sqlite3

AGENDADATABASE = "agenda.db"
OFFICEDATABASE = "office.db"


# ********************************************* OFFICE DB *****************************************
def creation_officeDB():
    conn = sqlite3.connect(OFFICEDATABASE)
    c= conn.cursor()
    c.execute("""
    CREATE TABLE IF NOT EXISTS office(
        id integer primary key AUTOINCREMENT NOT NULL,
        object text not null ,
        position text not null,
        information text
        );
    """)
    conn.commit()
    conn.close()


def addRowODB(object,position, information = None):
    conn = sqlite3.connect(OFFICEDATABASE)
    c = conn.cursor()
    c.execute("INSERT INTO office VALUES (null,?,?,?)",(object,position,information))
    conn.commit()
    conn.close()

def showRowsODB():
    conn = sqlite3.connect(OFFICEDATABASE)
    c = conn.cursor()
    c.execute("SELECT * FROM office")
    items = c.fetchall()
    print(items)

def doQueryODB(query):
    conn = sqlite3.connect(OFFICEDATABASE)
    c = conn.cursor()
    c.execute(query)
    items = c.fetchall()
    return  items

def deleteByIdODB(id):
    conn = sqlite3.connect(OFFICEDATABASE)
    c = conn.cursor()
    c.execute("DELETE FROM office where ID = ?",(id,))
    conn.commit()
    conn.close()

# ********************************************* AGENDA DB *****************************************
def creation_agendaDB():
    conn = sqlite3.connect(AGENDADATABASE)
    c= conn.cursor()
    c.execute("""
    CREATE TABLE IF NOT EXISTS agenda(
        id integer primary key AUTOINCREMENT NOT NULL,
        date text not null ,
        event text not null ,
        information text
        );
    """)
    conn.commit()
    conn.close()


def addRowADB(day,event, information = None):
    conn = sqlite3.connect(AGENDADATABASE)
    c = conn.cursor()
    c.execute("INSERT INTO agenda VALUES (null,?,?,?)",(day,event,information))
    conn.commit()
    conn.close()

def showRowsADB():
    conn = sqlite3.connect(AGENDADATABASE)
    c = conn.cursor()
    c.execute("SELECT * FROM agenda")
    items = c.fetchall()
    print(items)

def doQueryADB(query):
    conn = sqlite3.connect(AGENDADATABASE)
    c = conn.cursor()
    c.execute(query)
    items = c.fetchall()
    return  items

def deleteByIdADB(id):
    conn = sqlite3.connect(AGENDADATABASE)
    c = conn.cursor()
    c.execute("DELETE FROM agenda where ID = ?",(id,))
    conn.commit()
    conn.close()

