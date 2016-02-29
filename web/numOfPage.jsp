            

<div class="table"><div class="trang">
        Page :
        <%
            for (int i = 0; i <= numOfPage; i++) {
        %>
        <span class="trang"><a href="index.jsp?page=<%= i%>"><%= i + 1%></a></span>
            <% }

            %>
    </div></div>