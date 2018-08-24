<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUpForm.aspx.cs" Inherits="SignUpForm" %>

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
    
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: x-large" Text="SignUp Form"></asp:Label>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
    </div>
        <p>
            <asp:Label ID="Label2" runat="server" CssClass="auto-style1" Text="Username :"></asp:Label>
&nbsp;&nbsp;&nbsp;
            </p>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="auto-style2" AutoPostBack="True" OnTextChanged="txtUsername_TextChanged"></asp:TextBox>
            </ContentTemplate>
        </asp:UpdatePanel>
        <p>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please Enter Proper Username" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        </p>
        <asp:Label ID="Label3" runat="server" CssClass="auto-style1" Text="Password :"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="txtPassword" runat="server" CssClass="auto-style2" TextMode="Password"></asp:TextBox>
&nbsp;<p>
            <asp:Label ID="Label4" runat="server" CssClass="auto-style1" Text="Re-enter Password :"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtConfirm" runat="server" CssClass="auto-style2" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirm" ErrorMessage="Password must be same" ForeColor="Red"></asp:CompareValidator>
        </p>
        <asp:Label ID="Label5" runat="server" CssClass="auto-style1" Text="E-mail :"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style2" Width="192px"></asp:TextBox>
&nbsp;<p>
            <asp:Button ID="btnSignUp" runat="server" CssClass="auto-style1" OnClick="btnSignUp_Click" Text="SignUp" />
        </p>
    </form>
</body>
</html>
