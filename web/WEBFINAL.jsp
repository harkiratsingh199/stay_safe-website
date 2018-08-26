

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <style>
            html,body
            {
                height:100%;
            }

            #wrap
            {
                min-height: 100%; 
            }

            #main
            {
                overflow:auto;
                padding-bottom:150px; /* this needs to be bigger than footer height*/
            }

            .footer 
            {
                position: relative;
                margin-top: -50px; /* negative value of footer height */
                height: 50px;
                clear:both;
                padding-top:20px;
                color:#fff;
            } 
            h2 {
                width: 100%; 
                text-align: center; 
                border-bottom: 1px solid #000; 
                line-height: 0.1em;
                margin: 10px 0 20px; 
            } 

            h2 span { 
                background:#fff; 
                padding:0 10px; 
            }
            #top{
                background-color: #000000;
                color: #fff;

            }
        </style>
        <title>User home</title>
    </head>
    <body>



<!--        <div id="top">
            <div class="container">
                <div class="row">
                    <div class="pull-left">
                        <p >MySearchEngine</p>

                    </div>


                   

                </div>
            </div>
        </div>-->

        
            <div  id="main">

                <div class="container">
                    <div class="row section" style="text-align:center;border:1px solid white">
                      
                        <br>
                        
                            
                                <form action="./web2.jsp">
    <img src="search.jpg"  style="width:40%" >
     
    <br>
    <br>
    <input type="text" required placeholder="Search" name="" id="search" >
<!--            <button type="submit" class="btn btn-primary w3-hover-white"><i class="fa fa-search"></i></button>-->
            
            <!--<input class="btn btn-primary w3-hover-white" type="submit" value="My Search<i class='fa fa-search'></i>">-->
   <button  class="btn btn-primary w3-hover-white" type="submit"><i class="fa fa-search"></i> MySearch</button>
 
        
                     
  </form>
                        

                      
                    </div>
                </div>
</div>
                
           
       
        
        <div class="container-fluid footer" style=" color: #000000;">
            <div class="container">

                <div class="row">
                    <div class="col-sm-12 text-center" style="font-family: 'Open Sans'; font-size: 12px;"> &copy;2018
                        MySearchEngine. All Rights Reserved
                    </div>
                </div>
            </div>

        </div>
                 




    </body>
</html>
