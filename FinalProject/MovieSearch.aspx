<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MovieSearch.aspx.cs" Inherits="MovieSearch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    	

    <div style="margin-left: 111px; color: #FFFFFF; margin-top: 3px;">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />

          
               
                              <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto"  >
             <asp:Image ID="Image1" runat="server" Height="300px" Width="300px" />
              <asp:Image ID="Image2" runat="server" Height="300px" Width="300px" />

    </asp:Panel>
                         
      
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
        <br />  <br />  <br />


        <asp:ScriptManager ID="ScriptManager1" runat="server">
          
        </asp:ScriptManager>

        <div></div><br />
        <asp:Label ID="L1" runat="server" BackColor="Cyan" Font-Bold="True" Font-Underline="True" ForeColor="Black" Text="                                                  Description" Font-Size="Larger"></asp:Label>
            <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" BackColor="White" ForeColor="Black"  >
        <asp:UpdatePanel ID="UpdatePanelDesc" runat="server" ForeColor="Black" >
            <ContentTemplate>
               <asp:Label ID="LabelDesc" runat="server" ></asp:Label>
                </ContentTemplate>
        </asp:UpdatePanel>
                </asp:Panel>
          <br />  <br />  <br /> <asp:Label ID="Label1" runat="server" BackColor="Cyan" Font-Bold="true" Font-Underline="true" ForeColor="Black" Text="Details" Font-Size="Larger" ></asp:Label>
         <asp:Panel ID="Panel3" runat="server" ScrollBars="Auto" BackColor="#ccff99" ForeColor="Black" >
        <asp:UpdatePanel ID="UpdatePanelDetails" runat="server" >
            <ContentTemplate>
                 <asp:Label ID="LabelDetails" runat="server" ></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
             </asp:Panel>    <br />  <br />  <br /> 
         <asp:Label ID="Label2" runat="server"  BackColor="Cyan" Font-Bold="true" Font-Underline="true"  Text="Cast" Font-Size="Larger" ForeColor="Black"></asp:Label>
            <asp:Panel ID="Panel5" runat="server" ScrollBars="Auto"  >
          <asp:UpdatePanel ID="UpdatePanelCast" runat="server" >
            <ContentTemplate>
               
                 
                                <asp:DataList ID="DataList2" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" GridLines="None" Enabled="true">
                                    <ItemTemplate>
                                        
                                <table>
                                    <tr>
                                        <td>
                                             <asp:Label ID="LActorName" runat="server" Text='<%#Eval("actorName") %>'  > </asp:Label> <br/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LabelCharName" runat="server" Text='<%#Eval("charName") %>'  > </asp:Label> <br />
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            <asp:Image ID="ImageCast" runat="server"  ImageUrl='<%#Eval("imgPath")%>' Width="200" Height="200" > </asp:Image> 
                                        </td>
                                    </tr>
                                </table>  
                                    
                                       
                                          
                                        
                          </ItemTemplate>
                                </asp:DataList>
            </ContentTemplate>
        </asp:UpdatePanel>
        </asp:Panel>  <br />  <br />  <br />
         <asp:Label ID="Label3" runat="server" BackColor="Cyan" Font-Bold="true" Font-Underline="true" ForeColor="Black" Text="Videos" Font-Size="Larger"></asp:Label>
         <asp:Panel ID="Panel4" runat="server" ScrollBars="Auto"  >
        <asp:UpdatePanel ID="UpdatePanelVideo" runat="server" >
            <ContentTemplate>
                <asp:DataList ID="DataList1" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" GridLines="None" Enabled="true">
                                    <ItemTemplate>
                                           <iframe width="320" height="240" src="https://www.youtube.com/embed/" + <%#Eval("keyId") %> > </iframe> <br/>
                                         <asp:Label ID="LabelName" runat="server" Text='<%#Eval("videoName") %>'> </asp:Label>
                                          
                                       
                                    </ItemTemplate>
                                </asp:DataList>
            </ContentTemplate>
        </asp:UpdatePanel>
             </asp:Panel>  <br />  <br />  <br />
        
     
     
                    
       
       
&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       
&nbsp;&nbsp;&nbsp;
        <br />
        
    <br />
    <br />
    <br />
</div>
    <br />
    <br />
    <br />
</asp:Content>

