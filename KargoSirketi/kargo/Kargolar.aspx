<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Kargolar.aspx.cs" Inherits="kargo.Kargolar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
            background-color: #f6f6f6;
            font-family: Arial, sans-serif;
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

        .section {
            margin-bottom: 20px;
        }

            .section h3 {
                margin-bottom: 10px;
                color: #333;
                font-size: 18px;
            }

            .section p {
                margin: 5px 0;
                color: #555;
            }

        .actions {
            text-align: right;
        }

            .actions a {
                color: #1a73e8;
                text-decoration: none;
            }

                .actions a:hover {
                    text-decoration: underline;
                }
    </style>

    <div class="container">
        <div class="header">
            <nav>
                <a href="Takip.aspx">Farklı Gönderi Ara</a> | 
               
                <a href="iletisim.aspx">İletişim</a> | 
               
                <a href="#">Sıkça Sorulan Sorular</a>
            </nav>
        </div>
        <div id="divStatus" class="status">
            <strong>Gönderi Durumu:</strong>
            <asp:Label ID="lblDurum" runat="server"></asp:Label>
        </div>
        <div class="section">
            <h3>Gönderi Detayı</h3>
            <p><strong>Teslim Alan:</strong>
                <asp:Label ID="lblTeslimAlan" runat="server"></asp:Label></p>
            <p><strong>Takip Numarası:</strong>
                <asp:Label ID="lblTakipNo" runat="server"></asp:Label></p>
            <p><strong>Gönderi No:</strong>
                <asp:Label ID="lblGonderiNo" runat="server"></asp:Label></p>
        </div>
        <div class="section">
            <h3>Gönderi Hareketleri</h3>
            <p>
                <br>
                <asp:Label ID="lblTarih" runat="server"></asp:Label></p>
        </div>

    </div>

</asp:Content>
