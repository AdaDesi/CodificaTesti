<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
       xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
       xmlns:tei="http://www.tei-c.org/ns/1.0"
       xmlns="http://www.w3.org/1999/xhtml">
       
       <xsl:output 
            method="html" 
            encoding="UTF-8" 
            indent="yes"
            omit-xml-declaration="yes" />


<!--*********************ELEMENTI STRUTTURALI***************************-->
    <xsl:template match="/tei:TEI">
        <html> 
            <head> 
                <title> Lettere LL1.31 I e II </title>
                <link href="stile.css" rel="stylesheet" type="text/css"/>
                <script type="text/javascript" src="progetto-esame.js"/>
            </head>
        <body onload="disappear()">
            <xsl:apply-templates />
        </body> 
        </html>
    </xsl:template>

    <xsl:template match="tei:teiHeader">
        <nav><h1 id="title">Lettere LL1.31 I e II </h1>
         <h3>Menu</h3>
            <ul>
                <li><a href="#info">Informazioni sul documento</a></li>
                <li><a href="#testo">Testo</a></li>
                <li><a href="#app">Appendici</a></li>
            </ul>
        </nav>
        <section class="header">
            <h1><a name="info">Informazioni sul documento</a></h1>
            <xsl:apply-templates />
        </section>
    </xsl:template>

    <xsl:template match="tei:text/tei:body">
        <section class="body">
            <h1><a name="testo">Testo</a></h1> <br/>
            <xsl:apply-templates/>
        </section>
    </xsl:template>

    <xsl:template match="tei:text/tei:back">
        <section class="back">
            <h1><a name="app">Appendici</a></h1> <br/>
            <xsl:apply-templates/>
        </section>
    </xsl:template>

