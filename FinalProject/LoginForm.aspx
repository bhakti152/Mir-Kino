<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginForm.aspx.cs" Inherits="LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-weight: bold;
            font-size: large;
        }
        .auto-style2 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
    
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: x-large" Text="Login Authentication"></asp:Label>
    
    </div>
        <p>
            &nbsp;<asp:Label ID="Label2" runat="server" CssClass="auto-style1" Text="Username :"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtUsername" runat="server" CssClass="auto-style2"></asp:TextBox>
        </p>
        <asp:Label ID="Label3" runat="server" CssClass="auto-style1" Text="Password :"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtPassword" runat="server" CssClass="auto-style2" TextMode="Password"></asp:TextBox>
        <p>
            <asp:Button ID="btnLogin" runat="server" Height="32px" style="font-weight: 700; font-size: large" Text="Login" Width="100px" OnClick="btnLogin_Click" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnSignUp" runat="server" Height="32px" style="font-weight: 700; font-size: large" Text="SignUp" Width="100px" OnClick="btnSignUp_Click" />
        </p>
    </form>
</body>
</html>
