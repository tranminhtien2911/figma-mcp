# Quy tắc Workspace: Đánh giá UI/UX & Đối chiếu Nghiệp vụ (Figma + NotebookLM)

## Quy trình Tự động khi nhận yêu cầu "Đánh giá"
Bất cứ khi nào người dùng gửi một liên kết Figma kèm từ khóa *"đánh giá"*, *"review"*, hoặc yêu cầu nhận xét, hệ thống **BẮT BUỘC TỰ ĐỘNG CHẠY SONG SONG VÀ KẾT HỢP CẢ 2 MÁY CHỦ**:

### 1. Phân hệ Figma MCP (Dữ liệu Giao diện Thực tế)
- Tự động lấy ảnh chụp render độ phân giải cao (`get_screenshot`) và cấu trúc component (`get_metadata`).
- Đánh giá trực quan:
  - Bố cục & Phân cấp thị giác (Visual Hierarchy, Information Density).
  - Khả năng tiếp cận (Accessibility - WCAG 2.1/2.2 AA): Tương phản màu sắc, kích thước vùng chạm, màu ngữ nghĩa.
  - Cấu trúc Design System, Auto-layout và các trạng thái giao diện (States, Hover, Selection, Drawer, Edge cases).

### 2. Phân hệ NotebookLM MCP (Dữ liệu Quy chuẩn & Đặc tả Nghiệp vụ)
- Tự động tra cứu trong các Notebook liên quan của dự án (PRD, tài liệu yêu cầu, quy chuẩn Design System, tiêu chuẩn kiểm thử QA/UAT).
- Đối chiếu nghiệp vụ:
  - Màn hình Figma đã đáp ứng đầy đủ các trường dữ liệu và tính năng theo tài liệu đặc tả chưa?
  - Luồng tương tác, phân quyền (Admin vs User) và trạng thái hiển thị có khớp với tài liệu trong NotebookLM không?

### 3. Báo cáo Đánh giá Kết hợp (Unified Evaluation Report)
Báo cáo trả về cho người dùng phải luôn tích hợp 2 chiều:
1. **Đánh giá Thiết kế UI/UX & A11y (Visual & Usability Audit)**.
2. **Đối chiếu Khớp nghiệp vụ với Tài liệu (PRD / Business Logic Parity)**.
3. **Danh sách Đề xuất & Hành động cải tiến (Actionable Recommendations)**.

> *Lưu ý về phiên làm việc*: Nếu phiên đăng nhập của NotebookLM hết hạn, nhắc người dùng chạy lệnh `nlm login` trên terminal một lần để tự động làm mới token.
