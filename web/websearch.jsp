<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
<style>

img {
    display: block;
    margin-left: auto;
    margin-right: auto;
}
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
</head>
<body>
   <div id="top">
            <div class="container">
                <div class="row">
                    <div class="pull-left">
                        <p >My Search Engine</p>

                    </div>


                   

                </div>
            </div>
        </div>

   <br>
   <br>
   <div id="main">
    <div class="container">
        
    <form action="/action_page.php">
    <table>
  <tr>
    <th><img src="search.jpg"  style="width:40%"></th>
    
  </tr>
  <tr>
    <td>
        <input type="text" required placeholder="Search" name="" id="search" class="search-container">
            <button type="submit" class="btn btn-primary w3-hover-white"><i class="fa fa-search"></i></button></td>
    
  </tr>
  <tr>
    <td><input class="btn btn-primary w3-hover-white" type="submit" value="My Search"/></td>
   
  </tr>
</table>
        
                     
  </form>
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
