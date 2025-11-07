# Script para corregir todas las rutas de imágenes agregando /upz-la-flora/
# Este script procesa todos los archivos HTML en la carpeta layouts

$layoutsPath = "layouts"
$archivosHTML = Get-ChildItem -Path $layoutsPath -Filter "*.html" -Recurse

Write-Host "Iniciando corrección de rutas de imágenes..." -ForegroundColor Green
Write-Host ""

$totalArchivos = 0
$totalReemplazos = 0

foreach ($archivo in $archivosHTML) {
    $contenido = Get-Content $archivo.FullName -Raw -Encoding UTF8
    $contenidoOriginal = $contenido
    
    # Reemplazar rutas que empiezan con /img_ pero NO con /upz-la-flora/img_
    $contenido = $contenido -replace '(src|image)=(["''])/(img_[^"'']+)', '$1=$2/upz-la-flora/$3'
    
    # Reemplazar rutas de audio que empiezan con /audio pero NO con /upz-la-flora/audio
    $contenido = $contenido -replace '(src)=(["''])/(audio[^"'']+)', '$1=$2/upz-la-flora/$3'
    
    # Reemplazar rutas de CSS que empiezan con /css/ pero NO con /upz-la-flora/css/
    $contenido = $contenido -replace 'href=(["''])/(css/[^"'']+)', 'href=$1/upz-la-flora/$2'
    
    if ($contenido -ne $contenidoOriginal) {
        $reemplazos = ([regex]::Matches($contenidoOriginal, '(src|image|href)=(["''])/(img_|audio|css/)')).Count
        Set-Content -Path $archivo.FullName -Value $contenido -Encoding UTF8 -NoNewline
        Write-Host "OK: $($archivo.Name): $reemplazos reemplazos" -ForegroundColor Cyan
        $totalArchivos++
        $totalReemplazos += $reemplazos
    } else {
        Write-Host "- $($archivo.Name): Sin cambios" -ForegroundColor Gray
    }
}

Write-Host ""
Write-Host "Proceso completado!" -ForegroundColor Green
Write-Host "Archivos modificados: $totalArchivos" -ForegroundColor Yellow
Write-Host "Total de reemplazos: $totalReemplazos" -ForegroundColor Yellow
