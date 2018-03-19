
-- SET SERVEROUTPUT ON FORMAT WRAPPED SIZE 10000;-
-- SET VERIFY OFF; -- Se verifica el tipo para no tener problemas de verificación.

/*
-- EN PL Accedemos a tablas y nombres bien puestos...
-- Las variables de mi código van con x_, v_ para no coincidir con un campo de la BBDD.
-- para distinguir las variables de campos de la base de datos a las que estoy accediendo.

DECLARE

    x_entero INT := 5;
    -- v_dni VARCHAR(20) := '&dni'; -- Provoca el uso del developer te pida un valor....

BEGIN

    dbms_output.put_line('Hello world!: ' || x_entero);
--    dbms_output.put_line('Hola: ' || v_dni);

    --select count(*) from clientes;  -- an INTO CLAUSE, no se puede hacer una select a pelo en PL/SQL
                                    -- Si puedo hacer insert update o delete por que no espero respuesta.
                                    -- de la base de datos.

    select count(*) into x_entero from productos where UDS_EXISTENCIA < 3;
    dbms_output.put_line('Hay: ' || x_entero || ' clientes');


    select UDS_EXISTENCIA into x_entero from productos where UDS_EXISTENCIA < 3;
    dbms_output.put_line('Hay: ' || x_entero || ' existencias!');


--    select UDS_EXISTENCIA into x_entero from productos where UDS_EXISTENCIA < 6;
--    dbms_output.put_line('Hay: ' || x_entero || ' existencias!');

    select UDS_EXISTENCIA into x_entero from productos where UDS_EXISTENCIA < 0;
    dbms_output.put_line('Hay: ' || x_entero || ' existencias!');

EXCEPTION
    when TOO_MANY_ROWS then
        dbms_output.put_line('Demasiadas filas');
    when NO_DATA_FOUND then
        dbms_output.put_line('No data found!');

END;
/
*/

/*
DECLARE
    CURSOR cproductos(x_uds INTEGER) IS
        select * from productos where UDS_EXISTENCIA < x_uds;

BEGIN

    dbms_output.put_line('Productos con menos de 5 unidades...')    ;
    FOR productos_reg IN cproductos(5) LOOP
        dbms_output.put_line('Nombre : ' || productos_reg.NOMBRE || ' unidades: ' || productos_reg.UDS_EXISTENCIA);
    END LOOP;
    -- No hace falta ni abrir ni cerrar el cursor

        dbms_output.put_line('Productos con menos de 25 unidades...');
    FOR productos_reg IN cproductos(25) LOOP
        dbms_output.put_line('Nombre : ' || productos_reg.NOMBRE || ' unidades: ' || productos_reg.UDS_EXISTENCIA);
    END LOOP;
    -- No hace falta ni abrir ni cerrar el cursor

END;
/
*/

-- PL/SQL (0)

/*
DECLARE

    v_dni clientes.dni%TYPE := '&dni';  -- Provoca el uso del developer te pida un valor....
    c_reg clientes%ROWTYPE;

BEGIN

    dbms_output.put_line('Hello world!');

    select * into c_reg from clientes where dni = v_dni;

    dbms_output.put_line('Cliente: ' || c_reg.nombre);

EXCEPTION
    when NO_DATA_FOUND then
        dbms_output.put_line('No existe el cliente con ese nombre...');
END;
/
*/


CREATE OR REPLACE PROCEDURE NUM_CLIENTES  AS

    x_num_clientes INT;

BEGIN
    select count(*) into x_num_clientes from clientes;

    dbms_output.put_line('Numero de clientes: ' || x_num_clientes);

END;
/

CREATE OR REPLACE FUNCTION NUM_CLIENTES_F RETURN INT AS
    x_num_clientes INT;

BEGIN
    select count(*) into x_num_clientes from clientes;
    return x_num_clientes;

END;
/

DECLARE

    x_num_clientes INT;

BEGIN
        dbms_output.put_line('Numero de clientes: ' || NUM_CLIENTES_F);
        NUM_CLIENTES;
        select NUM_CLIENTES_F from dual;
END;
/

SHO ERRORS;

select table_name from user_tables;

desc all_tables;

-- Para todos los objetos hay una tabla o una vista del sistema.


-- select owner, count(*) from all_tables group by owner;

select table_name from user_tables;
create table prueba as select * from clientes;

-- Result...
desc prueba;
select * from prueba;

drop table prueba;

-- Obtener las tablas originales
-- Crear las tablas nuevas con las tablas originales SQL dinámico...
-- Borrar los datos de las tablas originales...


select rownum, table_name from user_tables
order by rownum desc;
