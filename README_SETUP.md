# 🎨 Figma + NotebookLM Dual MCP Workspace

Dự án tích hợp song song 2 máy chủ MCP: **Figma MCP** và **NotebookLM MCP**, phục vụ quy trình đánh giá giao diện (UI/UX Review) và đối chiếu nghiệp vụ (Business Spec Parity) tự động.

---

## 🚀 Hướng Dẫn Thiết Lập Trên Máy Local Khác

### Bước 1: Clone Repository
```bash
git clone <URL_REPO_CUA_BAN>
cd <thu_muc_du_an>
```

### Bước 2: Cài Đặt Dependencies Cần Thiết
1. **Python & Thư viện hình ảnh:**
   ```bash
   pip install pillow
   ```
2. **NotebookLM CLI:**
   Đảm bảo đã có công cụ `nlm` / `notebooklm-mcp`.
   - Chạy lệnh đăng nhập tài khoản Google:
     ```bash
     nlm login
     ```

3. **Figma MCP Authentication:**
   - Xác thực tài khoản Figma:
     ```bash
     gemini /mcp auth figma
     ```

---

## ⚙️ Các File Cấu Hình Đã Thiết Lập Sẵn

* **`mcp_config.json`** & **`.mcp.json`**: Khai báo song song 2 server:
  * `figma`: Kết nối Remote Streamable HTTP endpoint `https://mcp.figma.com/mcp`
  * `notebooklm`: Kết nối Local stdio server
* **`AGENTS.md`**: Quy tắc tự động chạy song song kết hợp cả 2 máy chủ khi người dùng gõ từ khóa *"đánh giá"*.
* **`.gemini/settings.json`**: Cấu hình scope MCP cho Gemini CLI / Antigravity.

---

## 💡 Cách Sử Dụng
Mỗi khi gửi một liên kết Figma (kèm `node-id`) và gõ **"đánh giá"**, agent sẽ:
1. Tự động lấy screenshot render và metadata từ **Figma MCP**.
2. Tự động truy vấn các tài liệu đặc tả, checklist QA từ **NotebookLM MCP**.
3. Xuất báo cáo đánh giá hợp nhất cả 2 chiều (UI/UX trực quan + Độ khớp nghiệp vụ).
