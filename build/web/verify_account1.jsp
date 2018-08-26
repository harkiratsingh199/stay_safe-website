<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <title>Verify Account</title>
    </head>
    <body>
        <form role="form" action="verify_account2.jsp" method="post">
        <div class="form-group">
            
                    <input type="text" name="email" placeholder="enter email" required/>
                
        </div>
        <div class="form-group">
                
                    <input type="text" name="code" placeholder="enter verification code" required/>
                
        </div>
        <div class="form-group">
                
                    <input class="btn btn-primary w3-btn w3-orange" type="submit" value="Submit"/>
                
        </div>

        
    </form>


    </body>
</html>
