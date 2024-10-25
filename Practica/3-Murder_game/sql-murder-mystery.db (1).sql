-- Paso 1

select * 
from crime_scene_report
WHERE date='20180115'AND type='murder'AND city='SQL City'

/*Las imágenes de seguridad muestran que hubo 2 testigos. El primer testigo vive en la última casa
en "Northwestern Dr". El segundo testigo, llamado Annabel, vive en algún lugar de "Franklin Ave".
*/

-- Paso 2

select *
from person
WHERE address_street_name = 'Northwestern Dr'
order by address_number desc


select *
from person
where name like 'Annabel%' and address_street_name = 'Franklin Ave';

/*Testigo 1 Morty Schapiro
id  14887
name   Morty Schapiro
license_id   118009
address_number    4919
address_street_name    Northwestern Dr
ssn   111564949*/

--Testigo 2 Annabel 
/* id 16371
name Annabel Miller
license_id 490173
address_number 103
address_street_name Franklin Ave
ssn 318771143*/
-- Paso 3

SELECT *
from interview
where person_id = '16371'
/* Escuché un disparo y luego vi a un hombre salir corriendo. Tenía una bolsa de "Get Fit Now Gym". 
El número de membresía en la bolsa comenzaba con "48Z". Sólo los miembros de oro tienen esas bolsas. 
El hombre se subió a un coche con una placa que decía "H42W".
*/

/* Vi ocurrir el asesinato y reconocí al asesino en mi gimnasio cuando estaba haciendo ejercicio la 
semana pasada, el 9 de enero.*/

-- PASO 4

SELECT *
FROM get_fit_now_check_in
WHERE check_in_date = '20180109' and membership_id like '%48z%'

-- PASO 5

select *
from get_fit_now_member
WHERE membership_start_date < '20180109' and membership_status = 'gold' and id like '%48z%'

/* 
48Z7A
person_id 28819
name Joe Germuska
membership_start_daten20160305
*/
/* 
48Z55
person_id 67318
name Jeremy Bowers
membership_start_date 20160101
*/

-- Paso 6
select *
from drivers_license
where plate_number like '%h42w%' and gender = 'male'

SELECT *
from person
where license_id = '423327'

-- ASESINO Jeremy Bowers

/* ¡Felicidades, encontraste al asesino! Pero espera, hay más... Si crees que estás preparado para un desafío,
intenta consultar la transcripción de la entrevista del asesino para encontrar al verdadero villano detrás de 
este crimen. Si se siente especialmente seguro de sus habilidades de SQL, intente completar este paso final con 
no más de 2 consultas. Utilice esta misma declaración INSERT con su nuevo sospechoso para verificar su respuesta." 
- ¿Debería ser una cadena literal entre comillas simples?*/

SELECT transcript
FROM interview
WHERE person_id = (SELECT id FROM person WHERE name = 'Jeremy Bowers');

/* Me contrató una mujer con mucho dinero. No sé su nombre, pero sé que mide alrededor de 5'5" (65") o 5'7" (67").
Tiene el pelo rojo y conduce un Tesla Model S. Sé que asistió al Concierto Sinfónico SQL tres veces en diciembre de 2017.
*/

select *
from drivers_license
where hair_color = 'red' and height BETWEEN 65 AND 67 and gender = 'female' and car_make = 'Tesla' and car_model = 'Model S'
-- 202298
-- 291182
-- 918773

select *
from person
where license_id = 202298 or license_id= 291182 or license_id = 918773

/* id
78881

name
Red Korb

license_id
918773

address_number
107

address_street_name
Camerata Dr

ssn
961388910*/
/*id
90700

name
Regina George

license_id
291182

address_number
332

address_street_name
Maple Ave

ssn
337169072 */ 
/*id
99716

name
Miranda Priestly

license_id
202298

address_number
1883

address_street_name
Golden Ave

ssn
987756388 */ 

SELECt *
FROM income
WHERE ssn = '987756388' or ssn='337169072' or ssn='961388910'

 -- LA MALA ES MIRANDA PrIESTLY