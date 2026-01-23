# Personal page with my public genealogical data

## How to Build

- Build DWR report with Gramps and save it to `dwr` folder
- Go to `patch` folder and apply custom patch to DWR report using `bash patch.sh`
- Compress image files in dwr directory using `bash compress.sh` (optional)
- Build topola-tree `VITE_STATIC_URL=https://raw.githubusercontent.com/eshishkin/heritage/refs/heads/master/gedcom/heritage.ged npm run build`
- Copy generated topola-tree to `web-tree` folder
