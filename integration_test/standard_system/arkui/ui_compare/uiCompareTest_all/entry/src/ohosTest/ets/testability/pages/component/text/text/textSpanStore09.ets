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
struct TextSpanStore09 {
  controller: TextController = new TextController();
  options: TextOptions = { controller: this.controller };
  
  // 创建属性字符串，设置StyledStringKey.TEXT_SHADOW包含部分表情
  styledString: StyledString = new StyledString(
    'Hello 😀 World',
    [
      {
        start: 6,  // 表情开始位置
        length: 1,  // 只包含表情的一部分
        styledKey: StyledStringKey.TEXT_SHADOW,
        styledValue: {
          radius: 5,
          color: Color.Red,
          offsetX: 2,
          offsetY: 2
        }
      }
    ]
  );

  async onPageShow() {
    this.controller.setStyledString(this.styledString);
  }

  build() {
    Column() {
      Text('Text组件添加属性字符串，设置StyledStringKey.TEXT_SHADOW包含部分表情')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(undefined, this.options)
        .id('text_span_store_09')
        .fontSize(20)
        .width('90%')
        .padding(10)
        .border({ width: 1, color: Color.Black })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }
}

