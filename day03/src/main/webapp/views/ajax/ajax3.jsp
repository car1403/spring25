<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Center Page--%>
<style>
    .rank{
        width:20px;
    }
</style>
<script>
    const ajax3 = {
        init:function(){
            this.getData();
            setInterval(()=>{
                this.getData();
            },10000);
        },
        getData:function(){
            $.ajax({
                url:'<c:url value="/rank"/> ',
                success:(result)=>{
                    this.display(result);
                },
                error:()=>{}
            });
        },
        display:function(data){
            // let arr = [3, 1, 4, 2];
            // arr.sort((a, b) => a - b); //오름차순 정렬
            // arr.sort((a, b) => b - a); //내림차순 정렬

            // 음수: a가 b보다 작으면 (a - b < 0), a가 b보다 앞에 위치합니다.
            // 0: a와 b가 같으면 (a - b === 0), 순서를 바꾸지 않습니다.
            // 양수: a가 b보다 크면 (a - b > 0), a가 b보다 뒤에 위치합니다.

            data.sort((a, b) => a.rank - b.rank);
            let result = '';
            $(data).each((index,item)=>{
                result += '<tr>';
                result += '<td>'+item.rank+'</td>';
                result += '<td>'+item.title+'</td>';
                item.updown ?
                    result += '<td><img class="rank" src="/img/up.jpg"></td>'
                    : result += '<td><img class="rank" src="/img/down.jpg"></td>';
                result += '</tr>';
            });
            $('#rank > tbody').html(result);
        }
    }
    $(function(){
        ajax3.init();
    });
</script>

<div class="col-sm-10">
    <h2>AJAX3 Page</h2>
    <h5>Title description, Sep 2, 2025</h5>
    <table id="rank" class="table">
        <thead class="thead-light">
        <tr>
            <th>Rank</th>
            <th>Title</th>
            <th>UpDown</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>