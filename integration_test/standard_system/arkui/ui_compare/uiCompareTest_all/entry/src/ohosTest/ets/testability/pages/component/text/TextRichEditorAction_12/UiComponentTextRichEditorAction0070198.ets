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
struct UiComponentTextRichEditorAction0070198 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column({ space: 10 }) {
      Text('超长文本三击')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      RichEditor(this.options)
        .id('rich_editor_action_0070198')
        .width('100%')
        .height(500)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .onReady(() => {
          // 使用for循环添加30行文本
          for (let i = 1; i <= 30; i++) {
            this.controller.addTextSpan(`第${i}行：这是超长文本测试内容，用于验证三击选中功能。`, {
              style: {
                fontSize: 16,
                fontColor: Color.Black
              }
            });
            
            // 每3行添加一张图片，共10张
            if (i % 3 === 0 && i / 3 <= 10) {
              this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
                imageStyle: {
                  size: [40, 40],
                  layoutStyle: {
                    margin: 5
                  }
                }
              });
            }
            
            // 添加换行
            if (i < 30) {
              this.controller.addTextSpan('\n', {
                style: {
                  fontSize: 16,
                  fontColor: Color.Black
                }
              });
            }
          }
          
          hilog.info(0x0000, 'TEST', '已添加30行文本和10张图片');
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

