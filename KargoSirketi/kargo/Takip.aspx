  <%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Takip.aspx.cs" Inherits="kargo.Takip" %>
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
        .card-header h2 {
            margin: 0;
            font-size: 1.75rem;
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
        .container {
            margin-top: 50px;
        }
        .card-title {
            margin-bottom: 1rem;
            font-size: 1.5rem;
            color: #FFFFFF;
        }
        .btn {
            margin-top: 15px;
        }
        .grid-view {
            margin-top: 30px;
        }
    </style>
    <style>
    /* GridView stilleri */
    .custom-gridview {
        border-collapse: collapse;
        width: 100%;
    }

    .custom-gridview th, .custom-gridview td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    .custom-gridview th {
        background-color: #f2f2f2;
        color: #333;
    }

    .custom-gridview tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .custom-gridview tr:hover {
        background-color: #ddd;
    }
</style>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Kargo Takip</h2>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Takip Numarası:" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="ddlTakipNumaralari" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <asp:Button ID="btnSorgula" runat="server" Text="Sorgula" CssClass="btn btn-primary" OnClick="btnSorgula_Click" />
                <asp:GridView ID="gvKargo" runat="server" CssClass="table table-striped grid-view"></asp:GridView>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS ve bağımlılıkları -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</asp:Content>