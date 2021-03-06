<%@ page session="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
	<a class="navbar-brand" href="#">Power House Games</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarCollapse" aria-controls="navbarCollapse"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarCollapse">
		<ul class="navbar-nav mr-auto">
			<% if(session != null && session.getAttribute("email") != null) { %>
			<% } else { %>
			<% } %>
		</ul>
		<ul class="navbar-nav">
			<% if(session != null && session.getAttribute("email") != null) { %>
				<li class="nav-item"><span class="nav-link">Greetings, <c:out value="${sessionScope.email}"/></span></li>
				<li class="nav-item"><a id="nav-logout" class="nav-link">Logout</a></li>
			<% } else { %>
				<li class="nav-item"><a class="nav-link" href="/app/admin/login">Login</a></li>
				<!-- <li class="nav-item"><a class="nav-link" href="/app/register">Register Now!</a></li> -->
			<% } %>
		</ul>
	</div>
</nav>

<script type="text/javascript" >
$(document).ready(function() {
    $("#nav-logout").click(function(e) {
    		e.preventDefault();
    		$.ajax({
    			url:"/app/logout",
    			type: "POST",
    			contentType: false,
    			cache: false,
    			processData: false,
    			success: function(){
    				 window.location="/app/login.jsp";
    			},
    			error: function(){}
 			});
    });
});
</script>