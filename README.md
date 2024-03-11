# Google Data-Analitycs Capstone Project: Cyclistic 🚴

## Introducción

En este estudio de caso se demuestran las habilidades que adquiri mediante los cursos que componen al Certificado Profesional de Análisis de datos de Google. Usaré estas habilidades para completar las tareas de un analista de datos que trabaja para la empresa ficticia de bicicletas compartidas Cyclistic. Para responder las preguntas comerciales, seguiré los pasos del proceso de análisis de datos: **Preguntar**, **Preparar**, **Procesar**, **Analizar**, **Compartir** y **Actuar**.

### Contexto
La directora de Marketing de Cyclistic, cree que el éxito futuro de la empresa depende de maximizar el número de membresías anuales. Por lo tanto, mi equipo quiere comprender cómo los ciclistas ocasionales y los miembros anuales usan las bicicletas de manera diferente. A partir de estos conocimientos, mi equipo diseñará una nueva estrategia de marketing para convertir a los pasajeros ocasionales en miembros anuales. Pero primero, los ejecutivos de Cyclistic deben aprobar nuestras recomendaciones, por lo que deben estar respaldadas con información convincente y visualizaciones de datos profesionales.

### Acerca de la empresa
En 2016, Cyclistic lanzó una exitosa oferta de bicicletas compartidas. Desde entonces, el programa creció hasta alcanzar una flota de 5,824 bicicletas georreferenciadas y bloqueadas en una red de 692 estaciones en toda Chicago. Las bicicletas se pueden desbloquear desde una estación y devolverse en cualquier otra estación del sistema en cualquier momento.

Hasta ahora, la estrategia de marketing de Cyclistic se basaba en la construcción de un reconocimiento de marca general y en atraer a amplios segmentos de consumidores. Uno de los enfoques que ayudó a hacer esto posible fue la flexibilidad de sus planes de precios: pases de un solo viaje, pases de un día completo y membresías anuales. A los clientes que compran pases de un solo viaje o pases de un día completo se los llama ciclistas ocasionales. Los clientes que compran membresías anuales se llaman miembros de Cyclistic.

Los analistas financieros de Cyclistic llegaron a la conclusión de que los miembros anuales son mucho más rentables que los ciclistas ocasionales. Aunque la flexibilidad de precios ayuda a Cyclistic a atraer más clientes, Moreno cree que maximizar el número de miembros anuales será clave para el crecimiento futuro. En lugar de crear una campaña de marketing que apunte a todos los clientes nuevos, Moreno cree que hay muchas posibilidades de convertir a los ciclistas ocasionales en miembros. Ella señala que los ciclistas ocasionales ya conocen el programa de Cyclistic y han elegido a Cyclistic para sus necesidades de movilidad.

Moreno estableció una meta clara: Diseñar estrategias de marketing orientadas a convertir a los ciclistas ocasionales en miembros anuales. Sin embargo, para hacer eso, el equipo de analistas de marketing necesita entender mejor cómo difieren los miembros anuales y los ciclistas ocasionales, por qué los ciclistas ocasionales comprarían una membresía y cómo los medios digitales podrían afectar sus tácticas de marketing. Moreno y su equipo están interesados en analizar los datos históricos de viajes en bicicleta de Cyclistic para identificar tendencias.

## Preguntar 💬

### Tarea empresarial

Obtener conocimientos mediante este análisis qur ayuden al equipo de marketing a desarrollar sus estrategias para la campaña.

### Preguntas Orientativas

Tres preguntas guiarán el futuro programa de marketing:

 **1**. ¿En qué se diferencian los socios anuales y los ciclistas ocasionales con respecto al uso de las bicicletas de Cyclistic?
 
 **2**. ¿Por qué los ciclistas ocasionales comprarían membresías anuales de Cyclistic?
 
 **3**. ¿Cómo puede usar Cyclistic los medios digitales para influenciar a los ciclistas ocasionales a convertirse en miembros?

## Preparar ☑️

