const container = document.querySelector('#container');
const signInButton = document.querySelector('#signIn');
const signUpButton = document.querySelector('#signUp');
signUpButton.addEventListener('click', () => container.classList.add
('right-panel-active'));
signInButton.addEventListener('click', () => container.classList.remove
('right-panel-active'));

$("#login").click(function (){
    alert("1")
    var data={"language":"Java" , "edition":"second"}
    $.ajax({
        type: "post",
        url: "http://localhost:8080/user/login",
        contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        data: data,
        success: function (res) {

            //alert(res);
            //layer.close(ii);
        }
    });
});


