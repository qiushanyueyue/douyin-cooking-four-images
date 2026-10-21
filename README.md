# 抖音家常菜四图创作与复盘

中文 AI Agent Skill：将真实照片或视频参考转为四张独立食谱图，支持局部返修、提示词交付与作品数据复盘。

## 四图结构
1. 成品封面：菜名清楚，默认无人物。
2. 备菜用量：文字对应食材照片。
3. 做法步骤：动作、火候、时间、完成判断对应过程图。
4. 食用补充：不露脸的家常吃饭场景。

默认3:4竖幅、手机照片质感、粗白字黑描边。必须实际查看参考资料，检查食材、形状与用量一致性；不将AI图称为实拍，不自动发布。

## 安装
Codex：
```bash
git clone https://github.com/qiushanyueyue/douyin-cooking-four-images.git ~/.codex/skills/douyin-cooking-four-images
```
目标目录已存在时先比较或备份，不直接覆盖定制版本。
Claude Code可改为安装到 `~/.claude/skills/douyin-cooking-four-images`；其他宿主按自己的skill安装方式导入。

## 示例
- “按四图格式做咖喱土豆鸡块，参考我提供的视频。”
- “只重新生成第二张，虾皮改为一小把。”
- “只给我四张提示词，不生成图片。”
- “分析我的五条热门图文，生成PDF并提出可测试的改进。”

## 依赖和限制
这不是独立生图程序。宿主需提供图像生成、参考图查看、文件读写能力。视频需抽帧能力；账号复盘需用户授权的数据访问；PDF需文档工具。
默认使用内置imagegen，不要求API key；工具不可用应报告阻塞。不同宿主的工具与权限不保证兼容。参考资料须有使用权限，遵循平台AI内容标识要求。

## 文件校验
需要Bash和Node.js，在本仓库目录执行：
```bash
bash scripts/check-four-images.sh /absolute/path/metadata.json
```
metadata至少包含 `dish`、四项 `imagePrompts` 和四项互不重复的绝对路径 `images`。脚本仅检查文件非空，不验证图像解码、画幅、文字、食谱或食品安全，仍需视觉/人工检查。

公开版不附带私人账号数据、聊天记录、视频或截图。未添加开源许可证，公开可见不等于授予任意复用许可。
