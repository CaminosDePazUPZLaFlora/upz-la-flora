# Renombrar archivos restantes
$ruta = "static\img_MaterialAudiovisual"

$renombrar = @{
    "02. Maqueta Colegio Fé y Alegría Juan José Rondón (Vista Cenital).jpg" = "imagen2.jpg"
    "05. Maqueta localización general PTAP Yoamsa.jpg" = "imagen6.jpg"
    "07. Conexión mangueras tanque comunitario Juan José Rondón.jpg" = "imagen9.jpg"
    "07. Mujeres y niño comiendo en comedor.jpg" = "imagen10.jpg"
    "08. Panorámica barrio y acueducto comunitario aéreo barrio San Pedro.jpg" = "imagen12.jpg"
    "09. Foto día de los niños.jpg" = "imagen13.jpg"
    "09. PTAP Yomasa en construcción.jpg" = "imagen14.jpg"
    "25. Grupo de Personas banderas de Fé y Alegría y de Colombia.jpg" = "imagen16.jpg"
    "28. Niños en patio San Juanero.jpg" = "imagen17.jpg"
    "33. Grupo baile Acción Juvenil  - V Festival del Agua.jpg" = "imagen21.jpg"
    "34. Panorámica V Festival del Agua.jpg" = "imagen22.jpg"
    "35. Grupo de baile y público - V Festival del Agua.jpg" = "imagen23.jpg"
    "Brindis Niños Primera Comunion.png" = "imagen26.png"
    "Eucaristia por Monseñor Pinilla, Sacerdote Frans Monroy y Sacerdote Orlando.png" = "imagen29.png"
    "Fogata de Bendición del Fuego.png" = "imagen30.png"
    "Monseñor Pinillos en el Sacramento de la Confirmación.png" = "imagen32.png"
    "Niños Cantores.png" = "imagen33.png"
    "Niños del Coro de Fe y Alegría.png" = "imagen34.png"
}

foreach ($viejo in $renombrar.Keys) {
    $rutaVieja = Join-Path $ruta $viejo
    $rutaNueva = Join-Path $ruta $renombrar[$viejo]
    
    if (Test-Path $rutaVieja) {
        Rename-Item -Path $rutaVieja -NewName $renombrar[$viejo] -Force
        Write-Host "OK: $viejo -> $($renombrar[$viejo])" -ForegroundColor Green
    }
}
