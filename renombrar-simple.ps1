# Script para renombrar imagenes - Version simple
$sourcePath = "static\img_MaterialAudiovisual"

$archivos = @(
    @{old="01. Dos monjas un hombre.jpg"; new="imagen1.jpg"},
    @{old="02. Maqueta Colegio Fé y Alegría Juan José Rondón (Vista Cenital).jpg"; new="imagen2.jpg"},
    @{old="03. Grupo de mujeres.jpg"; new="imagen3.jpg"},
    @{old="04. Jesus es rey de paz.jpg"; new="imagen4.jpg"},
    @{old="04. Maqueta PTAP Yomasa.jpg"; new="imagen5.jpg"},
    @{old="05. Maqueta localización general PTAP Yoamsa.jpg"; new="imagen6.jpg"},
    @{old="06. Mujeres con galletas de soda en comedor.jpg"; new="imagen7.jpg"},
    @{old="06. Tanque almacenamiento acueducto comunitario Villa Diana.jpg"; new="imagen8.jpg"},
    @{old="07. Conexión mangueras tanque comunitario Juan José Rondón.jpg"; new="imagen9.jpg"},
    @{old="07. Mujeres y niño comiendo en comedor.jpg"; new="imagen10.jpg"},
    @{old="08. Grupo de monjas y un hombre.jpg"; new="imagen11.jpg"},
    @{old="08. Panorámica barrio y acueducto comunitario aéreo barrio San Pedro.jpg"; new="imagen12.jpg"},
    @{old="09. Foto día de los niños.jpg"; new="imagen13.jpg"},
    @{old="09. PTAP Yomasa en construcción.jpg"; new="imagen14.jpg"},
    @{old="10. Personas en el pesebre.jpg"; new="imagen15.jpg"},
    @{old="25. Grupo de Personas banderas de Fé y Alegría y de Colombia.jpg"; new="imagen16.jpg"},
    @{old="28. Niños en patio San Juanero.jpg"; new="imagen17.jpg"},
    @{old="29. Grupo Jovenes Activos.jpg"; new="imagen18.jpg"},
    @{old="31. Personas bailando.jpg"; new="imagen19.jpg"},
    @{old="32. Grupo Musical San Pedro  - V Festival del Agua.jpg"; new="imagen20.jpg"},
    @{old="33. Grupo baile Acción Juvenil  - V Festival del Agua.jpg"; new="imagen21.jpg"},
    @{old="34. Panorámica V Festival del Agua.jpg"; new="imagen22.jpg"},
    @{old="35. Grupo de baile y público - V Festival del Agua.jpg"; new="imagen23.jpg"},
    @{old="Aniversario de Panaderia JJ Rondon.png"; new="imagen24.png"},
    @{old="Bautismo Santa Maria Micaela.png"; new="imagen25.png"},
    @{old="Brindis Niños Primera Comunion.png"; new="imagen26.png"},
    @{old="Confirmaciones.png"; new="imagen27.png"},
    @{old="Entrega de Regalos de Navidad.png"; new="imagen28.png"},
    @{old="Eucaristia por Monseñor Pinilla, Sacerdote Frans Monroy y Sacerdote Orlando.png"; new="imagen29.png"},
    @{old="Fogata de Bendición del Fuego.png"; new="imagen30.png"},
    @{old="Jueves Santo.png"; new="imagen31.png"},
    @{old="Monseñor Pinillos en el Sacramento de la Confirmación.png"; new="imagen32.png"},
    @{old="Niños Cantores.png"; new="imagen33.png"},
    @{old="Niños del Coro de Fe y Alegría.png"; new="imagen34.png"},
    @{old="Primer Matrimonio.png"; new="imagen35.png"},
    @{old="Primera Orden Sacerdotal.png"; new="imagen36.png"},
    @{old="Reinado Escolar.png"; new="imagen37.png"},
    @{old="Reinado Fe y Alegria.png"; new="imagen38.png"},
    @{old="Sacerdote Monroy Primeras Comuniones.png"; new="imagen39.png"},
    @{old="Sacerdote Orlando Rodriguez.png"; new="imagen40.png"},
    @{old="Viacrucis Vienres Santo.png"; new="imagen41.png"},
    @{old="Viacrucis Viernes Santo 2.png"; new="imagen42.png"}
)

Write-Host "Iniciando renombrado..." -ForegroundColor Green

foreach ($archivo in $archivos) {
    $rutaVieja = Join-Path $sourcePath $archivo.old
    $rutaNueva = Join-Path $sourcePath $archivo.new
    
    if (Test-Path $rutaVieja) {
        Rename-Item -Path $rutaVieja -NewName $archivo.new
        Write-Host "OK: $($archivo.old) -> $($archivo.new)" -ForegroundColor Cyan
    } else {
        Write-Host "NO ENCONTRADO: $($archivo.old)" -ForegroundColor Yellow
    }
}

Write-Host "Proceso completado!" -ForegroundColor Green
