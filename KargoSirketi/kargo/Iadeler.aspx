<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Iadeler.aspx.cs" Inherits="kargo.Iadeler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <title>İadeler</title>
    <style>
        body {
            background-color: #f6f6f6;
            font-family: Arial, sans-serif;
            color: #333;
        }
        .container {
            margin-top: 50px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header nav a {
            color: #1a73e8;
            text-decoration: none;
            margin: 0 10px;
        }
        .header nav a:hover {
            text-decoration: underline;
        }
        .status {
            background-color: #eef6ef;
            color: #34a853;
            padding: 15px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .status.processing {
            background-color: #d4edda;
            color: #155724;
        }
        .section {
            margin-bottom: 20px;
        }
        .section p {
            margin: 5px 0;
            color: #555;
        }
    </style>
</head>
<body>
    
        <div class="container">
            <div class="header">
                <nav>
                    <a href="iade.aspx">Farklı İade Ara</a> | 
                    <a href="iletisim.aspx">İletişim</a> | 
                    <a href="#">Sıkça Sorulan Sorular</a>
                </nav>
            </div>
            <div id="divIadeDurumu" class="status">
                <strong>İade Durumu:</strong> <asp:Label ID="lblDurum" runat="server"></asp:Label>
            </div>
            <div class="section">
                <p><strong>İade Kodu:</strong> <asp:Label ID="lblIadeKodu" runat="server"></asp:Label></p>
                <p><strong>İade Tarihi:</strong> <asp:Label ID="lblIadeTarihi" runat="server"></asp:Label></p>
                <p><strong>İade Firma:</strong> <asp:Label ID="lblIadeFirma" runat="server"></asp:Label></p>
                <p><strong>İade Kişi:</strong> <asp:Label ID="lblIadeKisi" runat="server"></asp:Label></p>
                <p><strong>Mağaza Lokasyon:</strong> <asp:Label ID="lblMagazaLokasyon" runat="server"></asp:Label></p>
                <p><strong>Müşteri Lokasyon:</strong> <asp:Label ID="lblMusteriLokasyon" runat="server"></asp:Label></p>
            </div>
        </div>
    </form>
</body>
</html>
</asp:Content>
