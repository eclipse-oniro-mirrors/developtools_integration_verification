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
import { uniformTypeDescriptor, unifiedDataChannel, uniformDataStruct } from '@kit.ArkData';



// 导入RichEditor样式类型


@Entry
@Component
struct UiRichEditorScroll0190 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
 
 
  build() {
    Column() {


      // 测试按钮：添加预置图文（用于验证样式一致性）
      Button('添加多行文本')
        .id('addTextBtn0190')
        .width('100%')
        .height(40)
        .backgroundColor('#4CAF50')
        .onClick(() => {
          this.controller.addTextSpan(
            '=====================start=====================\n'+
            '==================测试滚动文本1==================\n'+
            '==================测试滚动文本2==================\n'+
            '==================测试滚动文本3==================\n'+
            '==================测试滚动文本4==================\n'+
            '==================测试滚动文本5==================\n'+
            '==================测试滚动文本6==================\n'+
            '==================测试滚动文本7==================\n'+
            '==================测试滚动文本8==================\n'+
            '==================测试滚动文本9==================\n'+
            '==================测试滚动文本10=================\n'+
            '==================测试滚动文本===================\n'+
            '======================end======================\n',
            {
            style: {
              fontSize: 15,
              fontColor: Color.Blue
            }
          })
        })
        .margin(10)

      Scroll(this.scroller) {
        RichEditor(this.options)
          .id('richEditor0190')
          .width('100%')
          .height(400)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
      }
      .width('100%')
      .height('16.39%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
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