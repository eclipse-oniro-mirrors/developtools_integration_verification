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
struct CounterTextInput02 {
  @State innerText: string = '';
  @State outerText: string = '';
  @State counterValue: number = 0;

  build() {
    Column({ space: 20 }) {
      Text('Counter组件包含TextInput焦点测试-Tab键方式')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      // 外部TextInput
      TextInput({ placeholder: '外部输入框' })
        .id('outer_textInput')
        .width('80%')
        .height(40)
        .type(InputType.Normal)
        .focusable(true)
        .onChange((value: string) => {
          this.outerText = value;
        })

      // Counter组件包含内部TextInput
      Counter() {
        TextInput({ placeholder: '内部输入框' })
          .id('inner_textInput')
          .width('80%')
          .height(40)
          .type(InputType.Normal)
          .focusable(true)
          .onChange((value: string) => {
            this.innerText = value;
          })
      }
        .id('counter_wrapper')
        .onInc(() => {
          this.counterValue++;
        })
        .onDec(() => {
          this.counterValue--;
        })

      Text('预期效果：先外部输入框获焦，光标闪烁，再内部输入框光标闪烁，不会同时出现两光标')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F3F4F6')
  }
}
