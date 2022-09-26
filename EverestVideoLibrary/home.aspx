<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="EverestVideoLibrary.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
      <img src="imgs/bannerz.png" class="img-fluid"/>
   </section>
   <section>
      <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                  <h2>Our Features</h2>
                  <p><b>Our 3 Primary Features -</b></p>
               </center>
            </div>
         </div>
         <div class="row">
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/footage.png"/>
                  <h4>DVD Rental</h4>
                  <p class="text-justify">Everest Video Library system manages the renting and returning of DVDs. Records of transactions and members are securely stored in our database.</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/seo.png"/>
                  <h4>DVD Details</h4>
                  <p class="text-justify">User can look for DVD details of their favourite movies that are available in our library. Users can easily view them bypassing the login.</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="imgs/login.png"/>
                  <h4>Secured Login</h4>
                  <p class="text-justify">Our system has secure login for Manager and Assistant. Dedicated tasks and functions are separated for both respective users.</p>
               </center>
            </div>
         </div>
      </div>
   </section>
</asp:Content>
