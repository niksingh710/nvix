# Dashboard Module

This module enhances the Neovim startup experience with a customizable dashboard that includes the current day prominently displayed at the top.

---

## 🛠️ Usage

To include the dashboard in your setup, use the following configuration:

```nix
# In your Nix configuration
modules.imports = [
  inputs.nvix.nvixModules.utils
  inputs.nvix.nvixModules.dashboard
];
```

> **Note:** The `utils` module is required to ensure functionality.

---

## 🔑 Features

- Displays the **current day** at the top of the dashboard.
- Provides quick access to frequently used commands and files.
- Fully customizable layout and content.

---

## 📋 Key Features of the Dashboard

- **Dynamic Header:** Shows the current day for a personalized touch.
- **Quick Links:** Customize the dashboard to include shortcuts to frequently accessed commands or files.
- **Minimal Design:** Focused and distraction-free startup screen.

---

## 📷 Preview

![image](https://github.com/user-attachments/assets/3211a1e2-92f3-4dff-9b5c-8d4476f12a04)

---

## 🔗 Additional Notes

- The dashboard is preconfigured with a minimal yet functional design, but it is fully customizable to suit your preferences.
- Easily add motivational quotes, project links, or your recent files for a more productive start.

---
