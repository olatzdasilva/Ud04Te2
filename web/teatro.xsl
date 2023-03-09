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

<!-- Esctructura de la página -->
    <html>

    <head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

    <body>

        <header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="teatro.xml">Teatro</a>
			<a href="restaurante.xml">Restaurante</a>
			<a href="festival.xml">Festival</a>
		</header>

        <main class="principal">
			<section class="teatro">
				<h1>Proximas obras de teatro </h1>
				<ul>
					<xsl:apply-templates select="//teatro">
					<xsl:sort select="fechahora/@dia" order="descending"/>
					</xsl:apply-templates>

					<xsl:apply-templates select="//teatro[obra/fechahora/@dia = '2023-01']">
					<xsl:sort select="obra/fechahora/@dia" order="descending"/>
					</xsl:apply-templates>
				</ul>
			</section>
		</main>
        
        <footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>

    </body>
    </html>
</xsl:template>

 <!-- Plantilla nombres de cada obra -->
    <xsl:template match="teatro">
		<li>
			<xsl:choose>
				<xsl:when test="precio <= 20">
				<u><xsl:value-of select="concat(fechahora/@dia,':', obra)"/></u>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat(fechahora/@dia, ':', obra)"/>
				</xsl:otherwise>
			</xsl:choose>
        </li>
    </xsl:template>

</xsl:stylesheet>