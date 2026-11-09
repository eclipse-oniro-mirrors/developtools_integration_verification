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
struct UiComponentTextRichEditorLongPressTouying0009 {
  // 创建RichEditor控制器
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  // 选择图片方法
  selectImage() {
    try {
      // 由于图片直接插入到开头，可以直接使用setSelection(0, 1)选择图片
      this.controller.setSelection(0, 1);
      console.info('图片选择成功，选择范围: 0 到 1');
    } catch (error) {
      console.error('选择图片失败:', error);
    }
  }

  build() {
    Column() {
      Row() {
        RichEditor(this.options)
          .onReady(() => {

            // 添加文本内容
            this.controller.addTextSpan('这是文本内容', {
              style: {
                fontSize: 25
              }
            })
            // 添加高度大于组件高度的图片
            this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
              imageStyle: {
                size: ['200px', '200px'] // 图片高度大于RichEditor组件高度(120px)
              }
            })


          })
          .id('rich_editor_longpresstouying_0009')
          .width('80%')
          .height(120)
          .margin({ top: 100 })
          .backgroundColor(Color.White)
          .border({
            width: 2,
            color: $r('sys.color.brand')
          })
          .barState(BarState.Auto)
          .draggable(true)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)

      Button('选择图片', { type: ButtonType.Normal, stateEffect: true })
        .id('button_longpresstouying_0009_select')
        .borderRadius(8)
        .width(80)
        .height(40)
        .margin({ top: 50, left: 20 })
        .onClick(() => {
          this.selectImage();
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f5f5')
    .padding(20)
  }
}
