<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ActorSearch.aspx.cs" Inherits="ActorSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
      <br />
    <br />

                <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto"  >
                      <asp:Label ID="L1" runat="server"  Font-Bold="true" Font-Underline="true" ForeColor="White" Font-Size="X-Large"></asp:Label>
             <asp:Image ID="Image1" runat="server" Height="300px" Width="300px" />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:HyperLink ID="hpr1" runat="server" >
                        </asp:HyperLink>
                    &nbsp;
                     <asp:HyperLink ID="HyperLink1" runat="server" >
                        </asp:HyperLink>
                    &nbsp;
                     <asp:HyperLink ID="HyperLink2" runat="server" >
                        </asp:HyperLink>
                    
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" />
                    
                  </asp:Panel>
                         
      
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
        <br />  <br />  <br />

         <asp:ScriptManager ID="ScriptManager1" runat="server">
          
        </asp:ScriptManager>

        <div></div><br />
       
            <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" BackColor="LightGray" ForeColor="Black"  >
        <asp:UpdatePanel ID="UpdatePanelDesc" runat="server" ForeColor="Black" >
            <ContentTemplate>
               <asp:Label ID="LabelDesc" runat="server" ></asp:Label>
                </ContentTemplate>
        </asp:UpdatePanel>
                </asp:Panel>
        <br/><br/><br/>
            <asp:Label ID="Label2" runat="server" BackColor="#ffff99" Font-Bold="true" Font-Underline="true" ForeColor="#660066" Text="MovieCredits" Font-Size="Larger"></asp:Label>
            <asp:Panel ID="Panel5" runat="server" ScrollBars="Auto" >
          <asp:UpdatePanel ID="UpdatePanelCast" runat="server" >
            <ContentTemplate>
                 <asp:DataList ID="DataList2" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" GridLines="None" Enabled="true">
                                    <ItemTemplate>
                                        
                                <table>
                                    <tr>
                                        <td>
                                              <asp:Image ID="CreditMovie" runat="server"  ImageUrl='<%#Eval("posterUrl")%>' Width="200" Height="200" > </asp:Image> 
                                             
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LabelCharName"  Text='<%#Eval("movieName") %>'  runat="server" > </asp:Label> <br />
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                          <asp:Label  ID="LActorName"  Text=' <%#Eval("character") %>'  runat ="server" > </asp:Label> <br/>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                          <asp:Label ID="LabelreleseDate"  Text=' <%#Eval("releaseDate") %>'   runat="server"> </asp:Label> <br/>
                                        </td>
                                    </tr>
                                </table>  
                                        
                          </ItemTemplate>
                                </asp:DataList>
            </ContentTemplate>
        </asp:UpdatePanel>
        </asp:Panel>  <br />  <br />  <br />
         <asp:Panel ID="Panel3" runat="server" ScrollBars="Auto"  ForeColor="Black" >
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
            <ContentTemplate>
                 <asp:DataList ID="DataList3" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" GridLines="None" Enabled="true">
                                    <ItemTemplate>
                                        
                                <table>
                                    <tr>
                                        <td>
                                              <asp:Image ID="CreditMovie" runat="server"  ImageUrl='<%#Eval("posterUrl")%>' Width="200" Height="200" > </asp:Image> 
                                             
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LabelCharName"  Text='<%#Eval("tvName") %>'  runat="server" > </asp:Label> <br />
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                          <asp:Label  ID="LActorName"  Text=' <%#Eval("character") %>'  runat ="server" > </asp:Label> <br/>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                          <asp:Label ID="LabelreleseDate"  Text=' <%#Eval("releaseDate") %>'   runat="server"> </asp:Label> <br/>
                                        </td>
                                    </tr>
                                </table>  
                                        
                          </ItemTemplate>
                                </asp:DataList>
            </ContentTemplate>
        </asp:UpdatePanel>
        </asp:Panel>  <br />  <br />  <br />
        <asp:Label ID="Label1" runat="server" BackColor="#ffff99" Font-Bold="true" Font-Underline="true" ForeColor="#660066" Text="Posters" Font-Size="Larger"></asp:Label>
         <asp:Panel ID="Panel4" runat="server" ScrollBars="Auto"   >
         <asp:UpdatePanel ID="UpdatePanel2" runat="server" >
            <ContentTemplate>
                 <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" GridLines="None" Enabled="true">
                                    <ItemTemplate>
                                        
                                
                                              <asp:Image ID="actorImage" runat="server"  ImageUrl='<%#Eval("posterUrl")%>' Width="200" Height="200" > </asp:Image> 
                                  
                                        
                          </ItemTemplate>
                                </asp:DataList>
            </ContentTemplate>
        </asp:UpdatePanel>
        </asp:Panel>  <br />  <br />  <br />

</asp:Content>

