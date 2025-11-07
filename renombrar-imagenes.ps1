# Script para renombrar imagenes en img_MaterialAudiovisual
# Convierte nombres con espacios y caracteres especiales a imagen1.jpg, imagen2.jpg, etc.

$sourcePath = "static\img_MaterialAudiovisual"

# Lista de archivos en el orden deseado
$archivos = @(
    "01. Dos monjas un hombre.jpg",
    "02. Maqueta Colegio Fe y Alegria Juan Jose Rondon (Vista Cenital).jpg",
    "03. Grupo de mujeres.jpg",
    "04. Jesus es rey de paz.jpg",
    "04. Maqueta PTAP Yomasa.jpg",
    "05. Maqueta localización general PTAP Yoamsa.jpg",
    "06. Mujeres con galletas de soda en comedor.jpg",
    "06. Tanque almacenamiento acueducto comunitario Villa Diana.jpg",
    "07. Conexión mangueras tanque comunitario Juan José Rondón.jpg",
    "07. Mujeres y niño comiendo en comedor.jpg",
    "08. Grupo de monjas y un hombre.jpg",
    "08. Panorámica barrio y acueducto comunitario aéreo barrio San Pedro.jpg",
    "09. Foto día de los niños.jpg",
    "09. PTAP Yomasa en construcción.jpg",
    "10. Personas en el pesebre.jpg",
    "25. Grupo de Personas banderas de Fé y Alegría y de Colombia.jpg",
    "28. Niños en patio San Juanero.jpg",
    "29. Grupo Jovenes Activos.jpg",
    "31. Personas bailando.jpg",
    "32. Grupo Musical San Pedro  - V Festival del Agua.jpg",
    "33. Grupo baile Acción Juvenil  - V Festival del Agua.jpg",
    "34. Panorámica V Festival del Agua.jpg",
    "35. Grupo de baile y público - V Festival del Agua.jpg",
    "Aniversario de Panaderia JJ Rondon.png",
    "Bautismo Santa Maria Micaela.png",
    "Brindis Niños Primera Comunion.png",
    "Confirmaciones.png",
    "Entrega de Regalos de Navidad.png",
    "Eucaristia por Monseñor Pinilla, Sacerdote Frans Monroy y Sacerdote Orlando.png",
    "Fogata de Bendición del Fuego.png",
    "Jueves Santo.png",
    "Monseñor Pinillos en el Sacramento de la Confirmación.png",
    "Niños Cantores.png",
    "Niños del Coro de Fe y Alegría.png",
    "Primer Matrimonio.png",
    "Primera Orden Sacerdotal.png",
    "Reinado Escolar.png",
    "Reinado Fe y Alegria.png",
    "Sacerdote Monroy Primeras Comuniones.png",
    "Sacerdote Orlando Rodriguez.png",
    "Viacrucis Vienres Santo.png",
    "Viacrucis Viernes Santo 2.png"
)

Write-Host "Iniciando renombrado de archivos..." -ForegroundColor Green
Write-Host ""

$contador = 1
foreach ($archivo in $archivos) {
    $rutaCompleta = Join-Path $sourcePath $archivo
    
    if (Test-Path $rutaCompleta) {
        # Obtener la extensión del archivo
        $extension = [System.IO.Path]::GetExtension($archivo)
        
        # Crear nuevo nombre
        $nuevoNombre = "imagen$contador$extension"
        $nuevaRuta = Join-Path $sourcePath $nuevoNombre
        
        # Renombrar archivo
        Rename-Item -Path $rutaCompleta -NewName $nuevoNombre
        Write-Host "✓ Renombrado: $archivo -> $nuevoNombre" -ForegroundColor Cyan
        
        $contador++
    } else {
        Write-Host "✗ No encontrado: $archivo" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Proceso completado. Total de archivos renombrados: $($contador - 1)" -ForegroundColor Green
Write-Host ""
Write-Host "Ahora actualiza el archivo material-audiovisual.html con las nuevas rutas." -ForegroundColor Yellow
