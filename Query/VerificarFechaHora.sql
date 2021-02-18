select COUNT(*) from Reservacion where
                        ((fecha_inicio_reservacion <= '2018-10-06' AND '2018-10-06' <= fecha_fin_reservacion)  
                        OR (fecha_inicio_reservacion <= '2018-10-08' AND '2018-10-08' <= fecha_fin_reservacion) OR  
                        (fecha_inicio_reservacion >= '2018-10-06' AND '2018-10-08' >= fecha_fin_reservacion))  
                        AND ((hora_inicio_reservacion <= '7:20' AND '7:20' <= hora_fin_reservacion) OR  
                        (hora_inicio_reservacion <= '08:10' AND '08:10' <= hora_fin_reservacion) OR  
                        (hora_inicio_reservacion >= '07:20' AND '08:10' >= hora_fin_reservacion)) 
                        AND  cod_salon = 1;
