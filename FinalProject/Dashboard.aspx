<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanelCast" runat="server" >
            <ContentTemplate>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;  <asp:Label ID="Label1" runat="server" Text="Favourites" ></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Logout" />
                 <br /><br /><br />
                                <asp:DataList ID="DataList2" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" GridLines="None" Enabled="true" OnSelectedIndexChanged="DataList2_SelectedIndexChanged">
                                    <ItemTemplate>
                                        
                                <table>
                                   
                                     <tr>
                                        <td>
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#Eval("moviePoster") %>' />
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                             <asp:Label ID="mName" runat="server" Text='<%#Eval("movieName") %>'  > </asp:Label> <br/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="mID" runat="server" Text='<%#Eval("movieId") %>' ForeColor="Transparent"  > </asp:Label> <br />
                                        </td>
                                    </tr>
                                </table>  
                                    
                                       
                                          
                                        
                          </ItemTemplate>
                                </asp:DataList>
                <br/><br/> 
                 <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" GridLines="None" Enabled="true" OnSelectedIndexChanged="DataList2_SelectedIndexChanged">
                                    <ItemTemplate>
                                        
                                <table>
                                   
                                     <tr>
                                        <td>
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#Eval("actorPoster") %>' />
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                             <asp:Label ID="mName" runat="server" Text='<%#Eval("actorName") %>'  > </asp:Label> <br/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="mID" runat="server" Text='<%#Eval("actorId") %>' ForeColor="Transparent"  > </asp:Label> <br />
                                        </td>
                                    </tr>
                                </table>  
                                    
                                       
                                          
                                        
                          </ItemTemplate>
                                </asp:DataList>
            </ContentTemplate>
        </asp:UpdatePanel>
          <br />  <br />  <br />
</asp:Content>

