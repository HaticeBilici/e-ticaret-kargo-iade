<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="iade.aspx.cs" Inherits="kargo.iade" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f9f9f9;
            color: #333;
        }
        .card {
            background-color: #fff;
            color: #333;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }
        .card-header {
            background-color: #3a3a3a;
            color: #fff;
            display: flex;
            align-items: center;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            padding: 15px 20px;
        }
        .card-header img {
            height: 30px;
            margin-right: 15px;
        }
        .card-body {
            padding: 30px 20px;
        }
        .form-group label {
            color: #333;
            font-weight: bold;
        }
        .form-control {
            border: 1px solid #ced4da;
        }
        .btn-primary {
            background-color: #f62f5e;
            border-color: #f62f5e;
        }
        .btn-primary:hover {
            background-color: #d7254e;
            border-color: #d7254e;
        }
        .text-success {
            color: #28a745 !important;
        }
        footer {
            background-color: #3a3a3a;
            color: #fff;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
        .navbar {
            background-color: #3a3a3a;
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: #fff;
        }
        .navbar-brand:hover, .navbar-nav .nav-link:hover {
            color: #ddd;
        }
    </style>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
               
                <li class="nav-item">
                    <a class="nav-link" href="Kargolar.aspx">Kargolar</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="Takip.aspx">Takip Et</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="iletisim.aspx">İletişim</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="Iadeler.aspx">Iadeler</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="iade.aspx">iade</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">İade Bilgileri</h2>
            </div>
            <div class="card-body">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-success"></asp:Label>

                <div class="form-group">
                    <label for="txtIadeKodu">İade Kodu</label>
                    <asp:TextBox ID="txtIadeKodu" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="btnGetir" runat="server" Text="Bilgileri Getir" CssClass="btn btn-primary" OnClick="btnGetir_Click" />

                <div id="iadeBilgileri" runat="server" style="display:none;">
                    <div class="form-group">
                        <label for="txtIadeTarihi">İade Tarihi</label>
                        <asp:TextBox ID="txtIadeTarihi" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label for="txtIadeFirma">İade Firma</label>
                        <asp:TextBox ID="txtIadeFirma" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label for="txtIadeKisi">İade Kişi</label>
                        <asp:TextBox ID="txtIadeKisi" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label for="txtMusteriLokasyon">Müşteri Lokasyon</label>
                        <asp:TextBox ID="txtMusteriLokasyon" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label for="txtMagazaLokasyon">Mağaza Lokasyon</label>
                        <asp:TextBox ID="txtMagazaLokasyon" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label for="ddlIadeDurumu">İade Durumu</label>
                        <asp:DropDownList ID="ddlIadeDurumu" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Beklemede" Value="Beklemede"></asp:ListItem>
                            <asp:ListItem Text="İşlemde" Value="İşlemde"></asp:ListItem>
                            <asp:ListItem Text="Tamamlandı" Value="Tamamlandı"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    
                    <asp:Button ID="btnGuncelle" runat="server" Text="Durumu Güncelle" CssClass="btn btn-primary" OnClick="btnGuncelle_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>