<!--*********************ELEMENTI DELL'HEADER***************************-->
    <xsl:template match="tei:fileDesc">
        <h2>Descrizione del documento :</h2><br/>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:profileDesc">
        <h2>Descrizione degli aspetti non bibliografici del documento :</h2><br/>
        <xsl:apply-templates/>
    </xsl:template>   
    
    <xsl:template match="tei:titleStmt">
        <h3>Lettera LL1.31 (I-II)</h3>
        <br/>
        <h4>Informazioni sull'edizione</h4>
        <xsl:apply-templates/> 
    </xsl:template>

    <xsl:template match="tei:titleStmt/tei:title">
        <b>Titolo della lettera <xsl:value-of select="./@xml:id"/> :</b>
        <i><xsl:apply-templates/> </i>
        <br/>
    </xsl:template>


    <xsl:template match="tei:titleStmt/tei:author">
        <b>Autore :</b>
        <a class="name">
            <xsl:attribute name="href">
                <xsl:value-of select="./@ref"></xsl:value-of>
            </xsl:attribute>
            <xsl:apply-templates/> 
        </a>
        <br/>
    </xsl:template>

    <xsl:template match="tei:fileDesc//tei:resp">
        <b><xsl:value-of select="."/> :</b>
    </xsl:template> 
    
    <xsl:template match="tei:fileDesc//tei:name">
        <ul>
            <xsl:for-each select=".">
                <xsl:choose>
                    <xsl:when test="./@xml:id">
                        <li> 
                            <xsl:apply-templates/>
                            <a>
                                <xsl:attribute name="name">
                                    <xsl:value-of select="./@xml:id"/>
                                </xsl:attribute>
                                (ref. <xsl:value-of select="./@xml:id"/>)
                            </a>;
                        </li>
                    </xsl:when>
                    <xsl:when test="./@ref">
                    <li> 
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="./@ref"/>
                            </xsl:attribute>
                            <xsl:apply-templates/>
                        </a>;
                    </li>
                </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </ul>
    </xsl:template>


    <xsl:template match="tei:editionStmt">
        <b>Edizione :</b>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:editionStmt//tei:date">
        , <xsl:apply-templates/>
        <br/>
    </xsl:template>

    <xsl:template match="tei:titleStmt">
        <h4>Informazioni sulla pubblicazione</h4>
        <br/>
        <xsl:apply-templates/> 
    </xsl:template>

    <xsl:template match="tei:availability">
        <b>Licenza : </b> 
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:licence">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="./@target"></xsl:value-of>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </a>
        <br/>
    </xsl:template>

    <xsl:template match="tei:sourceDesc">
        <h4>Informazioni sulla fonte</h4>
        <br/>
        <xsl:apply-templates/> 
    </xsl:template>

    <xsl:template match="tei:sourceDesc/tei:bibl">
        <b>Responsabilità della fonte dei dati :</b> <a>
            <xsl:attribute name="href">
                <xsl:value-of select="./@resp"/>
            </xsl:attribute>
            <xsl:value-of select="./@source"/>
            </a>
            (n. della lettera nel volume cartaceo: <xsl:value-of select="./@ana"/>, <xsl:value-of select="./tei:citedRange"/>)
        <br/>
    </xsl:template>

    <xsl:template match="tei:msIdentifier">
        <b>Identificazione della fonte :</b> 
        <br/>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:country">
        <u>Ubicazione</u> : <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:settlement">
        , <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:repository">
        , <a>
            <xsl:attribute name="href">
                <xsl:value-of select="./@ref"/>
            </xsl:attribute>
            <xsl:apply-templates/> (id. nazionale : <xsl:value-of select="./@n"/>)
        </a>
        <br/>
    </xsl:template>

    <xsl:template match="tei:msIdentifier/tei:idno">
        <u>Numero identificativo : </u> <xsl:apply-templates/>
        <br/>
    </xsl:template>

    <xsl:template match="tei:msIdentifier/tei:altIdentifier/tei:idno">
        <u>Collocazione : </u> <xsl:apply-templates/>
        <br/>
    </xsl:template>

    <xsl:template match="tei:msContents">
        <b>Questo documento è composto da :</b>
        <ol>
            <xsl:apply-templates/>
        </ol>
    </xsl:template>

    <xsl:template match="tei:msItem">
        <li>
            <b><xsl:value-of select="./@corresp"/></b>
            <br/>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="tei:msItem/tei:author">
        <b>Autore :</b> 
        <a  class="name">
            <xsl:attribute name="href">
                <xsl:value-of select="./@ref"/>
            </xsl:attribute>
            <xsl:apply-templates/>;
        </a>
        <br/>
    </xsl:template>

    <xsl:template match="tei:msItem/tei:title">
        <b>Titolo</b> : <xsl:apply-templates/>;
        <br/>
    </xsl:template>

    <xsl:template match="tei:msItem/tei:textLang">
        <b>Lingua usata</b> : <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:physDesc">
        <b>Descrizione fisica :</b>
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

    <xsl:template match="tei:physDesc//tei:support">
        <li>
            <b>Supporto :</b> 
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="tei:material">
        (materiale : <xsl:apply-templates/>)
    </xsl:template>

    <xsl:template match="tei:support/tei:p">
        <span class="support">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


    <xsl:template match="tei:extent">
        <li>
            <b>Estensione :</b> 
            <ul>
                <li>
                    Lettera LL1.31_II :
                    <ul>
                        <li>Numero di fogli: 2 </li>
                        <!--<li> <xsl:call-template name="height"/></li>-->
                        <li> <xsl:apply-templates select="./tei:dimensions[@corresp='#LL1.31_II']"/></li>
                    </ul>
                </li>
                <li>
                    Lettera LL1.31_I :
                    <ul>
                        <li>Numero di fogli: 1 </li>
                        <!--<li> <xsl:call-template name="height"/></li>-->
                        <li> <xsl:apply-templates select="./tei:dimensions[@corresp='#LL1.31_I']"/></li>
                    </ul>
                </li>
            </ul>
        </li>
    </xsl:template>

    <xsl:template match="tei:dimensions[@corresp='#LL1.31_II']">
        Dimensioni : (<xsl:value-of select="./tei:height"/> x <xsl:value-of select="./tei:width"/>) <xsl:value-of select="../tei:dimensions/@unit"/>
    </xsl:template>

    <xsl:template match="tei:extent/tei:dimensions[@corresp='#LL1.31_I']">
        Dimensioni : (<xsl:value-of select="./tei:height"/> x <xsl:value-of select="./tei:width"/>) <xsl:value-of select="../tei:dimensions/@unit"/>
    </xsl:template>

    <xsl:template match="tei:foliation">
        <li>
            <b>Impaginazione :</b> 
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="tei:condition">
        <li>
            <b>Condizioni :</b> 
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="tei:handDesc">
        <li>
            <b>Contribuzioni :</b> 
            <ol>
                <xsl:apply-templates/>
            </ol>
        </li>    
    </xsl:template>

    <xsl:template match="tei:handDesc/tei:handNote">
        <xsl:choose>
            <xsl:when test="./@corresp='#VB'">
                <li>
                    Contribuzione principale di <a class="name" href="#VB">V. Bellini</a> : <xsl:apply-templates/>
                </li>  
            </xsl:when>
            <xsl:otherwise>
                <li>
                    Catalogatore <a>
                        <xsl:attribute name="href">
                            #<xsl:value-of select="./@xml:id"/>
                        </xsl:attribute>
                        <xsl:value-of select="./@xml:id"/>
                    </a> : <xsl:apply-templates/>
                </li>  
            </xsl:otherwise>
        </xsl:choose> 
    </xsl:template>

    <xsl:template match="tei:additional">
        <b>Ulteriori informazioni :</b> 
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:supportDesc//tei:ref">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="./@target"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>

    <xsl:template match="tei:correspDesc">
        <b>Descrizione della corrispondenza della lettera <xsl:value-of select="./@ref"/> </b>
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

    <xsl:template match="tei:correspAction">
        <xsl:choose>
            <xsl:when test="./@type='sent'">
                <li>
                    <b>Invio</b> : <xsl:apply-templates/>;
                </li>
            </xsl:when>
            <xsl:when test="./@type='received'">
                <li>
                    <b>Ricezione</b> : <xsl:apply-templates/>;
                </li>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:correspContext">
        <li>
            <b>Contesto</b> : <xsl:apply-templates/>;
        </li>
    </xsl:template>

    <xsl:template match="tei:textClass">
        <b>Tipo di documento : </b> <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:keywords/tei:term">
        (responsabilità della classificazione :
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="./@resp"/>
            </xsl:attribute>
            <xsl:value-of select="./@resp"/>
        </a>, 
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="../@scheme"/>
            </xsl:attribute>
            <xsl:value-of select="./@scheme"/>
        </a>
        )
        <xsl:apply-templates/> 
        <br/>
    </xsl:template>

    <xsl:template match="tei:langUsage/tei:language">
        <b>Lingua usata nella lettera <xsl:value-of select="./@corresp"/>: </b>
        <xsl:apply-templates/> 
        <br/>
    </xsl:template>

