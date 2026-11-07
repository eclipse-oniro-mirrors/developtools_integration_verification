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
struct UiComponentTextRichEditorGundongtiao0001 {
  // 创建RichEditor控制器
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      Row() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan('RichEditor滚动条测试内容，BarState设置为Auto模式', {
              style: {
                fontColor: $r('sys.color.ohos_id_color_text_primary'),
                fontSize: 16
              }
            })
          })
          .id('rich_editor_gundongtiao_0001')
          .width('80%')
          .height(120)
          .margin({ top: 100 })
          .backgroundColor(Color.White)
          .border({
            width: 2,
            color: $r('sys.color.brand')
          })
          .barState(BarState.Auto)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      
      // 添加图文内容按钮
      Button('添加图文内容', { type: ButtonType.Normal, stateEffect: true })
        .id('addContentBtn0001')
        .borderRadius(8)
        .width(120)
        .height(40)
        .margin({ top: 20 })
        .onClick(() => {
          this.controller.addTextSpan('\n这是新增的测试文本内容，用于测试滚动条在Auto模式下的显示效果。当内容超过容器高度时，滚动条会自动显示。', {
            style: {
              fontColor: $r('sys.color.ohos_id_color_text_primary'),
              fontSize: 14
            }
          })
          this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
            imageStyle: {
              size: ['50px', '50px']
            }
          })
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f5f5')
    .padding(20)
  }
}
