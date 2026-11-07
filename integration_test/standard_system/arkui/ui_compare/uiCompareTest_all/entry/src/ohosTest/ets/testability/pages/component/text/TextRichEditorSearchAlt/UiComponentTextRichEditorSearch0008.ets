/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct UiComponentTextRichEditorSearch0008 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  logController: RichEditorController = new RichEditorController();
  logOptions: RichEditorOptions = { controller: this.logController };

  build() {
    Column({ space: 10 }) {
      Text('通过editMenuOptions自定义搜索按钮')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })

      Text('主编辑区：')
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.options)
        .id('rich_editor_search_0008')
        .width('100%')
        .height(180)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .editMenuOptions({
          onCreateMenu: (menuItems) => {
            // 在菜单项前面位置插入自定义的"搜索"菜单项，确保在主菜单中显示
            // 插入到第3个位置（索引2），这样"搜索"会在"剪切"、"复制"之后显示
            menuItems.splice(2, 0, {
              content: '搜索'
            } as TextMenuItem)
            return menuItems
          },
          onMenuItemClick: (menuItem, textRange) => {
            // 如果点击的是搜索菜单项，在日志区显示
            if (menuItem.content === '搜索') {
              hilog.info(0x0000, 'TEST', '搜索按钮被点击')
              this.logController.addTextSpan('searched click\n', {
                style: {
                  fontColor: Color.Red,
                  fontSize: 14,
                  fontWeight: FontWeight.Bold
                }
              })
              return true
            }
            return false // 其他菜单项使用默认行为
          }
        })
        .onReady(() => {
          // 添加图文混合内容
          this.controller.addTextSpan('这是第一段测试文本，用于验证自定义搜索菜单的功能。', {
            style: {
              fontColor: Color.Black,
              fontSize: 16
            }
          })
          
          this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
            imageStyle: {
              size: [60, 60],
              layoutStyle: {
                margin: 5
              }
            }
          })
          
          this.controller.addTextSpan('这是第二段测试文本。选中文本后点击搜索按钮，日志区域会显示"searched click"。', {
            style: {
              fontColor: Color.Black,
              fontSize: 16
            }
          })
        })

      Text('日志显示区：')
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .margin({ top: 10 })

      RichEditor(this.logOptions)
        .id('rich_editor_log_0008')
        .width('100%')
        .height(120)
        .backgroundColor('#FFF8DC')
        .border({ width: 2, color: Color.Orange })
        .borderRadius(8)
        .padding(8)
        .onReady(() => {
          this.logController.addTextSpan('[日志输出区域]\n', {
            style: {
              fontColor: Color.Gray,
              fontSize: 12
            }
          })
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

