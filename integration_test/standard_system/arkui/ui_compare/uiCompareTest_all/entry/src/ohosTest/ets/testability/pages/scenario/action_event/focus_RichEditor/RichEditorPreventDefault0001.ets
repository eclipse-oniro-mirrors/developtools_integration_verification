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

@Entry
@Component
struct PreventDefault0001 {
  controller: RichEditorController = new RichEditorController()
  controller1: TextInputController = new TextInputController()
  options: RichEditorOptions = { controller: this.controller }
  needFocusKey: string = 'RichEditorKeyboardTest'
  @State lineMetrics: string = ''; // 定义lineMetrics状态变量


  build() {
    Column() {
      RichEditor(this.options)
        .onReady(() => {
          this.controller.addTextSpan('这是一段图文混合内容，后面是一张资源引用类型的图片输入。', {
            style: {
              fontColor: Color.Black,
              fontSize: 15
            },
            gesture:
            {
              onClick: ((event)  => {
                event.preventDefault(); // 阻止默认点击行为
                console.info('文本点击事件触发');
              })

            }
          })
          this.controller.addImageSpan($r('app.media.img2'), {
            imageStyle: {
              size: ['57px', '57px']
            },
            gesture:
            {
              onClick: ((event)  => {
                event.preventDefault(); // 阻止默认点击行为
              })
            }
          })
        })
        .width(300)
        .height(100)

      }
      .width('100%')
      .height('100%')
      .padding(20)
    }
  }

