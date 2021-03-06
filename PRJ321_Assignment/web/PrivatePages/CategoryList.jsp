<%@page import="Config.PathConfig"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    application.setAttribute("path", PathConfig.ROOT);
%>
<!DOCTYPE html>
<html>
    <%@ include file="/Components/Header.jsp" %>
    <body>
        <%@ include file="Partials/Header.jsp" %>

        <div class="columns">
            <%@ include file="Partials/Sidebar.jsp" %>
            <div class="column">

                <section class="section">
                    <div class="container">
                        <h3 class="title is-3">Category Manager</h3>
                        <div class="tile is-ancestor">

                            <div class="tile is-parent">
                                <div class="tile is-child box">
                                    <!-- content start here -->

                                    <div class="box">
                                        <!-- start of navigator -->
                                        <nav class="level">
                                            <!-- Left side -->
                                            <div class="level-left">
                                                <div class="level-item">
                                                    <a class="button is-primary" href="${path}category/create">Create</a>
                                                </div>
                                            </div>

                                            <!-- Right side -->
                                            <div class="level-right">
                                            </div>
                                        </nav>
                                        <!-- end of navigator -->   
                                    </div>

                                    <table class="table is-bordered">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <c:forEach var="category" items="${requestScope.categories}">
                                            <tr>
                                                <td>${category.getId()}</td>
                                                <td>${category.getName()}</td>
                                                <td>
                                                    <a class="button" feature="update" target="${category.getId()}">
                                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                                    </a>
                                                    <a class="button" feature="delete" target="${category.getId()}">
                                                        <i class="fa fa-trash-o" aria-hidden="true"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                    <%@ include file="/Components/Pagination.jsp" %>
                                    <!-- content end here -->
                                </div>
                            </div>
                        </div>

                    </div>
                </section>

            </div>
        </div>
        <%@ include file="Partials/Footer.jsp" %>
        <%@ include file="/Components/ActionScript.jsp" %>
    </body>
</html>
