<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<tiles:insert definition="page.template">
	<tiles:put name="pageTitle" value="Usuarios"/>
	<tiles:put name="body" value="/pages/administracion/usuarioBody.jsp" type="page"/>
</tiles:insert>