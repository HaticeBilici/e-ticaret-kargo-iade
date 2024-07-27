<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Kargo.aspx.cs" Inherits="kargo.Kargo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Özel CSS -->
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
                    <a class="nav-link" href="Iadeler.aspx">Iadeler</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="iade.aspx">iade</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="Takip.aspx">Takip Et</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="iletisim.aspx">İletişim</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="card">
            <div class="card-body">
                <asp:Label ID="lblMessage" runat="server" CssClass="text-success"></asp:Label>

                <div class="form-group">
                    <label for="ddlSiparisNumaralari">Sipariş Numarası</label>
                    <asp:DropDownList ID="ddlSiparisNumaralari" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>

                <asp:Button ID="btnGetir" runat="server" Text="Getir" CssClass="btn btn-primary" OnClick="btnGetir_Click" />

                <div class="form-group">
                    <label for="txtTakipNumarasi">Takip Numarası</label>
                    <asp:TextBox ID="txtTakipNumarasi" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtGonderen">Gönderen</label>
                    <asp:TextBox ID="txtGonderen" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtAlici">Alıcı</label>
                    <asp:TextBox ID="txtAlici" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtLokasyon">Lokasyon</label>
                    <asp:TextBox ID="txtLokasyon" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtDurum">Durum</label>
                    <asp:TextBox ID="txtDurum" runat="server" CssClass="form-control"></asp:TextBox>
                </div>


                <div class="form-group">
                    <label for="txtTarih">Tarih</label>
                    <asp:TextBox ID="txtTarih" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtTeslimAlan">Teslim Alan</label>
                    <asp:TextBox ID="txtTeslimAlan" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <asp:Button ID="btnEkle" runat="server" Text="Ekle" CssClass="btn btn-primary" OnClick="btnEkle_Click" />
            </div>
        </div>
    </div>

    <!-- Bootstrap JS ve bağımlılıkları -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</asp:Content>
