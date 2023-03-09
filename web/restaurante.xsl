<?xml version="1.0" encoding='utf-8'?>
<!-- Módulo: Desarrollo de Aplicaciones Multiplataforma (DAM)
	Asignatura: Lenguaje de marcas y sistemas de gestión de la información
	Tarea: XSLT
	UD: Unidad 4 - XSLT
	Autor: Olatz Da Silva Rosales
	Fecha: 10/03/2023 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" />

<!-- Plantilla principal -->
<xsl:template match="//reservaeventos">

<!-- Creamos variable -->
<xsl:variable name="nr" select="'El clarete'"/>

<!-- Esctructura de la página -->
<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Club de montaña" />
			<a href="teatro.xml">Teatro</a>
			<a href="restaurante.xml">Restaurante</a>
			<a href="festival.xml">Festival</a>
		</header>
		
		<main>
			<h1>
				<a href="{restaurante[nombrerestaurante=$nr]/informacion}">
					<xsl:value-of select="$nr,'-', restaurante/ciudad"/>
				</a>
			</h1>

			<xsl:for-each select="restaurante[nombrerestaurante=$nr]/menu">
				<article class="restaurante">
					<h3><xsl:value-of select="@tipo"/></h3>
					<xsl:for-each select="plato">
					<p><xsl:value-of select="."/></p>
					</xsl:for-each>
				</article>
			</xsl:for-each>
			
		</main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>