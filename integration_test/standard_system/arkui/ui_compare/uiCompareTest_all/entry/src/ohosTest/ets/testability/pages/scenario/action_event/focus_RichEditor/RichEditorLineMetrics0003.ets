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
struct LineMetrics0003 {
  controller: RichEditorController = new RichEditorController()
  controller1: TextInputController = new TextInputController()
  options: RichEditorOptions = { controller: this.controller }
  needFocusKey: string = 'RichEditorKeyboardTest'
  @State lineMetrics: string = ''; // 定义lineMetrics状态变量

  build() {
    Column() {
      RichEditor(this.options)
        .onReady(() => {
          this.controller.addTextSpan('这是一段图文混合内容，后面是一张资源引用类型的图片输入。\n', {
            style: {
              fontColor: Color.Black,
              fontSize: 15,
            }
          })
          this.controller.addImageSpan($r('app.media.img2'), {
            imageStyle: {
              size: ['57px', '57px']
            }
          })
        })

        .width(300)
        .height(100)
      Text('lineMetrics')
        .fontSize(9).fontColor(0xCCCCCC).width('90%').padding(10)
      Button('调取行信息')
        .id('RElineMetrics0003')
        .onClick(() => {
          let layoutManager: LayoutManager =  this.controller.getLayoutManager()
          let lineMetrics: LineMetrics = layoutManager.getLineMetrics(1);
          this.lineMetrics = 'lineMetrics is' + JSON.stringify(lineMetrics)  + '\n\n'
          if (lineMetrics.runMetrics) {
            lineMetrics.runMetrics.forEach((value, key) => {
              this.lineMetrics += 'runMetrics key is ' + key + ' ' + JSON.stringify(value) + '\n\n';
            });
          }
        })
        .margin({ bottom:20,top :10})
      Text(this.lineMetrics)
        .width('90%')
        .margin({ left: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}