Utilicé datos históricos de viajes de Cyclistic para analizar e identificar tendencias desde enero de 2023 hasta diciembre de 2023, provienen de [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) y han sido puestos a disposición por Motivate International Inc. bajo esta [licencia](https://divvybikes.com/data-license-agreement).

Hay 12 archivos y cada archivo incluye información de un mes, como el id del viaje, el tipo de bicicleta, la hora de inicio, la hora de finalización, la estación de inicio, la estación de finalización, la ubicación de inicio, la ubicación de finalización y si el usuario es miembro o no. Los nombres de las columnas son: ride_id, rideable_type, start_at, end_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng y member_casual.

## Procesar ⚙️

Utilicé SQLite para cargar los 12 archivos csv con datos de cada mes y los uní a todos en una nueva tabla llamada "tripdata2023", la cual contiene 5719877 registros.

Una vez combinados los datos, ya están listos para pasar al siguiente paso, la [limpieza](https://github.com/ezequielgarcia13/Google-Data-Analitycs-Capstone-Project/blob/main/Limpieza%20Datos.sql) de datos.

Creé las columnas **ride_lenght_mins**, la cual contiene la duración de cada viaje en minutos y **weekday**, que indica el día de la semana de cada viaje. Ambas serán necesarias para los próximos pasos.
También se eliminaron filas con valores nulos y filas que contenían valores atípicos dentro de la columna ride_lenght_mins.
Luego de confirmar que el conjunto de datos no contiene valores duplicados pasamos al siguiente paso del proceso de análisis de datos.  

## Análizar y Compartir 📊

Los datos se encuentran almacenados correctamente y están preparados para pasar al proceso de [análisis](https://github.com/ezequielgarcia13/Google-Data-Analitycs-Capstone-Project/blob/main/Analisis%20datos.sql).
Hice diferentes consultas que creí relevantes para el análisis y luego realicé las vizualizaciones correspondientes en Tableau. El análisis se centra en demostrar cómo se diferencian en el uso de bicicletas los miembros anuales de los usuarios casuales.

![](https://github.com/ezequielgarcia13/Google-Data-Analitycs-Capstone-Project/blob/main/assets/Dia.png?raw=true)

Los **miembros anuales** realizan la mayor cantidad de viajes durante los días laborables de la semana,  mientras que los usuarios casuales prefieren los fines de semana. El **36,8%** de los paseos realizados por **usuarios casuales** transcurren los fines de semana, siendo sábado el día mas concurrido.

![](https://github.com/ezequielgarcia13/Google-Data-Analitycs-Capstone-Project/blob/main/assets/Hora.png?raw=true)

Temprano en la mañana y de 16 a 18 hs transcurren la mayor cantidad de viajes de **miembros anuales**. Esto coincide con los horarios de entrada y salida habituales de las jornadas de trabajo. 
Los **usuarios casuales eligen las tardes para realizar sus paseos**. El 34,9% de sus viajes se realizan entre las 15 y las 18 hs.

![](https://github.com/ezequielgarcia13/Google-Data-Analitycs-Capstone-Project/blob/main/assets/Mes(1).png?raw=true)

Los meses de verano  son los más elegidos por todo tipo de usuario, los miembros anuales realizan más viajes durante esta época del año pero es en los usuarios casuales donde la diferencia es más notoria, **el 45% de los viajes de usuarios casuales se concentran en estos tres meses**. 

![](https://github.com/ezequielgarcia13/Google-Data-Analitycs-Capstone-Project/blob/main/assets/Promedio%20duracion.png?raw=true)

Los miembros anuales toman en promedio viajes más cortos mientras que los usuarios casuales dan paseos más largos. 
**Esto confirma que los viajes de miembros anuales están relacionados a su rutina diaria mientras que los usuarios casuales usan el servicio de forma recreativa**. 

Todas las **visualizaciones** concentradas en un dashboard junto con un resumen y recomendaciones se pueden ver [aquí](https://public.tableau.com/app/profile/ezequielenzogarcia/viz/cyclistic1_7/Dashboard2).

## Actuar 📋🎯

El objetivo de todo análisis es obtener conclusiones que lleven a la acción para poder mejorar un proceso o tomar una decisión. En este caso particular el objetivo era entregarle recomendaciones para el desarrollo de las campañas al equipo de marketing.

### Recomendaciones 

Una vez concluído el análisis, se presentaron junto con visualizaciones de datos las siguientes recomendaciones: 

- Enfatizar campañas en redes sociales especialmente los fines de semana y durante las tardes, momento en el cual los usuarios casuales prefieren dar paseos en bicicleta.

- Enfatizar campañas en redes sociales durante los meses de verano, ofreciendo beneficios para aquellos usuarios que se conviertan en miembros anuales. 

- Ofrecer descuentos en membresías durante los meses con menor actividad. 

- Crear diferentes opciones de suscripción, de manera que se adapte mejor a las necesidades de los usuarios.










