﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="WebShop.Admin.Company" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script>
         window.onload = function () {
             var seconds = 5;
             setTimeout(function () {
                 document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
         }
     </script>

    <script>
        function ImagePrewiew(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imagePreview.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .hight(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="mb-4">
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>

    <div class="row">
        <div class="col-sm-12 col-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Компания</h4>
                    <hr />

                    <div class="form-body">

                        <lable>Название компании</lable>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" plaseholder="Enter Category Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" ForeColor="Red" Font-Size="Small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtCompanyName"
                                        ErrorMassage="Введите название компании"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <lable>Фото компании</lable>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:FileUpLoad ID="fuCompanyImage" runat="server" CssClass="form-control"
                                      onchange ="ImagePrewiew(this);"  />
                                    <asp:HiddenField ID="hfCompanyId" runat="server" Value ="0" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                             <div class="col-md-12">
                                <div class="form-group">
                                    <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; IsActive" />                                    
                                </div>
                             </div>
                        </div>

                    </div>

                        <div class="form-actiona pb-5">
                            <div class="text-left">
                                <asp:Button ID="btnAddOrUpdate" runat="server" CssClass="btn btn-info" Text="Add" OnClick="btnAddOrUpdate_Click"/>
                                <asp:Button ID="btnClear" runat="server" CssClass="btn btn-dark" Text="Очистить" OnClick="btnClear_Click"/>
                            </div>
                        </div>

                    <div>
                        <asp:Image ID="imagePreview" runat="server" CssClass="img-thumbnail" AlternateText="" />
                    </div>

                </div>
            </div>
        </div>

         <div class="col-sm-12 col-md-8">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Список компании</h4>
                    <hr />
                    <div class="table-responsive">
                        <asp:Repeater ID="rCompany" runat="server" OnItemCommand="rCompany_ItemCommand">
                            <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                            <th class="table-plus">Название</th>
                                            <th>Изображение</th>
                                            <th>Активность</th>
                                            <th>Дата создания</th>
                                            <th class="datatable-nosort">Действия</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="table-plus"> <%# Eval("CompanyName") %> </td>
                                    <td> 
                                        <img width="40" src="<%# WebShop.Utils.getImageUrl( Eval("CompanyImageUrl")) %>" alt="image" />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblIsActive" runat="server"
                                            Text='<%# (bool)Eval("IsActive") == true ? "Active" : "In-Active" %>'
                                            CssClass='<%# (bool)Eval("IsActive") == true ? "badge badge-success" 
                                                : "badge badge-danger" %>'>
                                        </asp:Label>
                                    </td>
                                     <td><%# Eval("CreatedDate") %></td>
                                    <td>
                                        <asp:LinkButton ID="lbEdit" Text="Edit" runat="server" CssClass="badge badge-primary"
                                            CommandArgument='<%# Eval("CompanyId") %>' CommandName="edit" CausesValidation="false" >
                                            <i class="fas fa-edit"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lbDelete" Text="Delete" runat="server" CssClass="badge badge-danger"
                                             CommandArgument='<%# Eval("CompanyId") %>' CommandName="delete" CausesValidation="false" >
                                            <i class="fas fa-trash-alt"></i>
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                  </tbody>
                                  </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
