<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>

<script>
    const js5 = {
        init:function(){
            let aclick = document.querySelector('#aclick');
            aclick.onclick = function(){
                let email = document.querySelector('#email_data').innerText;

                let id = email.substring(0,5);
                document.querySelector('#txt_id').innerHTML = id;

                let domain = email.substring(email.indexOf('@')+1, email.indexOf('.') )
                document.querySelector('#txt_domain').innerHTML = domain;

            }
        }
    }
    window.onload = function(){
        js5.init();
    }
</script>

<div class="col-sm-10">
    <h2>JS5 Page</h2>
    <button type="button" class="btn btn-primary" id="aclick">Button</button>
    <h4 id="email_data">jmlee@tonesol.com</h4>
    <h5 id="txt_id"></h5>  <!-- jmlee -->
    <h5 id="txt_domain"></h5> <!-- tonesol -->

</div>