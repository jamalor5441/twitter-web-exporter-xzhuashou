# Twitter Web Exporter — X抓手 修改版

> 从 Twitter / X 网页版导出推文、书签、列表等数据，支持 JSON / CSV / HTML。
> 本仓库是 [prinsss/twitter-web-exporter](https://github.com/prinsss/twitter-web-exporter) 的**修改版**，供 [X抓手 (X-Claw)](https://github.com/prinsss/twitter-web-exporter) 批量下载流水线使用。

---

## ⚠️ 派生与署名（请先读）

本脚本是一条**派生链**的产物，所有上游署名与 MIT 许可均被完整保留：

| 层级 | 仓库 | 作者 | 许可 |
|------|------|------|------|
| 原版 | [prinsss/twitter-web-exporter](https://github.com/prinsss/twitter-web-exporter) | prin `<hi@prin.studio>` | MIT © 2023 prin |
| 改版 | [jamalor5441/twitter-web-exporter-modified](https://github.com/jamalor5441/twitter-web-exporter-modified) | jamalor5441 | MIT（基于原版） |
| **本版** | 本仓库 | **X抓手 (X-Claw)** | MIT（基于上述二者） |

- 原始 MIT 许可证全文见 [`LICENSE`](./LICENSE)，未作任何删改。
- 本修改版与 prinsss / jamalor5441 **无官方隶属关系**。
- 再分发时须继续包含上述版权与许可声明（脚本头部注释、本文件、LICENSE、NOTICE 均已注明）。

---

## 与本仓库的关系

本仓库中的 `twitter-web-exporter-xzhuashou.user.js` 是 X抓手 项目 `002` 下载器所依赖的用户脚本（通过 ScriptCat / Tampermonkey 注入）。
它在 vjamalor 改版基础上，针对 X抓手 的批量下载流水线做了适配，例如：

- 与 `002start_chrome_遍历然后下载.bat` 流水线对接，点击「下载这个用户推文媒体」按钮即触发整库导出；
- 基于 `export_count`（存于浏览器 IndexedDB）的**增量去重**：仅下载从未导出过的推文，作者上云删本地后再次遍历也只下新增；
- 文件命名遵循 X抓手 项目规范（来自脚本内 `DEFAULT_FILENAME_PATTERN`），与本地 `chrome_downloads` / `003` 整理器对齐。

> 具体代码改动请以脚本内「X抓手 项目备注」注释与 [commit 历史](../../commits) 为准。

---

## 安装

1. 安装用户脚本管理器：
   - [ScriptCat](https://docs.scriptcat.org/)（推荐，本脚本即由其导出）
   - 或 [Tampermonkey](https://www.tampermonkey.net/)
2. 新建脚本，将 `twitter-web-exporter-xzhuashou.user.js` 全文粘贴保存；或直接将文件拖入管理器导入。
3. 脚本运行时通过 `@require` 从 jsDelivr 加载依赖（dayjs / Dexie / i18next / preact 等），需联网。
4. 打开 `twitter.com` / `x.com` 相应用户主页，使用面板按钮导出。

---

## 使用注意（来自 X抓手 项目备注）

- **去重记忆在浏览器 IndexedDB，与本地媒体文件无关**。作者上云删本地后再次遍历只会下增量；
- **切勿清空浏览器数据 / 勿删 `chrome_user_data` / 勿点脚本面板「清空DB」**，否则 `export_count` 归零会导致所有作者整包重下；建议定期用面板「导出DB」备份。

---

## 许可

[MIT License](./LICENSE) — 版权归属见上方派生表与 LICENSE 文件。

---

*本仓库仅作个人数据导出用途，请遵守 X 的服务条款与所在地法律法规。*
