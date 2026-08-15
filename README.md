

# Appearance-Based Face Recognition Robust to Low Contrast and Non-Uniform Illumination

### Illumination-Robust Face Recognition Using Image Processing and Appearance-Based Methods

[![MATLAB](https://img.shields.io/badge/MATLAB-Image%20Processing-orange?logo=mathworks&logoColor=white)](https://www.mathworks.com/products/matlab.html)
[![Computer Vision](https://img.shields.io/badge/Domain-Computer%20Vision-blue)]()
[![Face Recognition](https://img.shields.io/badge/Task-Face%20Recognition-green)]()
[![Image Processing](https://img.shields.io/badge/Focus-Image%20Processing-purple)]()

> An appearance-based face recognition framework designed to improve recognition robustness under low-contrast and non-uniform illumination conditions.

---

## Overview

Face recognition performance can degrade significantly when facial images are captured under challenging illumination conditions.

Low contrast and non-uniform illumination can alter the appearance of facial regions and introduce variations that are unrelated to the identity of the subject.

This project investigates an appearance-based face recognition approach designed to improve recognition robustness under such challenging imaging conditions.

The implementation is developed in **MATLAB** and focuses on image preprocessing, feature representation, dimensionality reduction, and face recognition.

---

## Problem

Illumination variation is one of the major challenges in appearance-based face recognition.

Two images belonging to the same person may exhibit significantly different pixel-level appearances when captured under different lighting conditions.

This creates a difficult recognition problem because illumination-induced variations can become larger than the actual differences between individuals.

The objective of this project is therefore to improve recognition performance when facial images suffer from:

- Low contrast
- Non-uniform illumination
- Significant intensity variations
- Challenging lighting conditions

---

## Methodology

The proposed framework follows an appearance-based recognition pipeline:


![Model Architecture](https://github.com/user-attachments/assets/d1c341ab-6146-4f40-ae53-6913611d4364)
       ▼
Identity Prediction