<!--*********************ELEMENTI DEL BODY***************************-->
    <xsl:template match="tei:body/tei:div">
        <xsl:choose>
            <xsl:when test="./@type='fronte-recto'">
                <div class="fronte-recto">
                    <img id="img_1" src="https://raw.githubusercontent.com/angelodel80/corsoCodifica/master/CTaa19-20/progetto-esame/scans/LL1/LL1.31.I-II/jpeg300/LL1.31.I-II_0001.jpg" width="400" height="600" align="right" onmouseover="ZoomIn(1);" onmouseout="ZoomOut(1);" />
                    <xsl:apply-templates/>
                </div>

            </xsl:when>
            <xsl:when test="./@type='retro-recto'">
                <div class="retro-recto">
                    <img id="img_2" src="https://raw.githubusercontent.com/angelodel80/corsoCodifica/master/CTaa19-20/progetto-esame/scans/LL1/LL1.31.I-II/jpeg300/LL1.31.I-II_0002.jpg" width="400" height="600" align="right"  onmouseover="ZoomIn(2);" onmouseout="ZoomOut(2);" />
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:when test="./@type='fronte-verso'">
                <div class="fronte-verso">
                    <img id="img_3" src="https://raw.githubusercontent.com/angelodel80/corsoCodifica/master/CTaa19-20/progetto-esame/scans/LL1/LL1.31.I-II/jpeg300/LL1.31.I-II_0003.jpg" width="400" height="600" align="right"  onmouseover="ZoomIn(3);" onmouseout="ZoomOut(3);" />
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:when test="./@type='retro-verso'">
                <div class="retro-verso">
                    <img id="img_4" src="https://raw.githubusercontent.com/angelodel80/corsoCodifica/master/CTaa19-20/progetto-esame/scans/LL1/LL1.31.I-II/jpeg300/LL1.31.I-II_0004.jpg" width="400" height="600" align="right"  onmouseover="ZoomIn(4);" onmouseout="ZoomOut(4);" />
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:when test="./@type='fronte'">
                <div class="fronte">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:when test="./@type='retro'">
                <div class="retro">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:ab">
            <xsl:if test="./@type">
                <xsl:variable name="type">
                        <xsl:value-of select="current()/@type" />
                </xsl:variable>
                <xsl:if test="./@n">
                    <xsl:variable name="n">
                        <xsl:value-of select="current()/@n" />
                    </xsl:variable>
                <p class="{$type}" id="{$n}"><xsl:apply-templates/></p>
                </xsl:if>
            </xsl:if>
    </xsl:template>

    <xsl:template match="tei:ab[@type='parag']">
        <p class="parag">
            <xsl:attribute name="id">
                <xsl:value-of select="./@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:ab[@type='paratext']">
        <span class="paratext">
            <xsl:attribute name="id">
                <xsl:value-of select="./@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:byline">
        <p><xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="tei:pb">
        <xsl:choose>
            <xsl:when test="./@xml:id='LL1.31_II_fol_1fr'">
                <h4>Pagina 1 (fronte-recto) - lettera LL1.31-II</h4>
                <hr/><hr/> <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="./@xml:id='LL1.31_II_fol_1rr'">
                <h4>Pagina 2 (retro-recto) - lettera LL1.31-II</h4>
                <hr/><hr/> <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="./@xml:id='LL1.31_II_fol_1fv'">
                <h4>Pagina 3 (fronte-verso) - lettera LL1.31-II</h4>
                <hr/><hr/> <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="./@xml:id='LL1.31_II_fol_1rv'">
                    <h4>Pagina 4 (retro-verso) - lettera LL1.31-II</h4>
                    <hr/><hr/> <xsl:apply-templates/>
                </xsl:when>
                <xsl:when test="./@xml:id='LL1.31_I_fol_2f'">
                    <h4>Pagina 1 (fronte) - lettera LL1.31-I</h4>
                    <hr/> <xsl:apply-templates/>
                </xsl:when>
                <xsl:when test="./@xml:id='LL1.31_I_fol_2r'">
                    <h4>Pagina 2 (retro) - lettera LL1.31-I</h4>
                    <hr/> <xsl:apply-templates/>
                </xsl:when>
                <xsl:when test="./@corresp='#LL1.31_I_fol_2r'">
                    <h4>Pagina 2 (retro) - lettera LL1.31-I</h4>
                <hr/> <xsl:apply-templates/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:l">
        <xsl:apply-templates /><br/>
    </xsl:template>

    <xsl:template match="//tei:div/tei:head">
        <h3 class="center"><xsl:apply-templates /></h3>
    </xsl:template>

    <xsl:template match="tei:lb">
        <br/> <xsl:if test="./@n">
            <span class="line">
                <xsl:value-of select="current()/@n" />
            </span>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:join">
    </xsl:template>
    
    <xsl:template match="tei:space/tei:desc">
        <span class="desc">
            Descrizione della pagina corrente, priva di testo : <xsl:apply-templates/> 
            <br/>
        </span>
    </xsl:template>

    <xsl:template match="tei:fw">
        <span>
            <xsl:attribute name="class">
                <xsl:value-of select="./@type"></xsl:value-of>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

