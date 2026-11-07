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
struct UiComponentTextRichEditorSearch0011 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column({ space: 10 }) {
      Text('设备不安装华为浏览器，不显示搜索菜单')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      RichEditor(this.options)
        .id('rich_editor_search_0011')
        .width('100%')
        .height(300)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .onReady(() => {
          // 添加图文混合内容
          this.controller.addTextSpan('这是第一段测试文本，用于验证在未安装华为浏览器时不显示搜索菜单。', {
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
          
          this.controller.addTextSpan('这是第二段测试文本，继续添加更多内容以便完整测试选择功能。', {
            style: {
              fontColor: Color.Black,
              fontSize: 16
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

