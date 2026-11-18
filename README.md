# sciencefolio — bản cá nhân

Portfolio của Tôn Hoàng Nhớ, dựng từ template [Sciencefolio](https://github.com/tuannguyen8390/sciencefolio) (MIT).
Bốn trang HTML thuần cộng `404.html`, không build, không cài gì. Mở `index.html` là chạy.

**Pages:** Home · About · Stack · Projects
**Accent:** cobalt (`--accent-light` / `--accent-dark` trong `css/tokens.css`)
**Type pack:** grotesk (Archivo + IBM Plex Mono) — đổi trong `js/theme.js`

## Còn thiếu — chỉ bạn điền được

| Việc | Ở đâu | Ghi chú |
|---|---|---|
| **Tên hiển thị** | cả 4 file `.html` + `<title>` | đang để `Tôn Hoàng Nhớ`; nếu muốn tên đầy đủ tiếng Việt thì thay hết |
| **Năm bắt đầu đại học** | `about.html` → Education | đang ghi "Final year", chưa ghi mốc năm |
| **Link repo ChamCong** | `work.html` → entry 2024 | hiện không có link vì repo chưa public |

## Sửa nội dung

- Hero (tên, kicker, một câu statement, link) → `index.html`, khối `<header class="hero">`
- Ba nhóm việc ở trang chủ → `index.html`, `.cols3`
- Danh sách project + filter → `work.html`; `data-type` của entry phải khớp `data-filter` của nút
- Cách làm việc / stack → `research.html`
- Bio, học vấn, kinh nghiệm → `about.html`
- CV → sửa chữ trong `files/cv.html`, rồi chạy `sh files/build-cv.sh` để xuất lại `files/cv.pdf` (1 trang A4)

Màu, độ đậm heading, font: chỉ sửa `css/tokens.css`. Layout: `css/site.css` (hiếm khi cần).
Triết lý thiết kế gốc của template: [`AGENTS.md`](AGENTS.md).

## Chạy thử

```bash
python3 -m http.server 8123        # rồi mở http://localhost:8123
```

## Đưa lên mạng

Repo GitHub → **Settings → Pages → Deploy from a branch** → `main` + `/ (root)`.
Đặt tên repo `nhoton2004.github.io` thì site nằm ở `https://nhoton2004.github.io`.
Netlify / Cloudflare Pages / Vercel cũng chạy được với publish dir `.`, không cần build command.

Lưu ý: remote `origin` vẫn trỏ về repo template của tác giả. Trước khi push, đổi lại:

```bash
git remote set-url origin https://github.com/nhoton2004/<repo-cua-ban>.git
```
