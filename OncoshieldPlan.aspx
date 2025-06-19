﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="OncoshieldPlan.aspx.cs" Inherits="SinglifeProject.OncoshieldPlan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        /* Hero Section */
        .hero-container {
            position: relative;
            width: 100vw;
            max-height: 500px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0,0,0,0.25);
            border-radius: 0 0 30px 30px;
        }

        .hero-container img {
            width: 100%;
            height: 500px;
            object-fit: cover;
            filter: brightness(0.85);
            display: block;
            transform: scale(1.05);
            opacity: 0;
            transition: transform 1.5s ease, opacity 1.5s ease;
        }

        .hero-container img.loaded {
            transform: scale(1);
            opacity: 1;
        }

        .hero-container:hover img {
            transform: scale(1.03);
            filter: brightness(1);
            transition: transform 0.6s ease, filter 0.6s ease;
        }

        .hero-buttons {
            position: absolute;
            bottom: 150px;
            left: 20%;
            transform: translateX(-50%);
            display: flex;
            gap: 14px;
            flex-wrap: wrap;
            z-index: 10;
            justify-content: flex-start;
            padding: 0 10px;
            max-width: 90vw;
        }

        .hero-buttons a {
            background: linear-gradient(135deg, #d80027 0%, #a6001e 100%);
            color: white;
            padding: 10px 22px;
            font-weight: 700;
            font-size: 0.9rem;
            border-radius: 25px;
            box-shadow: 0 3px 10px rgba(216,0,39,0.5);
            text-transform: uppercase;
            letter-spacing: 0.8px;
            transition: background 0.4s ease, box-shadow 0.4s ease;
        }

        .hero-buttons a:hover {
            background: linear-gradient(135deg, #a6001e 0%, #d80027 100%);
            box-shadow: 0 5px 15px rgba(166,0,30,0.7);
            text-decoration: none;
        }

        /* Intro Section */
        .intro-section-wrapper {
            background-color: #fff4f6;
            max-width: 900px;
            margin: 40px auto 60px;
            padding: 30px 20px;
            display: flex;
            align-items: center;
            gap: 30px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .intro-image img {
            width: 280px;
            height: 360px;
            object-fit: cover;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(216,0,39,0.15);
            transition: transform 0.4s ease;
        }

        .intro-image img:hover {
            transform: scale(1.03);
            box-shadow: 0 6px 20px rgba(216,0,39,0.28);
        }

        .intro-text {
            max-width: 520px;
            text-align: left;
        }

        .intro-text h1 {
            font-size: 2.2rem;
            color: #d80027;
            font-weight: 800;
            margin-bottom: 14px;
            text-shadow: 1px 1px 2px rgba(216,0,39,0.3);
        }

        .intro-text p {
            font-size: 1rem;
            color: #444;
            line-height: 1.5;
        }

        /* Features Section */
        .features-wrapper {
            background-color: #fff4f6;
            padding: 40px 15px 60px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            max-width: 900px;
            margin: 0 auto 60px;
            border-radius: 20px;
            box-shadow: 0 6px 25px rgba(216,0,39,0.1);
        }

        .feature-card {
            border-radius: 14px;
            padding: 20px 16px;
            text-align: center;
            width: 220px;
            min-height: 210px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            color: #444;
            box-shadow: 0 6px 15px rgba(216,0,39,0.12);
            font-weight: 600;
            overflow-wrap: break-word;
        }

        .feature-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 28px rgba(216,0,39,0.25);
        }

        .feature-emoji {
            font-size: 36px;
            margin-bottom: 10px;
        }

        .feature-title {
            font-size: 1rem;
            font-weight: 700;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 0.03em;
        }

        .feature-desc {
            font-size: 0.85rem;
            line-height: 1.4;
        }

        .feature-card:nth-child(1) { background: #ffe1e6; color: #b32e3a; }
        .feature-card:nth-child(2) { background: #ffe9d6; color: #b36a2e; }
        .feature-card:nth-child(3) { background: #d6f0ff; color: #2e5ab3; }
        .feature-card:nth-child(4) { background: #d6ffe9; color: #2eb37e; }
        .feature-card:nth-child(5) { background: #fff6d6; color: #b3a72e; }

        h2.section-title {
            text-align: center;
            font-size: 2rem;
            color: #d80027;
            margin-bottom: 40px;
            font-weight: 800;
        }

        /* Scroll Down Arrow */
        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-15px);
            }
            60% {
                transform: translateY(-8px);
            }
        }

        .scroll-arrow {
            width: 70px; /* slightly bigger */
            height: auto;
            animation: bounce 2s infinite;
            cursor: pointer;
        }

        /* Smaller How to Use image */
        .how-to-use-img {
            max-width: 60%;
            height: auto;
            max-height: 400px;
            margin: 0 auto;
            display: block;
        }

        /* Responsive tweaks */
        @media (max-width: 767.98px) {
            .hero-buttons {
                bottom: 40px;
                left: 50%;
                transform: translateX(-50%);
                flex-direction: column;
                align-items: center;
                max-width: 100vw;
                padding: 0 15px;
            }
            .intro-section-wrapper {
                flex-direction: column;
                padding: 25px 12px;
            }
            .intro-image img {
                width: 100%;
                height: auto;
                max-width: 280px;
                max-height: 360px;
            }
            .intro-text {
                text-align: center;
                max-width: 100%;
                margin-top: 25px;
            }
            .feature-card {
                width: 100%;
                max-width: 100%;
            }
            .how-to-use-img {
                max-width: 80%;
                max-height: 250px;
            }
        }
    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const heroImage = document.querySelector('.hero-container img');
            setTimeout(() => {
                heroImage.classList.add('loaded');
            }, 100);

            const arrow = document.getElementById('scrollDownArrow');
            arrow.addEventListener('click', function (event) {
                event.preventDefault();
                document.querySelector('#nextSection').scrollIntoView({ behavior: 'smooth' });
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Hero Banner -->
    <div class="hero-container shadow-sm rounded-bottom">
        <img src="Image/OncoSheild.PNG" alt="Medical Insurance Banner" />
        <div class="hero-buttons">
            <a href="OncoShieldQuote.aspx" class="btn btn-danger btn-lg shadow">Get a Quote</a>
            <a href="Documents/OncoShield_Brochure.pdf" target="_blank" class="btn btn-outline-danger btn-lg shadow">View Brochure</a>
        </div>
    </div>

    <!-- Intro Section -->
    <section class="intro-section-wrapper">
        <div class="intro-image">
            <img src="Image/Screenshot%202025-06-18%20021919.png" alt="OncoShield Plan Illustration" />
        </div>
        <div class="intro-text">
            <h1>What is OncoShield Plan?</h1>
            <p>
                OncoShield is a powerful cancer protection plan that goes far beyond basics — giving you access to advanced therapies,
                global second opinions, and ongoing survivorship support.
            </p>
        </div>
    </section>

    <!-- Features Section -->
    <h2 class="section-title">Key Features and Benefits</h2>
    <section class="features-wrapper">
        <div class="feature-card">
            <div class="feature-emoji">💊</div>
            <div class="feature-title">Supercharged Limits</div>
            <div class="feature-desc">Up to 20× MediShield Life limits for outpatient chemo and targeted therapy.</div>
        </div>
        <div class="feature-card">
            <div class="feature-emoji">🧬</div>
            <div class="feature-title">Cutting-Edge Therapies</div>
            <div class="feature-desc">Full coverage for proton beam, gene, and cell therapy (worth up to S$100K).</div>
        </div>
        <div class="feature-card">
            <div class="feature-emoji">🩺</div>
            <div class="feature-title">Annual Screening</div>
            <div class="feature-desc">Get 1 free cancer screening each year like a mammogram or Pap smear.</div>
        </div>
        <div class="feature-card">
            <div class="feature-emoji">🌍</div>
            <div class="feature-title">Global Concierge</div>
            <div class="feature-desc">Second opinions arranged with leading doctors in Japan, US, or Europe.</div>
        </div>
        <div class="feature-card">
            <div class="feature-emoji">🌱</div>
            <div class="feature-title">Wellness Support</div>
            <div class="feature-desc">Includes coaching and diet support for 12 months post-treatment.</div>
        </div>
    </section>

    <!-- Scroll down arrow -->
    <div class="text-center my-4">
        <a href="#nextSection" id="scrollDownArrow">
            <img src="Image/pngtree-down-arrow-red-png-image_4376823-removebg-preview.png" alt="Scroll Down" class="scroll-arrow" />
        </a>
    </div>

    <!-- How to Use Section -->
    <section id="nextSection" class="text-center">
        <h2 class="section-title mb-3">How to Use the OncoShield Plan</h2>
        <img src="Image/HowOnco.jpg" alt="How to Use OncoShield Plan" class="how-to-use-img rounded shadow-sm" />
    </section>
</asp:Content>

