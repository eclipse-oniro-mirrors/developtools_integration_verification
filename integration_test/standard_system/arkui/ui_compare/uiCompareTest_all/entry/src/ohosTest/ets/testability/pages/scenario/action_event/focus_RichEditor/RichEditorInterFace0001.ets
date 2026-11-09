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
struct ReIFOr0001 {
  private controller: RichEditorController = new RichEditorController();

  build() {
    Column() {
      // 富文本编辑器组件
      RichEditor({ controller: this.controller })
        .width('90%')
        .height(200)
        .backgroundColor('#F8F8F8')
        .onReady(() => this.onEditorReady())  // 添加onReady回调
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }

  // 编辑器初始化完成回调
  private onEditorReady() {
    console.log('RichEditor 初始化完成');

    // 在回调中添加初始化文字
    this.controller.addTextSpan('这是初始化显示的文字内容，', {
      style: {
        fontColor: Color.Black,
        fontSize: 16
      }
    });

    this.controller.addTextSpan('会在组件初始化后自动显示。', {
      style: {
        fontColor: Color.Blue,
        fontSize: 16,
        fontWeight: FontWeight.Bold
      }
    });
  }
}