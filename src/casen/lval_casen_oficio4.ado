*! 1.0.3 Iván Gutiérrez 07dec2016
capture program drop lval_casen_oficio4
program define lval_casen_oficio4, rclass
  version 14.1
  syntax
  label define _oficio4 110 `"fuerzas armadas"', modify
  label define _oficio4 1110 `"miembros del poder ejecutivo y de los cuerpos legislativos"', modify
  label define _oficio4 1120 `"personal directivo de la administración pública"', modify
  label define _oficio4 1130 `"jefes de pequeñas poblaciones"', modify
  label define _oficio4 1141 `"dirigentes y administradores de partidos políticos"', modify
  label define _oficio4 1142 `"dirigentes y admin. de org. de empleadores, trabajadores"', modify
  label define _oficio4 1143 `"dirigentes y admin. de org. humanitarias y de otras"', modify
  label define _oficio4 1210 `"directores generales y gerentes generales de empresa"', modify
  label define _oficio4 1221 `"directores de dep. de prod. y operac. agricultura, caza"', modify
  label define _oficio4 1222 `"directores de dep. de prod. y operac. ind. manufactureras"', modify
  label define _oficio4 1223 `"directores de dep. de prod. y operac. const. y obras públicas"', modify
  label define _oficio4 1224 `"directores de dep. de prod. y operac.comercio"', modify
  label define _oficio4 1225 `"directores de dep. de prod. y operac.hostelería"', modify
  label define _oficio4 1226 `"directores de dep. de prod. y operac.transp., almac."', modify
  label define _oficio4 1227 `"directores de dep. de prod. y operac.dep. de servicios."', modify
  label define _oficio4 1228 `"directores de dep. de prod. y operac.servicios personales"', modify
  label define _oficio4 1229 `"directores de dep. de prod. y operac.no clasificados"', modify
  label define _oficio4 1231 `"directores de dep. financieros y administrativos"', modify
  label define _oficio4 1232 `"directores de dep. de personal y de relaciones laborales"', modify
  label define _oficio4 1233 `"directores de dep. de ventas y comercialización"', modify
  label define _oficio4 1234 `"directores de dep. de publicidad y de relaciones públicas"', modify
  label define _oficio4 1235 `"directores de dep. de abastecimiento y distribución"', modify
  label define _oficio4 1236 `"directores de dep. de servicios de informática"', modify
  label define _oficio4 1237 `"directores de dep. de investigaciones y desarrollo"', modify
  label define _oficio4 1239 `"otros directores de dep., no clasificados"', modify
  label define _oficio4 1311 `"gerentes de emp. de agricultura, caza, silvicultura y pesca"', modify
  label define _oficio4 1312 `"gerentes de industrias manufactureras"', modify
  label define _oficio4 1313 `"gerentes de emp. de construcción y obras públicas"', modify
  label define _oficio4 1314 `"gerentes de comercios mayoristas y minoristas"', modify
  label define _oficio4 1315 `"gerentes de emp. de restauración y hostelería"', modify
  label define _oficio4 1316 `"gerentes de emp. de transporte, almacenamiento y com."', modify
  label define _oficio4 1317 `"gerentes de emp. de intermediación y servicios a empresas."', modify
  label define _oficio4 1318 `"gerentes de emp. de servicios personales, limpieza"', modify
  label define _oficio4 1319 `"gerentes de emp., no clasificados bajo otros epígrafes"', modify
  label define _oficio4 2111 `"físicos y astrónomos"', modify
  label define _oficio4 2112 `"meteorólogos"', modify
  label define _oficio4 2113 `"químicos"', modify
  label define _oficio4 2114 `"geólogos y geofísicos"', modify
  label define _oficio4 2121 `"matemáticos y afines"', modify
  label define _oficio4 2122 `"estadísticos"', modify
  label define _oficio4 2131 `"creadores y analistas de sistemas informáticos"', modify
  label define _oficio4 2132 `"programadores informáticos"', modify
  label define _oficio4 2139 `"profesionales de la informática, no clasificados"', modify
  label define _oficio4 2140 `"arquitectos, ingenieros y afines"', modify
  label define _oficio4 2141 `"arquitectos, urbanistas e ingenieros de tránsito"', modify
  label define _oficio4 2142 `"ingenieros civiles"', modify
  label define _oficio4 2143 `"ingenieros electricistas"', modify
  label define _oficio4 2144 `"ingenieros electronicistas y de telecomunicaciones"', modify
  label define _oficio4 2145 `"ingenieros mecánicos"', modify
  label define _oficio4 2146 `"ingenieros químicos"', modify
  label define _oficio4 2147 `"ingenieros de minas y metalúrgicos y afines"', modify
  label define _oficio4 2148 `"cartógrafos y agrimensores"', modify
  label define _oficio4 2149 `"arquitectos, ingenieros y afines, no clasificados"', modify
  label define _oficio4 2211 `"biólogos, botánicos, zoólogos y afines"', modify
  label define _oficio4 2212 `"farmacólogos, patólogos y afines"', modify
  label define _oficio4 2213 `"agrónomos y afines"', modify
  label define _oficio4 2221 `"médicos"', modify
  label define _oficio4 2222 `"odontólogos"', modify
  label define _oficio4 2223 `"veterinarios"', modify
  label define _oficio4 2224 `"farmacéuticos"', modify
  label define _oficio4 2229 `"médicos y profesionales afines no clasificados"', modify
  label define _oficio4 2230 `"personal de enfermería y partería de nivel superior"', modify
  label define _oficio4 2310 `"profesores de universidades y de la enseñanza superior"', modify
  label define _oficio4 2320 `"profesores de la enseñanza secundaria"', modify
  label define _oficio4 2330 `"maestros de nivel superior de la enseñanza primaria y preescolar"', modify
  label define _oficio4 2331 `"maestros de nivel superior de la enseñanza primaria"', modify
  label define _oficio4 2332 `"maestros de nivel superior de la enseñanza preescolar"', modify
  label define _oficio4 2340 `"maestros e instructores de nivel superior de ens. esp."', modify
  label define _oficio4 2351 `"especialistas en métodos pedagógicos y material didáctico"', modify
  label define _oficio4 2352 `"inspectores de la enseñanza"', modify
  label define _oficio4 2359 `"otros profesionales de la enseñanza, no clasificados"', modify
  label define _oficio4 2411 `"contadores"', modify
  label define _oficio4 2412 `"especialistas en políticas y servicios de personal y afines"', modify
  label define _oficio4 2419 `"especialistas en org.y adm. de emp, no clasificados"', modify
  label define _oficio4 2421 `"abogados"', modify
  label define _oficio4 2422 `"jueces"', modify
  label define _oficio4 2429 `"profesionales del derecho, no clasificados"', modify
  label define _oficio4 2431 `"archiveros y conservadores de museos"', modify
  label define _oficio4 2432 `"bibliotecarios, documentalistas y afines"', modify
  label define _oficio4 2441 `"economistas"', modify
  label define _oficio4 2442 `"sociólogos, antropólogos y afines"', modify
  label define _oficio4 2443 `"filósofos, historiadores y esp. en ciencias políticas"', modify
  label define _oficio4 2444 `"filólogos, traductores e intérpretes"', modify
  label define _oficio4 2445 `"psicólogos"', modify
  label define _oficio4 2446 `"profesionales del trabajo social"', modify
  label define _oficio4 2451 `"autores, periodistas y otros escritores"', modify
  label define _oficio4 2452 `"escultores, pintores y afines"', modify
  label define _oficio4 2453 `"compositores, músicos y cantantes"', modify
  label define _oficio4 2454 `"coreógrafos y bailarines"', modify
  label define _oficio4 2455 `"actores y directores de cine, radio, teatro, tv.y afines"', modify
  label define _oficio4 2460 `"sacerdotes de distintas religiones"', modify
  label define _oficio4 3111 `"técnicos en ciencias físicas y químicas"', modify
  label define _oficio4 3112 `"técnicos en ingeniería civil"', modify
  label define _oficio4 3113 `"electrotécnicos"', modify
  label define _oficio4 3114 `"técnicos en electrónica y telecomunicaciones"', modify
  label define _oficio4 3115 `"técnicos en mecánica y construcción mecánica"', modify
  label define _oficio4 3116 `"técnicos en química industrial"', modify
  label define _oficio4 3117 `"técnicos en ingeniería de minas y metalurgia"', modify
  label define _oficio4 3118 `"delineantes y dibujantes técnicos"', modify
  label define _oficio4 3119 `"técnicos en ciencias físicas, químicas, ingeniería"', modify
  label define _oficio4 3121 `"técnicos en programación informática"', modify
  label define _oficio4 3122 `"técnicos en control de equipos informáticos"', modify
  label define _oficio4 3123 `"técnicos en control de robots industriales"', modify
  label define _oficio4 3131 `"fotógrafos y op. de equipos de grabación"', modify
  label define _oficio4 3132 `"op. de equipos de radio, tv. y telecomunicaciones"', modify
  label define _oficio4 3133 `"op. de aparatos médicos"', modify
  label define _oficio4 3139 `"op. de equipos ópticos y electrónicos"', modify
  label define _oficio4 3141 `"oficiales maquinistas"', modify
  label define _oficio4 3142 `"capitanes, oficiales de cubierta y prácticos"', modify
  label define _oficio4 3143 `"pilotos de aviación y afines"', modify
  label define _oficio4 3144 `"controladores de tráfico aéreo"', modify
  label define _oficio4 3145 `"técnicos en seguridad aeronáutica"', modify
  label define _oficio4 3151 `"inspectores de edificios y de prevención de incendios"', modify
  label define _oficio4 3152 `"inspectores de seguridad y salud y control de calidad"', modify
  label define _oficio4 3211 `"técnicos en ciencias biológicas y afines"', modify
  label define _oficio4 3212 `"técnicos en agronomía, zootecnia y silvicultura"', modify
  label define _oficio4 3213 `"consejeros agrícolas y forestales"', modify
  label define _oficio4 3221 `"practicantes y asistentes médicos"', modify
  label define _oficio4 3222 `"higienistas y otro personal sanitario"', modify
  label define _oficio4 3223 `"técnicos en dietética y nutrición"', modify
  label define _oficio4 3224 `"técnicos en optometría y ópticos"', modify
  label define _oficio4 3225 `"dentistas auxiliares y ayudantes de odontología"', modify
  label define _oficio4 3226 `"fisioterapeutas y afines"', modify
  label define _oficio4 3227 `"técnicos y asistentes veterinarios"', modify
  label define _oficio4 3228 `"técnicos y asistentes farmacéuticos"', modify
  label define _oficio4 3229 `"profesionales de nivel medio de la medicina y la salud"', modify
  label define _oficio4 3231 `"personal de enfermería de nivel medio"', modify
  label define _oficio4 3232 `"personal de partería de nivel medio"', modify
  label define _oficio4 3241 `"practicantes de la medicina tradicional"', modify
  label define _oficio4 3242 `"curanderos"', modify
  label define _oficio4 3310 `"maestros de nivel medio de la enseñanza primaria"', modify
  label define _oficio4 3320 `"maestros de nivel medio de la enseñanza preescolar"', modify
  label define _oficio4 3330 `"maestros de nivel medio de la enseñanza especial"', modify
  label define _oficio4 3340 `"otros maestros e instructores de nivel medio"', modify
  label define _oficio4 3411 `"agentes de bolsa, cambio y otros servicios financieros"', modify
  label define _oficio4 3412 `"agentes de seguros"', modify
  label define _oficio4 3413 `"agentes inmobiliarios"', modify
  label define _oficio4 3414 `"agentes de viajes"', modify
  label define _oficio4 3415 `"representantes comerciales y técnicos de ventas"', modify
  label define _oficio4 3416 `"compradores"', modify
  label define _oficio4 3417 `"tasadores y subastadores"', modify
  label define _oficio4 3419 `"profesionales de nivel medio en operac. financieras y com."', modify
  label define _oficio4 3421 `"agentes de compras y consignatarios"', modify
  label define _oficio4 3422 `"declarantes o gestores de aduana"', modify
  label define _oficio4 3423 `"agentes públicos y privados de colocación de mano de obra"', modify
  label define _oficio4 3429 `"agentes comerciales y corredores, no clasificados"', modify
  label define _oficio4 3431 `"profesionales de nivel medio de servicios administrativos"', modify
  label define _oficio4 3432 `"profesionales de nivel medio del derecho y serv. legales"', modify
  label define _oficio4 3433 `"tenedores de libros"', modify
  label define _oficio4 3434 `"profesionales de nivel medio de serv. estadísticos"', modify
  label define _oficio4 3439 `"profesionales de nivel medio de serv. de administración"', modify
  label define _oficio4 3441 `"agentes de aduana e inspectores de fronteras"', modify
  label define _oficio4 3442 `"funcionarios del fisco"', modify
  label define _oficio4 3443 `"funcionarios de servicios de seguridad social"', modify
  label define _oficio4 3444 `"funcionarios de servicios de expedición de licencias y perm."', modify
  label define _oficio4 3449 `"agentes públicos de aduanas, impuestos y afines"', modify
  label define _oficio4 3450 `"inspectores de policía y detectives"', modify
  label define _oficio4 3460 `"trabaj. y asistentes sociales de nivel medio"', modify
  label define _oficio4 3470 `"profesionales de nivel medio de actividades artísticas, espectáculos y deporte"', modify
  label define _oficio4 3471 `"decoradores y diseñadores"', modify
  label define _oficio4 3472 `"locutores de radio y televisión y afines"', modify
  label define _oficio4 3473 `"músicos, cantantes y bailarines callejeros, de cabaret"', modify
  label define _oficio4 3474 `"payasos, prestidigitadores, acróbatas y afines"', modify
  label define _oficio4 3475 `"atletas, deportistas y afines"', modify
  label define _oficio4 3480 `"auxiliares laicos de los cultos"', modify
  label define _oficio4 4111 `"taquígrafos y mecanógrafos"', modify
  label define _oficio4 4112 `"op. de máquinas de tratamiento de textos y afines"', modify
  label define _oficio4 4113 `"op. de entrada de datos"', modify
  label define _oficio4 4114 `"op. de calculadoras"', modify
  label define _oficio4 4115 `"secretarios"', modify
  label define _oficio4 4121 `"empleados de contabilidad y cálculo de costos"', modify
  label define _oficio4 4122 `"empleados de servicios estadísticos y financieros"', modify
  label define _oficio4 4130 `"empleados encargados del registro de materiasles y de transportes"', modify
  label define _oficio4 4131 `"empleados de control de abastecimientos inventario"', modify
  label define _oficio4 4132 `"empleados de servicios de apoyo a la producción"', modify
  label define _oficio4 4133 `"empleados de servicios de transporte"', modify
  label define _oficio4 4141 `"empleados de bibliotecas y archivos"', modify
  label define _oficio4 4142 `"empleados de servicios de correos"', modify
  label define _oficio4 4143 `"codificadores de datos, correctores de pruebas de imprenta"', modify
  label define _oficio4 4144 `"escribientes públicos y afines"', modify
  label define _oficio4 4190 `"otros oficinistas"', modify
  label define _oficio4 4211 `"cajeros y expendedores de billetes"', modify
  label define _oficio4 4212 `"pagadores y cobradores de ventanilla y taquilleros"', modify
  label define _oficio4 4213 `"receptores de apuestas y afines"', modify
  label define _oficio4 4214 `"prestamistas"', modify
  label define _oficio4 4215 `"cobradores y afines"', modify
  label define _oficio4 4221 `"empleados de agencias de viajes"', modify
  label define _oficio4 4222 `"recepcionistas y empleados de informaciones"', modify
  label define _oficio4 4223 `"telefonistas"', modify
  label define _oficio4 5111 `"camareros y azafatas"', modify
  label define _oficio4 5112 `"revisores, guardas y cobradores de los transportes"', modify
  label define _oficio4 5113 `"guías"', modify
  label define _oficio4 5120 `"personal de intendencia y restauración"', modify
  label define _oficio4 5121 `"ecónomos, mayordomos y afines"', modify
  label define _oficio4 5122 `"cocineros"', modify
  label define _oficio4 5123 `"camareros y taberneros"', modify
  label define _oficio4 5131 `"niñeras y celadoras infantiles"', modify
  label define _oficio4 5132 `"ayudantes de enfermería en instituciones"', modify
  label define _oficio4 5133 `"ayudantes de enfermería a domicilio"', modify
  label define _oficio4 5139 `"trabaj. de los cuidados personales y afines"', modify
  label define _oficio4 5141 `"peluqueros, especialistas en tratamientos de belleza"', modify
  label define _oficio4 5142 `"acompañantes y ayudas de cámara"', modify
  label define _oficio4 5143 `"personal de pompas fúnebres y embalsamadores"', modify
  label define _oficio4 5149 `"otros trabaj. de servicios personales a particulares"', modify
  label define _oficio4 5151 `"astrólogos y afines"', modify
  label define _oficio4 5152 `"adivinadores, quirománticos y afines"', modify
  label define _oficio4 5161 `"bomberos"', modify
  label define _oficio4 5162 `"policías"', modify
  label define _oficio4 5163 `"guardianes de prisión"', modify
  label define _oficio4 5169 `"personal de los servicios de protección y seguridad"', modify
  label define _oficio4 5210 `"modelos de modas, arte y publicidad"', modify
  label define _oficio4 5220 `"vendedores y demostradores de tiendas y almacenes"', modify
  label define _oficio4 5230 `"vendedores de quioscos y de puestos de mercado"', modify
  label define _oficio4 6100 `"agricultores y trabaj. calificados de cultivos para el mercado"', modify
  label define _oficio4 6110 `"agricultores y trabaj. calificados de cultivos extensivos"', modify
  label define _oficio4 6111 `"agricultores y trabaj. calificados de cultivos extensivos"', modify
  label define _oficio4 6112 `"agricultores y trabaj. calificados de plant. de árboles"', modify
  label define _oficio4 6113 `"agricultores y trabaj. calificados de huertas, invernaderos"', modify
  label define _oficio4 6114 `"agricultores y trabaj. calificados de cultivos mixtos"', modify
  label define _oficio4 6120 `"criadores y trabajadores pecuarios calificados de la cría de animales para el mercado"', modify
  label define _oficio4 6121 `"criadores de ganado y productores de leche y sus derivados"', modify
  label define _oficio4 6122 `"avicultores y trabaj. calificados de la avicultura"', modify
  label define _oficio4 6123 `"apicultores y sericicultores calificados de la apicultura"', modify
  label define _oficio4 6124 `"criadores y trabaj. calificados de anim.domésticos"', modify
  label define _oficio4 6129 `"criadores y trabaj. pecuarios calificados para el mercado"', modify
  label define _oficio4 6130 `"productores y trabaj. agropecuarios calificados"', modify
  label define _oficio4 6141 `"taladores y otros trabaj. forestales"', modify
  label define _oficio4 6142 `"carboneros de carbón vegetal y afines"', modify
  label define _oficio4 6151 `"criadores de especies acuáticas"', modify
  label define _oficio4 6152 `"pescadores de agua dulce y en aguas costeras"', modify
  label define _oficio4 6153 `"pescadores de alta mar"', modify
  label define _oficio4 6154 `"cazadores y tramperos"', modify
  label define _oficio4 6210 `"trabaj. agropecuarios y pesqueros de subsistencia"', modify
  label define _oficio4 7110 `"mineros,  canteros, pegadores y labrantes de píedra"', modify
  label define _oficio4 7111 `"mineros y canteros"', modify
  label define _oficio4 7112 `"pegadores"', modify
  label define _oficio4 7113 `"tronzadores, labrantes y grabadores de piedra"', modify
  label define _oficio4 7121 `"constructores con técnicas y materiales tradicionales"', modify
  label define _oficio4 7122 `"albañiles y mamposteros"', modify
  label define _oficio4 7123 `"operarios en cemento armado, enfoscadores y afines"', modify
  label define _oficio4 7124 `"carpinteros de armar y de blanco"', modify
  label define _oficio4 7129 `"oficiales y operarios de la construcción (obra gruesa)"', modify
  label define _oficio4 7131 `"techadores"', modify
  label define _oficio4 7132 `"parqueteros y colocadores de suelos"', modify
  label define _oficio4 7133 `"revocadores"', modify
  label define _oficio4 7134 `"instaladores de material aislante y de insonorización"', modify
  label define _oficio4 7135 `"cristaleros"', modify
  label define _oficio4 7136 `"fontaneros e instaladores de tuberías"', modify
  label define _oficio4 7137 `"electricistas de obras y afines"', modify
  label define _oficio4 7141 `"pintores y empapeladores"', modify
  label define _oficio4 7142 `"barnizadores y afines"', modify
  label define _oficio4 7143 `"limpiadores de fachadas y deshollinadores"', modify
  label define _oficio4 7211 `"moldeadores y macheros"', modify
  label define _oficio4 7212 `"soldadores y oxicortadores"', modify
  label define _oficio4 7213 `"chapistas y caldereros"', modify
  label define _oficio4 7214 `"montadores de estructuras metálicas"', modify
  label define _oficio4 7215 `"aparejadores y empalmadores de cables"', modify
  label define _oficio4 7216 `"buzos"', modify
  label define _oficio4 7221 `"herreros y forjadores"', modify
  label define _oficio4 7222 `"herramentistas y afines"', modify
  label define _oficio4 7223 `"reguladores y reguladores-op. de máq. herramientas"', modify
  label define _oficio4 7224 `"pulidores de metales y afiladores de herramientas"', modify
  label define _oficio4 7231 `"mecánicos y ajustadores de vehículos de motor"', modify
  label define _oficio4 7232 `"mecánicos y ajustadores de motores de avión"', modify
  label define _oficio4 7233 `"mecánicos y ajustadores de máquinas agrícolas e ind."', modify
  label define _oficio4 7241 `"mecánicos y ajustadores electricistas"', modify
  label define _oficio4 7242 `"ajustadores electronicistas"', modify
  label define _oficio4 7243 `"mecánicos y reparadores de aparatos electrónicos"', modify
  label define _oficio4 7244 `"instaladores y reparadores de telégrafos y teléfonos"', modify
  label define _oficio4 7245 `"instaladores y reparadores de líneas eléctricas"', modify
  label define _oficio4 7311 `"mecánicos y reparadores de instrumentos de precisión"', modify
  label define _oficio4 7312 `"constructores y afinadores de instrumentos musicales"', modify
  label define _oficio4 7313 `"joyeros, orfebres y plateros"', modify
  label define _oficio4 7321 `"alfareros y afines (barro, arcilla y abrasivos)"', modify
  label define _oficio4 7322 `"sopladores, modeladores, laminadores, cortadores de vidrio"', modify
  label define _oficio4 7323 `"grabadores de vidrio"', modify
  label define _oficio4 7324 `"pintores decoradores de vidrio, cerámica y otros materiales"', modify
  label define _oficio4 7330 `"artesanos de la madera, tejidos, cuero y materiales similares"', modify
  label define _oficio4 7331 `"artesanos de la madera y materiales similares"', modify
  label define _oficio4 7332 `"artesanos de los tejidos, el cuero y materiales similares"', modify
  label define _oficio4 7340 `"oficiales y operarios de las artes gráficas y afines"', modify
  label define _oficio4 7341 `"cajistas, tipógrafos y afines"', modify
  label define _oficio4 7342 `"estereotipistas y galvanotipistas"', modify
  label define _oficio4 7343 `"grabadores de imprenta y fotograbadores"', modify
  label define _oficio4 7344 `"operarios de la fotografía y afines"', modify
  label define _oficio4 7345 `"encuadernadores y afines"', modify
  label define _oficio4 7346 `"impresores de sericigrafía y estampadores"', modify
  label define _oficio4 7410 `"oficiales y operarios del procesamiento de alimentos y afines"', modify
  label define _oficio4 7411 `"carniceros, pescaderos y afines"', modify
  label define _oficio4 7412 `"panaderos, pasteleros y confiteros"', modify
  label define _oficio4 7413 `"operarios de la elaboración de prod. lácteos"', modify
  label define _oficio4 7414 `"operarios de la conservación de frutas, legumbres, verduras"', modify
  label define _oficio4 7415 `"catadores y clasificadores de alimentos y bebidas"', modify
  label define _oficio4 7416 `"preparadores y elaboradores de tabaco y sus prod."', modify
  label define _oficio4 7421 `"operarios del tratamiento de la madera"', modify
  label define _oficio4 7422 `"ebanistas y afines"', modify
  label define _oficio4 7423 `"reguladores y reguladores-op. de máquinas madereras"', modify
  label define _oficio4 7424 `"cesteros, bruceros y afines"', modify
  label define _oficio4 7431 `"preparadores de fibras"', modify
  label define _oficio4 7432 `"tejedores con telares o de tejidos de punto y afines"', modify
  label define _oficio4 7433 `"sastres, modistos y sombrereros"', modify
  label define _oficio4 7434 `"peleteros y afines"', modify
  label define _oficio4 7435 `"patronistas y cortadores de tela, cuero y afines"', modify
  label define _oficio4 7436 `"costureros, bordadores y afines"', modify
  label define _oficio4 7437 `"tapiceros, colchoneros y afines"', modify
  label define _oficio4 7441 `"apelambradores, pellejeros y curtidores"', modify
  label define _oficio4 7442 `"zapateros y afines"', modify
  label define _oficio4 8111 `"op. de instalaciones mineras"', modify
  label define _oficio4 8112 `"op. de instalaciones de procesamiento de minerales"', modify
  label define _oficio4 8113 `"perforadores y sondistas de pozos y afines"', modify
  label define _oficio4 8121 `"op. de hornos de minerales y de primera fusión de metales"', modify
  label define _oficio4 8122 `"op. de hornos de segunda fusión, máquinas de colar y moldear"', modify
  label define _oficio4 8123 `"op. de instalaciones de tratamiento térmico de metales"', modify
  label define _oficio4 8124 `"op. de máquinas trefiladoras y estiradoras de metales"', modify
  label define _oficio4 8131 `"op. de hornos de vidriería y cerámica y op. de máquinas"', modify
  label define _oficio4 8139 `"op. de instalaciones de vidriería, cerámica,no clasificados"', modify
  label define _oficio4 8141 `"op. de instalaciones de procesamiento de la madera"', modify
  label define _oficio4 8142 `"op. de instalaciones para la preparación de pasta para papel"', modify
  label define _oficio4 8143 `"op. de instalaciones para la fabricación de papel"', modify
  label define _oficio4 8151 `"op. de instalaciones quebrantadoras de sust. quim."', modify
  label define _oficio4 8152 `"op. de instalaciones de tratamiento químico térmico"', modify
  label define _oficio4 8153 `"op. de equipos de filtración y separación de sust. quim."', modify
  label define _oficio4 8154 `"op. de equipos de destilación y de reacción química"', modify
  label define _oficio4 8155 `"op. de instalaciones de refinación de petróleo y gas natural"', modify
  label define _oficio4 8159 `"op. de instalaciones de tratamientos químicos"', modify
  label define _oficio4 8161 `"op. de instalaciones de producción de energía"', modify
  label define _oficio4 8162 `"op. de máquinas de vapor y calderas"', modify
  label define _oficio4 8163 `"op. de incineradores, instalaciones de tratamiento de agua"', modify
  label define _oficio4 8171 `"op. de cadenas de montaje automatizadas"', modify
  label define _oficio4 8172 `"op. de robots industriales"', modify
  label define _oficio4 8210 `"op. de máquinas para trabajar metales y productos minerales"', modify
  label define _oficio4 8211 `"op. de máquinas herramientas"', modify
  label define _oficio4 8212 `"op. de máquinas para fabricar cemento y otros"', modify
  label define _oficio4 8221 `"op. de máq. para fabricar prod. farmacéuticos y cosméticos"', modify
  label define _oficio4 8222 `"op. de máquinas para fabricar municiones y explosivos"', modify
  label define _oficio4 8223 `"op. de máquinas pulidoras, galvanizadoras de metales"', modify
  label define _oficio4 8224 `"op. de máquinas para fabricar accesorios fotográficos"', modify
  label define _oficio4 8229 `"op. de máquinas para fabricar prod. químicos"', modify
  label define _oficio4 8231 `"op. de máquinas para fabricar prod. de caucho"', modify
  label define _oficio4 8232 `"op. de máquinas para fabricar prod. de material plástico"', modify
  label define _oficio4 8240 `"op. de máquinas para fabricar prod. de madera"', modify
  label define _oficio4 8251 `"op. de máquinas de imprenta"', modify
  label define _oficio4 8252 `"op. de máquinas de encuadernación"', modify
  label define _oficio4 8253 `"op. de máquinas para fabricar prod. de papel"', modify
  label define _oficio4 8261 `"op. de máq. de preparación de fibras, hilado y devanado"', modify
  label define _oficio4 8262 `"op. de telares y otras máquinas tejedoras"', modify
  label define _oficio4 8263 `"op. de máquinas para coser"', modify
  label define _oficio4 8264 `"op. de máquinas de blanqueo, teñido y tintura"', modify
  label define _oficio4 8265 `"op. de máquinas de tratamiento de pieles y cueros"', modify
  label define _oficio4 8266 `"op. de máquinas para la fabricación de calzado y afines"', modify
  label define _oficio4 8269 `"op. de máq. para fabricar prod. textiles y de piel y cuero"', modify
  label define _oficio4 8270 `"op. de máquinas para elaborar alimentos y productos afines"', modify
  label define _oficio4 8271 `"op. de máquinas para elaborar carne, pescado y mariscos"', modify
  label define _oficio4 8272 `"op. de máquinas para elaborar prod. lácteos"', modify
  label define _oficio4 8273 `"op. de máquinas para moler cereales y especias"', modify
  label define _oficio4 8274 `"op. de máq para elaborar cereales, panadería, repostería"', modify
  label define _oficio4 8275 `"op. de máq. para elaborar frutos húmedos, secos, hortalizas"', modify
  label define _oficio4 8276 `"op. de máquinas para fabricar azúcares"', modify
  label define _oficio4 8277 `"op. de máquinas para elaborar té, café y cacao"', modify
  label define _oficio4 8278 `"op. de máquinas para elaborar cerveza, vinos y bebidas"', modify
  label define _oficio4 8279 `"op. de máquinas para elaborar prod. del tabaco"', modify
  label define _oficio4 8281 `"montadores de elementos mecánicos de máquinas"', modify
  label define _oficio4 8282 `"montadores de equipos eléctricos"', modify
  label define _oficio4 8283 `"montadores de equipos electrónicos"', modify
  label define _oficio4 8284 `"montadores de prod. metálicos, de caucho, de plástico"', modify
  label define _oficio4 8285 `"montadores de prod. de madera y de materiales afines"', modify
  label define _oficio4 8286 `"montadores de prod. de cartón, textiles y materiales afines"', modify
  label define _oficio4 8290 `"otros op. de máquinas y montadores"', modify
  label define _oficio4 8311 `"maquinistas de locomotoras"', modify
  label define _oficio4 8312 `"guardafrenos, guardagujas y agentes de maniobras"', modify
  label define _oficio4 8321 `"conductores de motocicletas"', modify
  label define _oficio4 8322 `"conductores de automóviles, taxis y camionetas"', modify
  label define _oficio4 8323 `"conductores de autobuses y tranvías"', modify
  label define _oficio4 8324 `"conductores de camiones pesados"', modify
  label define _oficio4 8330 `"op. de maquinaria agrícola móvil y de otras máquinas móviles"', modify
  label define _oficio4 8331 `"op. de maquinaria agrícola y forestal motorizada"', modify
  label define _oficio4 8332 `"op. de máquinas de movimiento de tierras y afines"', modify
  label define _oficio4 8333 `"op. de grúas, de aparatos elevadores y afines"', modify
  label define _oficio4 8334 `"op. de carretillas elevadoras"', modify
  label define _oficio4 8340 `"marineros de cubierta y afines"', modify
  label define _oficio4 9111 `"vendedores ambulantes de prod. comestibles"', modify
  label define _oficio4 9112 `"vendedores ambulantes de prod. no comestibles"', modify
  label define _oficio4 9113 `"vendedores a domicilio y por teléfono"', modify
  label define _oficio4 9120 `"limpiabotas y otros trabaj. callejeros"', modify
  label define _oficio4 9131 `"personal doméstico"', modify
  label define _oficio4 9132 `"limpiadores de oficinas, hoteles y otros establecimientos"', modify
  label define _oficio4 9133 `"lavanderos y planchadores manuales"', modify
  label define _oficio4 9141 `"conserjes"', modify
  label define _oficio4 9142 `"lavadores de vehículos, ventanas y afines"', modify
  label define _oficio4 9150 `"mensajeros, porteadores, porteros y afines"', modify
  label define _oficio4 9151 `"mensajeros, porteadores y repartidores"', modify
  label define _oficio4 9152 `"porteros y guardianes y afines"', modify
  label define _oficio4 9153 `"recolectores de dinero en aparatos, lectores de medidores"', modify
  label define _oficio4 9161 `"recolectores de basura"', modify
  label define _oficio4 9162 `"barrenderos y afines"', modify
  label define _oficio4 9211 `"mozos de labranza y peones agropecuarios"', modify
  label define _oficio4 9212 `"peones forestales"', modify
  label define _oficio4 9213 `"peones de la pesca, la caza y la trampa"', modify
  label define _oficio4 9311 `"peones de minas y canteras"', modify
  label define _oficio4 9312 `"peones de obras públicas: carreteras, presas y obras"', modify
  label define _oficio4 9313 `"peones de la construcción de edificios"', modify
  label define _oficio4 9321 `"peones de montaje"', modify
  label define _oficio4 9322 `"embaladores manuales y otros peones manufactureros"', modify
  label define _oficio4 9331 `"conductores de vehículos accionados a pedal o a brazo"', modify
  label define _oficio4 9332 `"conductores de vehículos y máquinas de tracción animal"', modify
  label define _oficio4 9333 `"peones de carga"', modify
  label define _oficio4 9999 `"no contesta"', modify
end
