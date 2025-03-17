<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #wt{
        width: 400px;
        border: 2px solid red;
        font-size: 10px;
    }
</style>
<script>
    const link1 = {
        init:function(){
            $('#getbtn').click(()=>{
                let loc = $('#sel1').val();
                this.getData(loc);
            });
        },
        getData:function(loc){
            alert(loc);
            $.ajax({
                url:'<c:url value="/getcwh"/>',
                data:{loc:loc},
                success:(result)=>{
                    this.display(result);
                }
            });
        },
        display:function(result){
            let data = (result.response.body.items.item[0].wfSv).split('\n').join('<br>');

            $('#wt').html(data);
        }
    }
    $(function(){
        link1.init();
    });

</script>

<div class="col-sm-10">
    <h2>Link1 Page</h2>
    <div class="form-group">
        <label for="sel1">Select list:</label>
        <div class="row">
            <div class="col-sm-6">
                <select class="form-control" id="sel1" name="loc">
                    <option value="108" selected>전국</option>
                    <option value="109">서울</option>
                    <option value="159">부산</option>
                    <option value="184">제주</option>
                </select>
            </div>
            <div class="col-sm-6">
                <button id="getbtn" type="button" class="btn btn-warning">Get Data</button>
            </div>

        </div>
    </div>

    <h4 id="wt"></h4>
</div>
