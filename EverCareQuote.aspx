﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="EverCareQuote.aspx.cs" Inherits="SinglifeProject.EverCareQuote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .quote-container {
            max-width: 650px;
            margin: 40px auto;
            padding: 30px;
            border-radius: 10px;
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        h2, h3 {
            text-align: center;
            margin-bottom: 10px;
        }

        .plan-info {
            background-color: #fff3cd;
            border-left: 5px solid #ffc107;
            padding: 15px;
            margin-bottom: 25px;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], select {
            width: 100%;
            padding: 8px;
            font-size: 14px;
        }

        .btn-container {
            margin-top: 20px;
            text-align: center;
        }

        .btn {
            padding: 10px 20px;
            margin: 5px;
            font-size: 14px;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            color: white;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
            color: white;
        }

        .result-box {
            margin-top: 20px;
            background-color: #e8f0fe;
            padding: 15px;
            border-left: 5px solid #007bff;
        }

        .validation-message {
            color: red;
            font-weight: bold;
            margin-top: 10px;
            text-align: center;
        }

        .min-coverage-info {
            font-style: italic;
            font-size: 13px;
            color: #555;
            margin-bottom: 15px;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="quote-container">
        <h2>EverCare Plan</h2>
        <div class="plan-info">
            <strong>Premium Rate:</strong> 0.65% annually<br />
            This plan supports long-term wellness and chronic illness protection. Optionally includes critical illness top-ups for additional peace of mind.
        </div>

        <div class="min-coverage-info">
            * Minimum coverage amount is <strong>SGD 50,000</strong>.
        </div>

        <h3>Quote Calculator</h3>

        <div class="form-group">
            <label for="txtCoverage">Coverage Amount (SGD):</label>
            <asp:TextBox ID="txtCoverage" runat="server" Text="100000"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="ddlPreExisting">Do you have any pre-existing conditions?</label>
            <asp:DropDownList ID="ddlPreExisting" runat="server">
                <asp:ListItem Text="No" Value="No" />
                <asp:ListItem Text="Yes" Value="Yes" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="ddlCriticalIllness">Add Critical Illness Coverage?</label>
            <asp:DropDownList ID="ddlCriticalIllness" runat="server">
                <asp:ListItem Text="No" Value="No" />
                <asp:ListItem Text="Yes" Value="Yes" />
            </asp:DropDownList>
        </div>

        <asp:Label ID="lblValidationMessage" runat="server" CssClass="validation-message" Visible="false"></asp:Label>

        <div class="btn-container">
            <asp:Button ID="btnCalculate" runat="server" Text="Get Quote" CssClass="btn btn-primary" OnClick="btnCalculate_Click" />
        </div>

        <asp:Panel ID="pnlResult" runat="server" Visible="false" CssClass="result-box">
            <asp:Label ID="lblResult" runat="server" />
        </asp:Panel>

        <asp:Panel ID="pnlActions" runat="server" Visible="false" CssClass="btn-container">
            <asp:Button ID="btnBuyNow" runat="server" Text="Buy Now" CssClass="btn btn-primary" OnClick="btnBuyNow_Click" />
            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-secondary" OnClick="btnAddToCart_Click" />
        </asp:Panel>
    </div>
</asp:Content>

