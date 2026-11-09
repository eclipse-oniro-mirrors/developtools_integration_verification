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

// 导入RichEditor样式类型


@Entry
@Component
struct UiComponentTextRichEditorFloatOff0006 {
  // 左侧“可拖拽 RichEditor”的控制器
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      // 测试按钮：添加预置图文（用于验证样式一致性）
      Button('添加图片超过RichEditor尺寸')
        .id('addSpanBtn0006')
        .width('100%')
        .height(40)
        .backgroundColor(Color.Gray)
        .onClick(() => {
          // 添加一些文本内容
          this.controller.addTextSpan('这是一段很长的文本内容，用于测试RichEditor的滚动功能。当图片超出显示区域时，用户应该能够通过滚动来查看完整内容。')

          // 添加大尺寸图片
          this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
            imageStyle: {
              size: ['300px', '300px'],
            }
          })

        })
        .margin(10)
      Button('选中图文')
        .id('select0006')
        .onClick(()=>{
          this.controller.setSelection(-1,-1)
        })


        Scroll(this.scroller) {
          RichEditor(this.options)
            .id('richEditor0006')
            .width('100%')
            .height(400)
            .border({ width: 1, color: Color.Gray })
            .borderRadius(8)
            .backgroundColor('#ff6e6e6e')
            .padding(8)
            .draggable(true)
        }
        .width('100%')
        .height('16.39%')
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.Auto)
        .scrollBarColor('#999999')
        .scrollBarWidth(8)
        .margin(10)



    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor('#F6F7F9')
  }
}