<!--*********************ELEMENTI DEL BACK***************************-->
    <xsl:template match="tei:back/tei:div">
        <xsl:choose>
            <xsl:when test="./@type='notes'">
                <div class="note">
                    <h2>Note</h2>
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:when test="./@type='lists'">
                <div class="termini">
                    <h2>Termini</h2>
                    <ol><xsl:apply-templates/></ol>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:back/tei:div[@type='notes']/tei:div">
        <xsl:choose>
            <xsl:when test="./@type='ann_notes'">
                <span class="ann_notes">
                    <h3>Note ai testi :</h3>
                    <br/>
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="./@type='bibliography'">
                <div class="allBibl">
                    <h3>Bibliografia :</h3>
                    <ol>
                        <xsl:apply-templates/>
                    </ol>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:listBibl">
        <span class="bibl">
            <xsl:attribute name="id">
                <xsl:value-of select="./@xml:id"></xsl:value-of>
            </xsl:attribute>
            <li class="bibl">
                <ul><xsl:apply-templates/></ul>
            </li>
        </span>
    </xsl:template>

    <xsl:template match="tei:listBibl/tei:head">
        <h4><xsl:apply-templates/></h4><br/>
    </xsl:template>

    <xsl:template match="tei:listBibl/tei:bibl">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="tei:bibl/tei:author">
        Autore/autrice : <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:bibl/tei:date">
        (<xsl:apply-templates/>);
    </xsl:template>

    <xsl:template match="tei:bibl/tei:citedRange">
        pag. <xsl:apply-templates/>; <br/>
    </xsl:template>

    <xsl:template match="tei:div[@type='lists']/tei:listPerson">
        <span class="nomi">
            <li><h4>Lista dei nomi :</h4><br/>
                <ul><xsl:apply-templates/></ul>
            </li>
        </span>
    </xsl:template>

    <xsl:template match="tei:listPerson//tei:person">
        <li>
            <a class="name">
                <xsl:attribute name="name">
                    <xsl:value-of select="./@xml:id"/>
                </xsl:attribute>
                <xsl:apply-templates/>
            </a>
        </li>
    </xsl:template>

    <xsl:template match="tei:listPerson//tei:gloss">
        <xsl:choose>
            <xsl:when test="./@source!=''">
                (<a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="./@source"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </a>)
            </xsl:when>
            <xsl:otherwise>
                (<xsl:apply-templates/>)
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:div[@type='lists']/tei:listPlace">
        <span class="luoghi"> 
            <li><h4>Lista dei luoghi :</h4><br/>
                <ul><xsl:apply-templates/></ul>
            </li>
        </span>
    </xsl:template>

    <xsl:template match="tei:listPlace/tei:place">
        <li><a class="place">
            <xsl:attribute name="name">
                <xsl:value-of select="./@xml:id"/>
            </xsl:attribute>
            <xsl:attribute name="href">
                <xsl:value-of select="./@source"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a></li>
    </xsl:template>

    <xsl:template match="tei:div[@type='lists']/tei:list[@type='works']">
        <span class="opere"> 
            <li><h4>Lista delle opere citate :</h4><br/>
                <ul><xsl:apply-templates/></ul>
            </li>
        </span>
    </xsl:template>

    <xsl:template match="tei:list[@type='works']/tei:item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="tei:div[@type='lists']/tei:list[@type='works']//tei:bibl/tei:author">
        <xsl:apply-templates/>,
    </xsl:template>

    <xsl:template match="tei:div[@type='lists']/tei:list[@type='works']//tei:bibl/tei:title">
        <a class="work">
            <xsl:attribute name="name">
                <xsl:value-of select="../@xml:id"/>
            </xsl:attribute>
            <xsl:attribute name="href">
                <xsl:value-of select="../@source"/>
            </xsl:attribute>
            <i><xsl:apply-templates/></i>
        </a>;
    </xsl:template>

    <xsl:template match="tei:div[@type='lists']/tei:list[@type='terms']">
        <span class="terminiSpec">
            <li><h4>Lista dei termini speciali :</h4><br/>
                <ul><xsl:apply-templates/></ul>
            </li>
        </span> 
    </xsl:template>

    <xsl:template match="tei:list[@type='terms']/tei:item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="tei:item/tei:term">
        <i><a>
            <xsl:attribute name="name">
                <xsl:value-of select="./@xml:id"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="class">
                <xsl:value-of select="./@type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a></i>
    </xsl:template>

    <xsl:template match="tei:item/tei:gloss">
        (<a>
            <xsl:attribute name="href">
                <xsl:value-of select="./@source"/>
            </xsl:attribute>
            Link al significato
        </a>)
    </xsl:template>

    <xsl:template match="tei:div[@type='lists']/tei:listOrg">
        <span class="orgList"> 
            <li><h4>Lista delle organizzazioni :</h4><br/>
                <ul><xsl:apply-templates/></ul>
            </li>
        </span>
    </xsl:template>

    <xsl:template match="tei:listOrg/tei:org">
        <li>
            <a class="org">
                <xsl:attribute name="name">
                    <xsl:value-of select="./@xml:id"/>
                </xsl:attribute>
                <xsl:attribute name="href">
                    <xsl:value-of select="./@source"/>
                </xsl:attribute>
                <xsl:apply-templates/>
            </a>
        </li>
    </xsl:template>

    <xsl:template match="tei:org/tei:note">
        (<a>
            <xsl:attribute name="href">
                <xsl:value-of select="./@source"/>
            </xsl:attribute>
            Link a informazioni
        </a>)
    </xsl:template>

    <!--*********************ELEMENTI GENERALI***************************-->
    <xsl:template match="tei:note">
        <xsl:if test="./@n">
            <xsl:choose>
                <xsl:when test="../@type='ann_notes'">
                    <span class="ann_notes">
                        <xsl:attribute name="id">
                            <xsl:value-of select="current()/@n"/>
                        </xsl:attribute>
                        Nota <xsl:value-of select="current()/@n"/> : <xsl:apply-templates/>
                    </span>
                </xsl:when>
                <xsl:when test="./@type='ann_notes'">
                    <span class="ann_notes">
                        <xsl:attribute name="id">
                            <xsl:value-of select="current()/@n"/>
                        </xsl:attribute>
                        Nota <xsl:value-of select="current()/@n"/> : <xsl:apply-templates/>
                </span>
                </xsl:when>
                <xsl:when test="./@type='translation'">
                    <span class="trad">  
                        <xsl:attribute name="id">
                            <xsl:value-of select="current()/@n"/>
                        </xsl:attribute>
                        [Trad: <xsl:apply-templates/>]
                    </span>
                </xsl:when>
                <xsl:when test="./@type='certainty'">
                <sup>
                    <span class="cert">
                        <xsl:attribute name="id">
                            <xsl:value-of select="current()/@n"/>
                        </xsl:attribute>
                        Affidabilità : <xsl:apply-templates/>
                    </span>
                </sup>
                </xsl:when>
                <xsl:otherwise>
                    <sup>
                        <span class="nota">
                            <xsl:attribute name="id">
                            <xsl:value-of select="current()/@n"/>
                        </xsl:attribute>
                            <xsl:apply-templates/>
                        </span>
                    </sup>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
        <br/>
    </xsl:template>

    <xsl:template match="tei:unclear">
        <i class="unclear"><xsl:apply-templates /></i>
    </xsl:template>

    <xsl:template match="tei:mentioned">
        "<xsl:apply-templates />"
    </xsl:template>


    <xsl:template match="tei:gap">
        <xsl:if test="./@reason='ink blot'">
            <small>[testo illeggibile a causa di una macchia di inchiostro]</small>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:term">
        <xsl:choose>
            <xsl:when test="./@type='music-term'">
                <a class="music-term">
                    <xsl:attribute name="href">
                        <xsl:value-of select="./@ref"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:apply-templates />
                </a>
            </xsl:when>
            <xsl:when test="./@type='work'and./@rend='underline'">
                <u><a class="work">
                    <xsl:attribute name="href">
                        <xsl:value-of select="./@ref"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:apply-templates />
                </a></u>
            </xsl:when>
            <xsl:when test="./@type='work'">
                <a class="work">
                    <xsl:attribute name="href">
                        <xsl:value-of select="./@ref"></xsl:value-of>
                    </xsl:attribute>
                    <i><xsl:apply-templates /></i>
                </a>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:body//tei:orgName|tei:teiHeader//tei:orgName">
        <a class="org">
            <xsl:attribute name="href">
                <xsl:value-of select="./@ref"></xsl:value-of>
            </xsl:attribute>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="tei:body//tei:persName|tei:teiHeader//tei:persName">
        <a class="name">
            <xsl:attribute name="href">
                <xsl:value-of select="./@ref"/>
            </xsl:attribute>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="tei:body//tei:placeName|tei:teiHeader//tei:placeName">
        <a class="place">
            <xsl:attribute name="href">
                <xsl:value-of select="./@ref"/>
            </xsl:attribute>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="tei:choice">
        <xsl:if test="tei:sic[@resp='#VB']">
            <xsl:choose>
                    <xsl:when test="./tei:sic[@cert='high']and./tei:sic[@rend='underline']"> [<small>Errore di <a href="#VB">V.B.</a> : </small> <u><xsl:apply-templates select="tei:sic"/></u>]/
                    </xsl:when>
                    <xsl:when test="tei:sic[@cert='high']">
                        [<small>Errore di <a name="VB">V.B.</a> : </small> <xsl:apply-templates select="tei:sic"/>]/
                    </xsl:when>
                    <xsl:when test="tei:sic[@cert='medium/high']">
                    [<small>Probabile errore di <a name="VB">V.B.</a> : </small> <xsl:apply-templates select="tei:sic"/>]/
                    </xsl:when>
                </xsl:choose>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="tei:corr[@resp='#AD']">
                <xsl:choose>
                    <xsl:when test="tei:corr[@cert='high']">
                        [<small>Correzione (di <a name="AD">A.D.</a>) con affidabilità alta : </small> <xsl:apply-templates select="tei:corr"/> ]
                    </xsl:when>
                    <xsl:when test="tei:corr[@cert='medium']">
                        [<small>Correzione (di <a name="AD">A.D.</a>) con affidabilità media :</small> <xsl:apply-templates select="tei:corr"/> ]
                    </xsl:when>
                    <xsl:when test="tei:corr[@cert='medium/high']">
                        [<small>Correzione (di <a name="AD">A.D.</a>) con affidabilità medio/alta :</small> <xsl:apply-templates select="tei:corr"/> ]
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="tei:corr[@resp='#VB']">
                <xsl:choose>
                    <xsl:when test="./@rend='above'">
                        [<small>Correzione (di <a name="VB">V.B.</a>):</small> <xsl:apply-templates select="tei:corr"/>]
                    </xsl:when>
                    <xsl:otherwise>
                        [<small>Correzione (di <a name="VB">V.B.</a>):</small> <xsl:apply-templates select="tei:corr"/> ]
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:orig">
        [<xsl:apply-templates />]
    </xsl:template>

    <xsl:template match="tei:reg">
        [<xsl:apply-templates />]
    </xsl:template>

    <xsl:template match="tei:emph">
        <b><xsl:apply-templates/></b>
    </xsl:template>

    <xsl:template match="tei:distinct">
        <font FACE="Garamond, Times, serif">
            <xsl:apply-templates/>
        </font>
    </xsl:template>

    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend='italic'">
                <i><xsl:apply-templates/></i>
            </xsl:when>
            <xsl:when test="@rend='bold'">
                <b><xsl:apply-templates/></b>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>